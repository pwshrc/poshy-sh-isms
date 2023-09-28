#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


<#
.SYNOPSIS
    Outputs $true if the path is executable, $false otherwise.
.PARAMETER Path
    The path to test.
.OUTPUTS
    $true if the path is executable, $false otherwise.
#>
function Test-x() {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]
        $Path
    )

    if (Test-Path -ErrorAction SilentlyContinue -Path $path) {
        [bool[]] $isExecutable = Get-Item $Path | ForEach-Object { (Get-ItemNixMode $_.FullName) -band [System.IO.UnixFileMode]::UserExecute }
        return ($isExecutable -notcontains $false)
    } else {
        return $false
    }
}
