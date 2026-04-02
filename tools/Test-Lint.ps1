Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Assert-Lint {
    param(
        [bool]$Condition,
        [string]$Message
    )

    if (-not $Condition) {
        throw $Message
    }
}

function Convert-ToStringArray {
    param(
        [object]$Value
    )

    if ($null -eq $Value) {
        return @()
    }

    $items = @()
    if ($Value -is [string]) {
        $items = @($Value)
    }
    else {
        $items = @($Value)
    }

    return ,([string[]]@($items | ForEach-Object { [string]$_ }))
}

function Assert-TargetsSubset {
    param(
        [string[]]$Targets,
        [string[]]$AllowedTargets,
        [string]$Context
    )

    foreach ($target in $Targets) {
        Assert-Lint ($AllowedTargets -contains $target) ($Context + " contains unknown write-back target: " + $target)
    }
}

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
if ($null -eq $aiContext.durable_write_back_scope) {
    throw "ai-context.json is missing durable_write_back_scope"
}
if ($null -eq $aiContext.durable_write_back_template_root) {
    throw "ai-context.json is missing durable_write_back_template_root"
}
if ($null -eq $aiContext.durable_write_back_tracked_repo) {
    throw "ai-context.json is missing durable_write_back_tracked_repo"
}
if ($null -eq $aiContext.durable_write_back_targets) {
    throw "ai-context.json is missing durable_write_back_targets"
}

$taskRouterPath = Join-Path $repoRoot "task-router.json"
$taskRouter = Get-Content -Raw -Path $taskRouterPath | ConvertFrom-Json
if ($null -eq $taskRouter.version) {
    throw "task-router.json is missing version"
}
if ($null -eq $taskRouter.task_types) {
    throw "task-router.json is missing task_types"
}

$writebackMapPath = Join-Path $repoRoot "writeback-map.json"
$writebackMap = Get-Content -Raw -Path $writebackMapPath | ConvertFrom-Json
if ($null -eq $writebackMap.version) {
    throw "writeback-map.json is missing version"
}
if ($null -eq $writebackMap.default_target_scope) {
    throw "writeback-map.json is missing default_target_scope"
}
if ($null -eq $writebackMap.default_target_tracked_repo) {
    throw "writeback-map.json is missing default_target_tracked_repo"
}
if ($null -eq $writebackMap.default_target_template_root) {
    throw "writeback-map.json is missing default_target_template_root"
}
if ($null -eq $writebackMap.default_targets) {
    throw "writeback-map.json is missing default_targets"
}
if ($null -eq $writebackMap.workflow_modes) {
    throw "writeback-map.json is missing workflow_modes"
}

$skillIndexPath = Join-Path $repoRoot "agent/skills/index.json"
$skillIndex = Get-Content -Raw -Path $skillIndexPath | ConvertFrom-Json
if ($null -eq $skillIndex.version) {
    throw "agent/skills/index.json is missing version"
}
if ($null -eq $skillIndex.skills) {
    throw "agent/skills/index.json is missing skills"
}

$defaultTargetScope = [string]$writebackMap.default_target_scope
$defaultTemplateRoot = [string]$writebackMap.default_target_template_root
$defaultTargetTrackedRepo = [bool]$writebackMap.default_target_tracked_repo
$defaultTargets = Convert-ToStringArray $writebackMap.default_targets
$writebackWorkflowModes = @($writebackMap.workflow_modes.PSObject.Properties.Name | ForEach-Object { [string]$_ })
$aiWorkflowModes = Convert-ToStringArray $aiContext.workflow_modes
$aiDurableTargets = Convert-ToStringArray $aiContext.durable_write_back_targets

