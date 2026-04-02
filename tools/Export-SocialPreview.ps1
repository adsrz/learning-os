[CmdletBinding()]
param(
    [string]$OutputPath = (Join-Path $PSScriptRoot "..\docs\assets\learning-os-social-card-v4.png")
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Add-Type -AssemblyName System.Drawing

function New-RoundedRectanglePath {
    param(
        [int]$X,
        [int]$Y,
        [int]$Width,
        [int]$Height,
        [int]$Radius
    )

    $diameter = $Radius * 2
    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $path.AddArc($X, $Y, $diameter, $diameter, 180, 90)
    $path.AddArc(($X + $Width - $diameter), $Y, $diameter, $diameter, 270, 90)
    $path.AddArc(($X + $Width - $diameter), ($Y + $Height - $diameter), $diameter, $diameter, 0, 90)
    $path.AddArc($X, ($Y + $Height - $diameter), $diameter, $diameter, 90, 90)
    $path.CloseFigure()
    return $path
}

$resolvedOutput = [System.IO.Path]::GetFullPath($OutputPath)
$outputDir = Split-Path -Parent $resolvedOutput
[System.IO.Directory]::CreateDirectory($outputDir) | Out-Null

$width = 1280
$height = 640
$bitmap = New-Object System.Drawing.Bitmap($width, $height)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$gradient = $null
$shadowBrush = $null
$cardBrush = $null
$borderPen = $null
$eyebrowBrush = $null
$titleBrush = $null
$bodyBrush = $null
$panelBrush = $null
$panelAccentBrush = $null
$tagBrush = $null
$tagTextBrush = $null
$lineBrush = $null
$flowPen = $null
$eyebrowFont = $null
$titleFont = $null
$subtitleFont = $null
$panelTitleFont = $null
$panelBodyFont = $null
$tagFont = $null

try {
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

    $backgroundRect = New-Object System.Drawing.Rectangle(0, 0, $width, $height)
    $gradient = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        $backgroundRect,
        [System.Drawing.ColorTranslator]::FromHtml("#F4EFE4"),
        [System.Drawing.ColorTranslator]::FromHtml("#D8E8DF"),
        18
    )
    $graphics.FillRectangle($gradient, $backgroundRect)

    $shadowBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(24, 30, 50, 38))
    $graphics.FillEllipse($shadowBrush, 920, -80, 420, 280)
    $graphics.FillEllipse($shadowBrush, -140, 450, 360, 220)

    $cardBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#FFFDF8"))
    $borderPen = New-Object System.Drawing.Pen([System.Drawing.ColorTranslator]::FromHtml("#C9D5C6"), 2)
    $cardPath = New-RoundedRectanglePath -X 68 -Y 56 -Width 1144 -Height 528 -Radius 30
    $graphics.FillPath($cardBrush, $cardPath)
    $graphics.DrawPath($borderPen, $cardPath)

    $eyebrowBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#0A7F5A"))
    $titleBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#17281F"))
    $bodyBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#365147"))
    $panelBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#EEF5F1"))
    $panelAccentBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#D3E8DB"))
    $tagBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#E7F1EB"))
    $tagTextBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#20553F"))
    $lineBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#CFE0D7"))

    $eyebrowFont = New-Object System.Drawing.Font("Segoe UI Semibold", 18, [System.Drawing.FontStyle]::Regular)
    $titleFont = New-Object System.Drawing.Font("Segoe UI Semibold", 38, [System.Drawing.FontStyle]::Regular)
    $subtitleFont = New-Object System.Drawing.Font("Segoe UI", 17, [System.Drawing.FontStyle]::Regular)
    $panelTitleFont = New-Object System.Drawing.Font("Segoe UI Semibold", 18, [System.Drawing.FontStyle]::Regular)
    $panelBodyFont = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Regular)
    $tagFont = New-Object System.Drawing.Font("Segoe UI Semibold", 13, [System.Drawing.FontStyle]::Regular)

    $graphics.DrawString("LEARNING OS", $eyebrowFont, $eyebrowBrush, 118, 110)
    $graphics.DrawString("AI-native study harness.", $titleFont, $titleBrush, 116, 150)

    $subtitleLayout = New-Object System.Drawing.RectangleF(120, 232, 470, 110)
    $subtitle = "Local-first deep reading, synthesis, thesis-style reading, and research with explicit sources, validation, and durable write-back."
    $graphics.DrawString($subtitle, $subtitleFont, $bodyBrush, $subtitleLayout)

    $tagSpecs = @(
        @{ Text = "BYOS"; X = 120; Y = 356; Width = 90 },
        @{ Text = "AI Harness"; X = 224; Y = 356; Width = 128 },
        @{ Text = "Public-safe"; X = 366; Y = 356; Width = 130 },
        @{ Text = "MIT"; X = 510; Y = 356; Width = 75 }
    )

    foreach ($tag in $tagSpecs) {
        $tagPath = New-RoundedRectanglePath -X $tag.X -Y $tag.Y -Width $tag.Width -Height 38 -Radius 18
        $graphics.FillPath($tagBrush, $tagPath)
        $graphics.DrawString($tag.Text, $tagFont, $tagTextBrush, ($tag.X + 16), ($tag.Y + 8))
        $tagPath.Dispose()
    }

    $pillarsTitleLayout = New-Object System.Drawing.RectangleF(688, 112, 420, 34)
    $graphics.DrawString("Harness loop", $eyebrowFont, $eyebrowBrush, $pillarsTitleLayout)
    $graphics.FillRectangle($lineBrush, 688, 154, 452, 2)

    $panels = @(
        @{ Title = "Source intake"; Body = "Bring your own local sources."; X = 688; Y = 184; Width = 208; Height = 118 },
        @{ Title = "Workflow routing"; Body = "Route reading by mode, not one flat prompt."; X = 928; Y = 184; Width = 208; Height = 118 },
        @{ Title = "Validation gates"; Body = "Check setup, repo safety, and boundaries."; X = 688; Y = 328; Width = 208; Height = 118 },
        @{ Title = "Write-back"; Body = "Persist durable state beyond a chat turn."; X = 928; Y = 328; Width = 208; Height = 118 }
    )

    foreach ($panel in $panels) {
        $panelPath = New-RoundedRectanglePath -X $panel.X -Y $panel.Y -Width $panel.Width -Height $panel.Height -Radius 22
        $accentPath = New-RoundedRectanglePath -X ($panel.X + 16) -Y ($panel.Y + 16) -Width 68 -Height 24 -Radius 12
        $graphics.FillPath($panelBrush, $panelPath)
        $graphics.DrawPath($borderPen, $panelPath)
        $graphics.FillPath($panelAccentBrush, $accentPath)
        $graphics.DrawString($panel.Title, $panelTitleFont, $titleBrush, ($panel.X + 18), ($panel.Y + 50))
        $bodyLayout = New-Object System.Drawing.RectangleF(($panel.X + 18), ($panel.Y + 76), ($panel.Width - 32), 42)
        $graphics.DrawString($panel.Body, $panelBodyFont, $bodyBrush, $bodyLayout)
        $panelPath.Dispose()
        $accentPath.Dispose()
    }

    $flowLayout = New-Object System.Drawing.RectangleF(120, 442, 1020, 76)
    $flowText = "Bring sources -> map materials -> route workflow -> run the agent -> validate -> keep durable state"
    $graphics.DrawString($flowText, $subtitleFont, $bodyBrush, $flowLayout)

    $bitmap.Save($resolvedOutput, [System.Drawing.Imaging.ImageFormat]::Png)
    $cardPath.Dispose()
}
finally {
    if ($null -ne $gradient) { $gradient.Dispose() }
    if ($null -ne $shadowBrush) { $shadowBrush.Dispose() }
    if ($null -ne $cardBrush) { $cardBrush.Dispose() }
    if ($null -ne $borderPen) { $borderPen.Dispose() }
    if ($null -ne $eyebrowBrush) { $eyebrowBrush.Dispose() }
    if ($null -ne $titleBrush) { $titleBrush.Dispose() }
    if ($null -ne $bodyBrush) { $bodyBrush.Dispose() }
    if ($null -ne $panelBrush) { $panelBrush.Dispose() }
    if ($null -ne $panelAccentBrush) { $panelAccentBrush.Dispose() }
    if ($null -ne $tagBrush) { $tagBrush.Dispose() }
    if ($null -ne $tagTextBrush) { $tagTextBrush.Dispose() }
    if ($null -ne $lineBrush) { $lineBrush.Dispose() }
    if ($null -ne $eyebrowFont) { $eyebrowFont.Dispose() }
    if ($null -ne $titleFont) { $titleFont.Dispose() }
    if ($null -ne $subtitleFont) { $subtitleFont.Dispose() }
    if ($null -ne $panelTitleFont) { $panelTitleFont.Dispose() }
    if ($null -ne $panelBodyFont) { $panelBodyFont.Dispose() }
    if ($null -ne $tagFont) { $tagFont.Dispose() }
    if ($null -ne $graphics) { $graphics.Dispose() }
    if ($null -ne $bitmap) { $bitmap.Dispose() }
}

@{
    status = "success"
    output = $resolvedOutput
} | ConvertTo-Json -Depth 4
