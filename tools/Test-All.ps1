param(
    [switch]$RepoOnly
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Write-Host "[validate] lint"
& (Join-Path $PSScriptRoot "Test-Lint.ps1")

Write-Host "[validate] public setup"
if ($RepoOnly) {
    & (Join-Path $PSScriptRoot "Test-PublicSetup.ps1") -RepoOnly
} else {
    & (Join-Path $PSScriptRoot "Test-PublicSetup.ps1")
}

Write-Host "[validate] all checks passed"
