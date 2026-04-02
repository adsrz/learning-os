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
$aiContextPath = Join-Path $repoRoot "ai-context.json"
$aiContext = Get-Content -Raw -Path $aiContextPath | ConvertFrom-Json
if ($null -eq $aiContext.version) {
    throw "ai-context.json is missing version"
}
if ($null -eq $aiContext.fast_read_order) {
    throw "ai-context.json is missing fast_read_order"
}
if ($null -eq $aiContext.workflow_modes) {
    throw "ai-context.json is missing workflow_modes"
}

[ordered]@{
    status = "success"
    powershell_files_checked = $ps1Files.Count
    checks = @(
        "powershell-parse",
        "source-manifest-template-json",
        "ai-context-json"
    )
} | ConvertTo-Json -Depth 4
