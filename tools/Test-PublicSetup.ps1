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

$repoRoot = Split-Path -Parent $PSScriptRoot
$requiredRepoFiles = @(
    "README.md",
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
    "docs/source-manifest.template.json",
    "projects/README.md",
    "projects/github-submission-cold-path/README.md",
    "projects/github-submission-cold-path/project.md",
    "projects/github-submission-cold-path/session-log.md",
    "projects/github-submission-cold-path/open-questions.md",
    "projects/github-submission-cold-path/distinctions.md",
    "projects/github-submission-cold-path/submission-record.md",
    "samples/open/demo-source.md",
    "samples/open/demo-source-2.md",
    "tools/Test-All.ps1",
    "tools/Test-Lint.ps1",
    "tools/Test-PublicSetup.ps1",
    "tools/Import-LocalSources.ps1",
    "agent/skills/index.json"
)

foreach ($relativePath in $requiredRepoFiles) {
    Assert-Setup (Test-Path (Join-Path $repoRoot $relativePath)) ("Missing required repo file: " + $relativePath)
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
        "source manifest template schema"
    )
    warnings = @($warnings)
} | ConvertTo-Json -Depth 4
