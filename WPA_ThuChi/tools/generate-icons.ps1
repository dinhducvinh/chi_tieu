Add-Type -AssemblyName System.Drawing

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$iconDir = Join-Path $root "icons"
New-Item -ItemType Directory -Path $iconDir -Force | Out-Null

function New-AppIcon([int]$size, [string]$name) {
    $bitmap = New-Object System.Drawing.Bitmap($size, $size)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.Clear([System.Drawing.ColorTranslator]::FromHtml("#0E2A33"))

    $pink = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#C2255C"))
    $white = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    $green = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#4FD1A5"))
    $inkColor = [System.Drawing.ColorTranslator]::FromHtml("#0E2A33")

    $margin = [int]($size * 0.20)
    $diameter = $size - 2 * $margin
    $graphics.FillEllipse($pink, $margin, $margin, $diameter, $diameter)

    [System.Drawing.PointF[]]$receipt = @(
        [System.Drawing.PointF]::new($size * 0.34, $size * 0.27),
        [System.Drawing.PointF]::new($size * 0.66, $size * 0.27),
        [System.Drawing.PointF]::new($size * 0.66, $size * 0.70),
        [System.Drawing.PointF]::new($size * 0.60, $size * 0.66),
        [System.Drawing.PointF]::new($size * 0.55, $size * 0.70),
        [System.Drawing.PointF]::new($size * 0.50, $size * 0.66),
        [System.Drawing.PointF]::new($size * 0.45, $size * 0.70),
        [System.Drawing.PointF]::new($size * 0.40, $size * 0.66),
        [System.Drawing.PointF]::new($size * 0.34, $size * 0.70)
    )
    $graphics.FillPolygon($white, $receipt)

    $lineWidth = [Math]::Max(3, $size * 0.026)
    $linePen = New-Object System.Drawing.Pen($inkColor, $lineWidth)
    $linePen.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $linePen.EndCap = [System.Drawing.Drawing2D.LineCap]::Round
    $graphics.DrawLine($linePen, $size * 0.40, $size * 0.39, $size * 0.60, $size * 0.39)
    $graphics.DrawLine($linePen, $size * 0.40, $size * 0.49, $size * 0.57, $size * 0.49)
    $graphics.DrawLine($linePen, $size * 0.49, $size * 0.59, $size * 0.60, $size * 0.59)

    $dot = [int]($size * 0.105)
    $dotX = [int]($size * 0.67)
    $dotY = [int]($size * 0.68)
    $graphics.FillEllipse($green, $dotX, $dotY, $dot, $dot)

    $path = Join-Path $iconDir $name
    $bitmap.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)

    $linePen.Dispose()
    $green.Dispose()
    $white.Dispose()
    $pink.Dispose()
    $graphics.Dispose()
    $bitmap.Dispose()
}

New-AppIcon 180 "icon-180.png"
New-AppIcon 192 "icon-192.png"
New-AppIcon 512 "icon-512.png"
