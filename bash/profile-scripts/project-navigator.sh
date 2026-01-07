# ============================================
# Project Navigation with Tab Completion
# ============================================
# A Bash utility to quickly navigate between your development projects
# with tab completion support.
#
# Author: Community Contribution
# License: MIT
#
# Requirements: Bash 4.0+ (for associative arrays)
#
# Installation:
#   Add to your ~/.bashrc:
#   source /path/to/project-navigator.sh
# ============================================

# Define your projects here
# Format: ['shortname']='/full/path/to/project'
declare -gA PROJECTS=(
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
        echo -e "\033[36mAvailable Projects:\033[0m"
        for key in $(echo "${!PROJECTS[@]}" | tr ' ' '\n' | sort); do
            printf "  \033[33m%-10s -> %s\033[0m\n" "$key" "${PROJECTS[$key]}"
        done
        return 0
    fi

    # Check if project exists
    if [[ -v PROJECTS[$project_name] ]]; then
        cd "${PROJECTS[$project_name]}" || return 1
        echo -e "\033[32m✓ Switched to: $project_name\033[0m"
    else
        echo -e "\033[31m✗ Project '$project_name' not found\033[0m"
        echo -e "\033[90mRun 'cdp' to see available projects\033[0m"
        return 1
    fi
}

# Add a new project to the list
add_project() {
    local name="$1"
    local path="${2:-$(pwd)}"

    if [[ -z "$name" ]]; then
        echo -e "\033[31mUsage: add_project <name> [path]\033[0m"
        echo "  name: Short name/alias for the project"
        echo "  path: Full path to the project (defaults to current directory)"
        return 1
    fi

    PROJECTS[$name]="$path"
    echo -e "\033[32m✓ Added project '$name' -> $path\033[0m"
    echo -e "\033[33m⚠ Remember to add this to your ~/.bashrc to persist across sessions!\033[0m"
}

# Tab completion for cdp
_cdp_completions() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local projects="${!PROJECTS[*]}"

    COMPREPLY=($(compgen -W "$projects" -- "$cur"))
}

# Register the completion function
complete -F _cdp_completions cdp
