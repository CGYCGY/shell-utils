# ============================================
# Project Navigation with Tab Completion
# ============================================
# A PowerShell utility to quickly navigate between your development projects
# with tab completion and interactive menu support.
#
# Author: Community Contribution
# License: MIT
# ============================================

# Define your projects here
# Format: 'shortname' = 'C:\full\path\to\project'
$global:Projects = @{
    'myapp'     = 'C:\Users\YourName\Projects\my-app'
    'website'   = 'C:\Users\YourName\Projects\my-website'
    'backend'   = 'C:\Users\YourName\Projects\backend-api'
    'frontend'  = 'C:\Users\YourName\Projects\frontend-app'
}

function cdp {
    <#
    .SYNOPSIS
        Navigate to a project directory with tab completion.

    .DESCRIPTION
        Quickly change directory to a predefined project location.
        Run without arguments to see all available projects.

    .PARAMETER ProjectName
        The short name of the project to navigate to.

    .EXAMPLE
        cdp
        Lists all available projects.

    .EXAMPLE
        cdp myapp
        Changes directory to the 'myapp' project.

    .EXAMPLE
        cdp my[TAB]
        Use tab completion to autocomplete project names.
    #>
    param(
        [Parameter(Position=0)]
        [string]$ProjectName
    )

    if ([string]::IsNullOrEmpty($ProjectName)) {
        Write-Host "`nAvailable Projects:" -ForegroundColor Cyan
        $global:Projects.GetEnumerator() | Sort-Object Name | ForEach-Object {
            Write-Host "  $($_.Key.PadRight(10)) -> $($_.Value)" -ForegroundColor Yellow
        }
        return
    }

    if ($global:Projects.ContainsKey($ProjectName)) {
        Set-Location $global:Projects[$ProjectName]
        Write-Host "✓ Switched to: $ProjectName" -ForegroundColor Green
    } else {
        Write-Host "✗ Project '$ProjectName' not found" -ForegroundColor Red
        Write-Host "Run 'cdp' to see available projects" -ForegroundColor Gray
    }
}

# Tab completion for cdp
Register-ArgumentCompleter -CommandName cdp -ParameterName ProjectName -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    $global:Projects.Keys | Where-Object { $_ -like "$wordToComplete*" } |
        Sort-Object |
        ForEach-Object {
            [System.Management.Automation.CompletionResult]::new(
                $_,
                $_,
                'ParameterValue',
                "$_ → $($global:Projects[$_])"
            )
        }
}

# Enable interactive menu on Tab (optional but recommended)
# Comment out if you prefer the default tab cycling behavior
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# ============================================
# Bonus: Add New Projects Easily
# ============================================

function Add-Project {
    <#
    .SYNOPSIS
        Add a new project to the global projects list.

    .DESCRIPTION
        Adds a project to $global:Projects for the current session.
        Note: This does not persist across sessions. Add to your $PROFILE manually.

    .PARAMETER Name
        Short name/alias for the project.

    .PARAMETER Path
        Full path to the project. Defaults to current directory.

    .EXAMPLE
        Add-Project mynewproject
        Adds current directory as 'mynewproject'.

    .EXAMPLE
        Add-Project utils C:\Dev\utility-scripts
        Adds the specified path as 'utils'.
    #>
    param(
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [string]$Path = (Get-Location).Path
    )

    $global:Projects[$Name] = $Path
    Write-Host "✓ Added project '$Name' -> $Path" -ForegroundColor Green
    Write-Host "⚠ Remember to add this to your `$PROFILE to persist across sessions!" -ForegroundColor Yellow
}
