param(
    [Parameter(Mandatory = $true)]
    [string]$SourceRoot,

    [string]$ManifestPath = "",

    [ValidateSet("Copy", "Move")]
    [string]$Mode = "Copy"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$resolvedSourceRoot = [System.IO.Path]::GetFullPath($SourceRoot)
if (-not (Test-Path $resolvedSourceRoot)) {
    throw ("SourceRoot does not exist: " + $resolvedSourceRoot)
}

if ([string]::IsNullOrWhiteSpace($ManifestPath)) {
    $ManifestPath = Join-Path $repoRoot "docs/source-manifest.template.json"
}

$manifest = Get-Content -Raw -Path $ManifestPath | ConvertFrom-Json
$results = [System.Collections.Generic.List[object]]::new()

foreach ($entry in $manifest.entries) {
    $targetRelativePath = [string]$entry.target_relative_path
    $matchNames = @($entry.match_names)
    if ([string]::IsNullOrWhiteSpace($targetRelativePath) -or $matchNames.Count -eq 0) {
        continue
    }

    $matches = Get-ChildItem -Path $resolvedSourceRoot -Recurse -File | Where-Object { $_.Name -in $matchNames }
    if ($matches.Count -eq 1) {
        $targetPath = Join-Path $repoRoot $targetRelativePath
        $targetDir = Split-Path -Parent $targetPath
        if (-not (Test-Path $targetDir)) {
            New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
        }

        if ($Mode -eq "Copy") {
            Copy-Item -LiteralPath $matches[0].FullName -Destination $targetPath -Force
        } else {
            Move-Item -LiteralPath $matches[0].FullName -Destination $targetPath -Force
        }

        $results.Add([ordered]@{
            source_id = [string]$entry.source_id
            status = "imported"
            target_relative_path = $targetRelativePath
            matched_file = $matches[0].FullName
        })
    } elseif ($matches.Count -eq 0) {
        $results.Add([ordered]@{
            source_id = [string]$entry.source_id
            status = "missing"
            target_relative_path = $targetRelativePath
        })
    } else {
        $results.Add([ordered]@{
            source_id = [string]$entry.source_id
            status = "ambiguous"
            target_relative_path = $targetRelativePath
            matched_files = @($matches | Select-Object -ExpandProperty FullName)
        })
    }
}

$localManifestDir = Join-Path $repoRoot "sources"
if (-not (Test-Path $localManifestDir)) {
    New-Item -ItemType Directory -Path $localManifestDir -Force | Out-Null
}

$localManifestPath = Join-Path $localManifestDir "local-manifest.json"
[ordered]@{
    version = 1
    generated_at = (Get-Date).ToString("o")
    entries = @($results)
} | ConvertTo-Json -Depth 6 | Set-Content -Path $localManifestPath -Encoding utf8NoBOM

[ordered]@{
    status = "success"
    mode = $Mode.ToLowerInvariant()
    source_root = $resolvedSourceRoot
    local_manifest = "sources/local-manifest.json"
    results = @($results)
} | ConvertTo-Json -Depth 6