Assert-Lint ($defaultTargetScope -eq "user-local-project") "writeback-map.json default_target_scope must be user-local-project"
Assert-Lint (-not [bool]$writebackMap.default_target_tracked_repo) "writeback-map.json default_target_tracked_repo must be false"
Assert-Lint ($defaultTemplateRoot -eq "templates/project-template") "writeback-map.json default_target_template_root must equal templates/project-template"
Assert-Lint ($aiContext.durable_write_back_scope -eq $defaultTargetScope) "ai-context.json durable_write_back_scope does not match writeback-map.json"
Assert-Lint ($aiContext.durable_write_back_template_root -eq $defaultTemplateRoot) "ai-context.json durable_write_back_template_root does not match writeback-map.json"
Assert-Lint ([bool]$aiContext.durable_write_back_tracked_repo -eq $defaultTargetTrackedRepo) "ai-context.json durable_write_back_tracked_repo does not match writeback-map.json"
Assert-Lint ((($aiWorkflowModes | Sort-Object) -join "|") -eq (($writebackWorkflowModes | Sort-Object) -join "|")) "ai-context.json workflow_modes do not match writeback-map.json"
Assert-Lint ((($aiDurableTargets | Sort-Object) -join "|") -eq (($defaultTargets | Sort-Object) -join "|")) "ai-context.json durable_write_back_targets do not match writeback-map.json"

foreach ($workflowModeName in $writebackWorkflowModes) {
    $workflowModeConfig = $writebackMap.workflow_modes.$workflowModeName
    Assert-Lint ($null -ne $workflowModeConfig.target_scope) ("writeback-map.json workflow mode is missing target_scope: " + $workflowModeName)
    Assert-Lint ($workflowModeConfig.PSObject.Properties.Name -contains "target_tracked_repo") ("writeback-map.json workflow mode is missing target_tracked_repo: " + $workflowModeName)
    Assert-Lint ($workflowModeConfig.PSObject.Properties.Name -contains "target_template_root") ("writeback-map.json workflow mode is missing target_template_root: " + $workflowModeName)
    Assert-Lint ($workflowModeConfig.target_scope -eq $defaultTargetScope) ("writeback-map.json workflow mode target_scope drifted: " + $workflowModeName)
    Assert-Lint ([bool]$workflowModeConfig.target_tracked_repo -eq $defaultTargetTrackedRepo) ("writeback-map.json workflow mode target_tracked_repo drifted: " + $workflowModeName)
    Assert-Lint ($workflowModeConfig.target_template_root -eq $defaultTemplateRoot) ("writeback-map.json workflow mode target_template_root drifted: " + $workflowModeName)
    Assert-TargetsSubset -Targets (Convert-ToStringArray $workflowModeConfig.required_targets) -AllowedTargets $defaultTargets -Context ("writeback-map.json required_targets for " + $workflowModeName)
    Assert-TargetsSubset -Targets (Convert-ToStringArray $workflowModeConfig.recommended_targets) -AllowedTargets $defaultTargets -Context ("writeback-map.json recommended_targets for " + $workflowModeName)
}

