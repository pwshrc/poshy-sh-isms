#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


<#
.SYNOPSIS
    Outputs $true if the path exists and is a directory, $false otherwise.
.PARAMETER Path
    The path to test.
.OUTPUTS
    $true if the path exists and is a directory, $false otherwise.
#>
function Test-d() {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]
        $Path
    )
    return ($Path | Test-Path -ErrorAction SilentlyContinue -PathType Container)
}
