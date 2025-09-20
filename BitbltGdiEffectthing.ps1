Add-Type @"
using System;
using System.Runtime.InteropServices;

public class GDI
{
    [DllImport("user32.dll")]
    public static extern IntPtr GetDC(IntPtr hwnd);

    [DllImport("gdi32.dll")]
    public static extern bool BitBlt(
        IntPtr hdcDest, int nXDest, int nYDest, int nWidth, int nHeight,
        IntPtr hdcSrc, int nXSrc, int nYSrc, int dwRop);

    [DllImport("user32.dll")]
    public static extern int GetSystemMetrics(int nIndex);

    [DllImport("kernel32.dll")]
    public static extern void Sleep(uint dwMilliseconds);
}
"@

# Constants for BitBlt raster operations
$SRCAND = 0x8800C6

# Get desktop DC and screen size
$hdc = [GDI]::GetDC([IntPtr]::Zero)
$w = [GDI]::GetSystemMetrics(0)
$h = [GDI]::GetSystemMetrics(1)

# Random object for PowerShell
$rand = New-Object System.Random

Write-Host "Press Ctrl+C in this window to stop the effect."

while ($true) {
    $x1 = $rand.Next(0,2)
    $y1 = $rand.Next(0,2)
    $x2 = $rand.Next(0,2)
    $y2 = $rand.Next(0,2)
    [GDI]::BitBlt($hdc, $x1, $y1, $w, $h, $hdc, $x2, $y2, $SRCAND) | Out-Null
    [GDI]::Sleep(0)
}