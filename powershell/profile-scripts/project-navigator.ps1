# ============================================
# Project Navigation with Tab Completion
# ============================================
# A PowerShell utility to quickly navigate between your development projects
# with tab completion and interactive menu support.
#
# Author: Community Contribution
# License: MIT
#
# Usage:
#   cdp                    list projects
#   cdp <name>             jump to project
#   cdp add <name> [path]  add/update project (default: cwd), saved to this file
#   cdp rm <name>          remove project, saved to this file
# ============================================

# Path of this file; `cdp add`/`cdp rm` rewrite the $global:Projects block in it
$script:NavigatorFile = $PSCommandPath

# Define your projects here (or use `cdp add`)
# Format: 'shortname' = 'C:\full\path\to\project'
$global:Projects = @{
    'myapp'     = 'C:\Users\YourName\Projects\my-app'
    'website'   = 'C:\Users\YourName\Projects\my-website'
    'backend'   = 'C:\Users\YourName\Projects\backend-api'
    'frontend'  = 'C:\Users\YourName\Projects\frontend-app'
}

# Rewrite the $global:Projects block in this file (add or remove one entry), then re-source.
# Keeps a single rolling backup at <file>.bak.
function script:Save-ProjectEntry {
    param([string]$Op, [string]$Name, [string]$Path)

    $lines = Get-Content -Path $script:NavigatorFile
    $out = New-Object System.Collections.Generic.List[string]
    $inBlock = $false
    foreach ($line in $lines) {
        if (-not $inBlock -and $line -match '^\$global:Projects\s*=\s*@\{') { $inBlock = $true; $out.Add($line); continue }
        if ($inBlock -and $line -match '^\}') {
            if ($Op -eq 'add') { $out.Add("    '$Name' = '$Path'") }
            $inBlock = $false; $out.Add($line); continue
        }
        if ($inBlock -and $line -match "^\s*'$([regex]::Escape($Name))'\s*=") { continue }
        $out.Add($line)
    }
    Copy-Item -Path $script:NavigatorFile -Destination "$($script:NavigatorFile).bak" -Force
    Set-Content -Path $script:NavigatorFile -Value $out -Encoding UTF8
    . $script:NavigatorFile
}

function cdp {
    <#
    .SYNOPSIS
        Navigate to a project directory with tab completion.

    .DESCRIPTION
        Quickly change directory to a predefined project location.
        Run without arguments to see all available projects.
        Use 'add' / 'rm' to manage projects; changes are saved to the script file.

    .EXAMPLE
        cdp
        Lists all available projects.

    .EXAMPLE
        cdp myapp
        Changes directory to the 'myapp' project.

    .EXAMPLE
        cdp add myapp
        Saves the current directory as 'myapp'.

    .EXAMPLE
        cdp add utils C:\Dev\utility-scripts
        Saves the given path as 'utils'.

    .EXAMPLE
        cdp rm myapp
        Removes 'myapp'.
    #>
    param(
        [Parameter(Position=0)]
        [string]$ProjectName,
        [Parameter(Position=1)]
        [string]$Name,
        [Parameter(Position=2)]
        [string]$Path
    )

    if ([string]::IsNullOrEmpty($ProjectName)) {
        Write-Host "`nAvailable Projects:" -ForegroundColor Cyan
        $global:Projects.GetEnumerator() | Sort-Object Name | ForEach-Object {
            Write-Host "  $($_.Key.PadRight(10)) -> $($_.Value)" -ForegroundColor Yellow
        }
        return
    }

    switch ($ProjectName) {
        'add' {
            if ([string]::IsNullOrEmpty($Name) -or $Name -in @('add', 'rm')) {
                Write-Host "Usage: cdp add <name> [path]" -ForegroundColor Red
                return
            }
            if ([string]::IsNullOrEmpty($Path)) { $Path = (Get-Location).Path }
            if (-not (Test-Path -Path $Path -PathType Container)) {
                Write-Host "✗ Not a directory: $Path" -ForegroundColor Red
                return
            }
            $Path = (Resolve-Path -Path $Path).Path
            $verb = if ($global:Projects.ContainsKey($Name)) { 'Updated' } else { 'Added' }
            Save-ProjectEntry -Op add -Name $Name -Path $Path
            Write-Host "✓ $verb '$Name' -> $Path" -ForegroundColor Green
            return
        }
        'rm' {
            if ([string]::IsNullOrEmpty($Name) -or -not $global:Projects.ContainsKey($Name)) {
                Write-Host "✗ Project '$Name' not found" -ForegroundColor Red
                return
            }
            Save-ProjectEntry -Op rm -Name $Name
            Write-Host "✓ Removed '$Name'" -ForegroundColor Green
            return
        }
    }

    if ($global:Projects.ContainsKey($ProjectName)) {
        Set-Location $global:Projects[$ProjectName]
        Write-Host "✓ Switched to: $ProjectName" -ForegroundColor Green
    } else {
        Write-Host "✗ Project '$ProjectName' not found" -ForegroundColor Red
        Write-Host "Run 'cdp' to see available projects, 'cdp add <name>' to add one" -ForegroundColor Gray
    }
}

# Tab completion: first arg = subcommands + projects; `cdp rm <TAB>` = projects
$script:ProjectCompleter = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    $candidates = @()
    if ($parameterName -eq 'ProjectName') {
        $candidates = @('add', 'rm') + @($global:Projects.Keys)
    } elseif ($parameterName -eq 'Name' -and $commandAst.CommandElements[1].Extent.Text -eq 'rm') {
        $candidates = @($global:Projects.Keys)
    }
    $candidates | Where-Object { $_ -like "$wordToComplete*" } | Sort-Object | ForEach-Object {
        $tip = if ($global:Projects.ContainsKey($_)) { "$_ → $($global:Projects[$_])" } else { $_ }
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $tip)
    }
}
Register-ArgumentCompleter -CommandName cdp -ParameterName ProjectName -ScriptBlock $script:ProjectCompleter
Register-ArgumentCompleter -CommandName cdp -ParameterName Name -ScriptBlock $script:ProjectCompleter

# Enable interactive menu on Tab (optional but recommended)
# Comment out if you prefer the default tab cycling behavior
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
