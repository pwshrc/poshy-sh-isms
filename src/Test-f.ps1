#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


<#
.SYNOPSIS
    Outputs whether the given path exists and is a file.
.PARAMETER Path
    The path to test.
.OUTPUTS
    $true if the path exists and is a file, $false otherwise.
#>
function Test-f() {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]
        $Path
    )
    return ($Path | Test-Path -ErrorAction SilentlyContinue -PathType Leaf)
}