foreach ($taskTypeName in @($taskRouter.task_types.PSObject.Properties.Name | ForEach-Object { [string]$_ })) {
    $taskType = $taskRouter.task_types.$taskTypeName
    $writeBackTargets = Convert-ToStringArray $taskType.write_back_targets
    Assert-Lint ($taskType.PSObject.Properties.Name -contains "write_back_target_scope") ("task-router.json task type is missing write_back_target_scope: " + $taskTypeName)
    Assert-Lint ($taskType.PSObject.Properties.Name -contains "write_back_template_root") ("task-router.json task type is missing write_back_template_root: " + $taskTypeName)
    Assert-Lint ($taskType.PSObject.Properties.Name -contains "write_back_target_tracked_repo") ("task-router.json task type is missing write_back_target_tracked_repo: " + $taskTypeName)
    if ($writeBackTargets.Count -eq 0) {
        Assert-Lint ([string]::IsNullOrWhiteSpace([string]$taskType.write_back_target_scope)) ("task-router.json empty write-back task should not declare write_back_target_scope: " + $taskTypeName)
        Assert-Lint ([string]::IsNullOrWhiteSpace([string]$taskType.write_back_template_root)) ("task-router.json empty write-back task should not declare write_back_template_root: " + $taskTypeName)
        Assert-Lint ($null -eq $taskType.write_back_target_tracked_repo) ("task-router.json empty write-back task should not declare write_back_target_tracked_repo: " + $taskTypeName)
    }
    else {
        Assert-Lint ($taskType.write_back_target_scope -eq $defaultTargetScope) ("task-router.json write_back_target_scope drifted: " + $taskTypeName)
        Assert-Lint ($taskType.write_back_template_root -eq $defaultTemplateRoot) ("task-router.json write_back_template_root drifted: " + $taskTypeName)
        Assert-Lint ([bool]$taskType.write_back_target_tracked_repo -eq $defaultTargetTrackedRepo) ("task-router.json write_back_target_tracked_repo drifted: " + $taskTypeName)
        Assert-TargetsSubset -Targets $writeBackTargets -AllowedTargets $defaultTargets -Context ("task-router.json write_back_targets for " + $taskTypeName)
        $minimalReadSet = Convert-ToStringArray $taskType.minimal_read_set
        Assert-Lint ($minimalReadSet -contains ($defaultTemplateRoot + "/README.md")) ("task-router.json write-back task must include the template read target: " + $taskTypeName)
    }

    $taskWorkflowMode = [string]$taskType.workflow_mode
    if (-not [string]::IsNullOrWhiteSpace($taskWorkflowMode)) {
        Assert-Lint ($writebackWorkflowModes -contains $taskWorkflowMode) ("task-router.json references unknown workflow_mode: " + $taskTypeName)
    }
}

foreach ($skillEntry in @($skillIndex.skills)) {
    $skillId = [string]$skillEntry.id
    $skillTargets = Convert-ToStringArray $skillEntry.write_back_targets
    Assert-Lint ($skillEntry.PSObject.Properties.Name -contains "write_back_target_scope") ("agent/skills/index.json skill is missing write_back_target_scope: " + $skillId)
    Assert-Lint ($skillEntry.PSObject.Properties.Name -contains "write_back_template_root") ("agent/skills/index.json skill is missing write_back_template_root: " + $skillId)
    Assert-Lint ($skillEntry.PSObject.Properties.Name -contains "write_back_target_tracked_repo") ("agent/skills/index.json skill is missing write_back_target_tracked_repo: " + $skillId)
    Assert-Lint ($skillEntry.write_back_target_scope -eq $defaultTargetScope) ("agent/skills/index.json write_back_target_scope drifted: " + $skillId)
    Assert-Lint ($skillEntry.write_back_template_root -eq $defaultTemplateRoot) ("agent/skills/index.json write_back_template_root drifted: " + $skillId)
    Assert-Lint ([bool]$skillEntry.write_back_target_tracked_repo -eq $defaultTargetTrackedRepo) ("agent/skills/index.json write_back_target_tracked_repo drifted: " + $skillId)
    Assert-TargetsSubset -Targets $skillTargets -AllowedTargets $defaultTargets -Context ("agent/skills/index.json write_back_targets for " + $skillId)
    foreach ($workflowMode in (Convert-ToStringArray $skillEntry.workflow_modes)) {
        Assert-Lint ($writebackWorkflowModes -contains $workflowMode) ("agent/skills/index.json references unknown workflow_mode: " + $skillId + " -> " + $workflowMode)
    }
}

[ordered]@{
    status = "success"
    powershell_files_checked = $ps1Files.Count
    checks = @(
        "powershell-parse",
        "source-manifest-template-json",
        "ai-context-json",
        "task-router-json",
        "writeback-map-json",
        "skill-index-json",
        "write-back-contract-coherence"
    )
} | ConvertTo-Json -Depth 4
