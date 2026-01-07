# ============================================
# Project Navigation with Tab Completion
# ============================================
# A Zsh utility to quickly navigate between your development projects
# with tab completion and description support.
#
# Author: Community Contribution
# License: MIT
#
# Installation:
#   Add to your ~/.zshrc:
#   source /path/to/project-navigator.zsh
#
# If using oh-my-zsh, you can also place this in:
#   ~/.oh-my-zsh/custom/project-navigator.zsh
# ============================================

# Define your projects here
# Format: ['shortname']='/full/path/to/project'
typeset -gA PROJECTS=(
    ['myapp']="$HOME/Projects/my-app"
    ['website']="$HOME/Projects/my-website"
    ['backend']="$HOME/Projects/backend-api"
    ['frontend']="$HOME/Projects/frontend-app"
)

# Navigate to a project directory
cdp() {
    local project_name="$1"

    # No argument: list all projects
    if [[ -z "$project_name" ]]; then
        echo ""
        print -P "%F{cyan}Available Projects:%f"
        for key in ${(ko)PROJECTS}; do
            printf "  %s%-10s -> %s%s\n" $'\e[33m' "$key" "${PROJECTS[$key]}" $'\e[0m'
        done
        return 0
    fi

    # Check if project exists
    if [[ -v PROJECTS[$project_name] ]]; then
        cd "${PROJECTS[$project_name]}" || return 1
        print -P "%F{green}✓ Switched to: $project_name%f"
    else
        print -P "%F{red}✗ Project '$project_name' not found%f"
        print -P "%F{242}Run 'cdp' to see available projects%f"
        return 1
    fi
}

# Add a new project to the list
add_project() {
    local name="$1"
    local path="${2:-$(pwd)}"

    if [[ -z "$name" ]]; then
        print -P "%F{red}Usage: add_project <name> [path]%f"
        echo "  name: Short name/alias for the project"
        echo "  path: Full path to the project (defaults to current directory)"
        return 1
    fi

    PROJECTS[$name]="$path"
    print -P "%F{green}✓ Added project '$name' -> $path%f"
    print -P "%F{yellow}⚠ Remember to add this to your ~/.zshrc to persist across sessions!%f"
}

# Tab completion for cdp with descriptions
_cdp() {
    local -a project_list

    # Build completion list with descriptions
    for key in ${(k)PROJECTS}; do
        project_list+=("$key:${PROJECTS[$key]}")
    done

    _describe 'project' project_list
}

# Register the completion function
compdef _cdp cdp
