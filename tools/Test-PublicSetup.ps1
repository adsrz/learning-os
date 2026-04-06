param(
    [switch]$RepoOnly
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Assert-Setup {
    param(
        [bool]$Condition,
        [string]$Message
    )

    if (-not $Condition) {
        throw $Message
    }
}

function Get-RepoRelativePath {
    param(
        [string]$RepoRoot,
        [string]$FullPath
    )

    $repoAbsolutePath = [System.IO.Path]::GetFullPath($RepoRoot)
    if (-not $repoAbsolutePath.EndsWith([System.IO.Path]::DirectorySeparatorChar)) {
        $repoAbsolutePath += [System.IO.Path]::DirectorySeparatorChar
    }

    $targetAbsolutePath = [System.IO.Path]::GetFullPath($FullPath)
    $repoUri = [System.Uri]::new($repoAbsolutePath)
    $targetUri = [System.Uri]::new($targetAbsolutePath)
    $relativeUri = $repoUri.MakeRelativeUri($targetUri)
    return ([System.Uri]::UnescapeDataString($relativeUri.ToString())).Replace('\', '/')
}

function Test-AllowedMaintainerStatePath {
    param(
        [string]$RelativePath,
        [string[]]$AllowedPrefixes
    )

    foreach ($prefix in $AllowedPrefixes) {
        if ($RelativePath.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) {
            return $true
        }
    }

    return $false
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$requiredRepoFiles = @(
    "AGENTS.md",
    "README.md",
    "README.zh-CN.md",
    "AI_CONTEXT.md",
    "ai-context.json",
    "task-router.json",
    "writeback-map.json",
    "LICENSE",
    "system.md",
    "system_detail.md",
    "docs/architecture.md",
    "docs/workflow-modes.md",
    "docs/public-setup.md",
    "docs/bring-your-own-sources.md",
    "docs/run-with-codex.md",
    "docs/demo-flow.md",
    "docs/source-manifest.template.json",
    "samples/open/demo-source.md",
    "samples/open/demo-source-2.md",
    "tools/Test-All.ps1",
    "tools/Test-Lint.ps1",
    "tools/Test-PublicSetup.ps1",
    "tools/Import-LocalSources.ps1",
    "agent/README.md",
    "agent/skills/index.json",
    "templates/project-template/README.md"
)

foreach ($relativePath in $requiredRepoFiles) {
    Assert-Setup (Test-Path (Join-Path $repoRoot $relativePath)) ("Missing required repo file: " + $relativePath)
}

$maintainerStateFileNames = @(
    "owner.md",
    "project.md",
    "session-log.md",
    "open-questions.md",
    "distinctions.md",
    "submission-record.md"
)
$allowedMaintainerStatePrefixes = @(
    "examples/",
    "templates/project-template/"
)
$maintainerStateFiles = Get-ChildItem -Path $repoRoot -Recurse -File | Where-Object { $maintainerStateFileNames -contains $_.Name }
foreach ($file in $maintainerStateFiles) {
    $relativePath = Get-RepoRelativePath -RepoRoot $repoRoot -FullPath $file.FullName
    Assert-Setup (Test-AllowedMaintainerStatePath -RelativePath $relativePath -AllowedPrefixes $allowedMaintainerStatePrefixes) ("Forbidden maintainer-state file present in public repo: " + $relativePath)
}

$forbiddenReferencePatterns = @(
    "docs/public-export/",
    "docs\\public-export\\",
    "learning-os-public/",
    "learning-os-public\\",
    "owner.md",
    "projects/",
    "projects\\",
    "submission-record.md"
)
$forbiddenReferenceFiles = @(
    "README.md",
    "README.zh-CN.md",
    "AI_CONTEXT.md",
    "ai-context.json",
    "task-router.json",
    "system_detail.md",
    "docs/run-with-codex.md"
)

foreach ($relativePath in $forbiddenReferenceFiles) {
    $fullPath = Join-Path $repoRoot $relativePath
    $content = Get-Content -Raw -Path $fullPath
    foreach ($pattern in $forbiddenReferencePatterns) {
        Assert-Setup (-not $content.Contains($pattern)) ("Forbidden maintainer-routing reference found in public repo surface: " + $relativePath + " -> " + $pattern)
    }
}

$forkFreeWriteBackSurfaceFiles = @(
    "README.md",
    "README.zh-CN.md",
    "AI_CONTEXT.md",
    "agent/README.md",
    "docs/run-with-codex.md",
    "docs/demo-flow.md",
    "templates/project-template/README.md"
)

foreach ($relativePath in $forkFreeWriteBackSurfaceFiles) {
    $content = Get-Content -Raw -Path (Join-Path $repoRoot $relativePath)
    Assert-Setup (-not [regex]::IsMatch($content, '(?i)\bfork\b')) ("Fork-based write-back guidance is forbidden on public onboarding surfaces: " + $relativePath)
}

$manifestPath = Join-Path $repoRoot "docs/source-manifest.template.json"
$manifest = Get-Content -Raw -Path $manifestPath | ConvertFrom-Json
Assert-Setup ($null -ne $manifest.version) "docs/source-manifest.template.json is missing version"
Assert-Setup ($null -ne $manifest.entries) "docs/source-manifest.template.json is missing entries"

$warnings = [System.Collections.Generic.List[string]]::new()
if ($RepoOnly) {
    $warnings.Add("RepoOnly mode skipped local source existence checks.")
}

if (-not $RepoOnly) {
    $localManifestPath = Join-Path $repoRoot "sources/local-manifest.json"
    if (-not (Test-Path $localManifestPath)) {
        $warnings.Add("sources/local-manifest.json was not found. BYOS import has not been configured yet.")
    } else {
        $localManifest = Get-Content -Raw -Path $localManifestPath | ConvertFrom-Json
        if ($null -ne $localManifest.entries) {
            foreach ($entry in $localManifest.entries) {
                if (-not [string]::IsNullOrWhiteSpace($entry.target_relative_path)) {
                    $targetPath = Join-Path $repoRoot $entry.target_relative_path
                    if (-not (Test-Path $targetPath)) {
                        $warnings.Add("Missing local source: " + $entry.target_relative_path)
                    }
                }
            }
        }
    }
}

[ordered]@{
    status = "success"
    mode = $(if ($RepoOnly) { "repo-only" } else { "full-local-setup" })
    checks = @(
        "required public files",
        "forbidden maintainer-state file families",
        "forbidden maintainer-routing references",
        "fork-free local write-back guidance",
        "source manifest template schema"
    )
    warnings = @($warnings)
} | ConvertTo-Json -Depth 4
