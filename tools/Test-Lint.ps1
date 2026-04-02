Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$ps1Files = Get-ChildItem -Path (Join-Path $repoRoot "tools") -Filter "*.ps1" -File
foreach ($file in $ps1Files) {
    $null = $null
    $errors = $null
    [System.Management.Automation.Language.Parser]::ParseFile($file.FullName, [ref]$null, [ref]$errors) | Out-Null
    if ($errors.Count -gt 0) {
        throw ("PowerShell parse failed for " + $file.FullName + ": " + $errors[0].Message)
    }
}

$manifestPath = Join-Path $repoRoot "docs/source-manifest.template.json"
$null = Get-Content -Raw -Path $manifestPath | ConvertFrom-Json

[ordered]@{
    status = "success"
    powershell_files_checked = $ps1Files.Count
    checks = @(
        "powershell-parse",
        "source-manifest-template-json"
    )
} | ConvertTo-Json -Depth 4
