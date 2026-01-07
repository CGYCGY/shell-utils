# Project Navigator

A simple utility that lets you quickly navigate between your development projects using tab completion. Available for PowerShell, Bash, and Zsh.

## Features

- **Quick Navigation**: Jump to any project with a short alias
- **Tab Completion**: Press `TAB` to see all available projects
- **Interactive Menu**: Visual selection menu (PowerShell/Zsh)
- **Easy to Extend**: Add new projects on-the-fly
- **Color-coded Output**: Clear visual feedback
- **Cross-platform**: Works on Windows, Linux, and macOS

## Why Use This?

Instead of typing:
```bash
cd /home/user/Documents/Projects/my-very-long-project-name
```

Just type:
```bash
cdp myproj
```

Or use tab completion:
```bash
cdp my[TAB]  # autocompletes to 'myproj'
```

## Available Versions

| Shell | Script Location | Platform |
|-------|-----------------|----------|
| PowerShell | `powershell/profile-scripts/project-navigator.ps1` | Windows, Linux, macOS |
| Bash | `bash/profile-scripts/project-navigator.sh` | Linux, macOS |
| Zsh | `zsh/profile-scripts/project-navigator.zsh` | Linux, macOS |

---

## Installation

### PowerShell

#### Step 1: Download the Script

Download `project-navigator.ps1` to your local machine.

#### Step 2: Customize Your Projects

Open `project-navigator.ps1` and edit the `$global:Projects` hashtable:

```powershell
$global:Projects = @{
    'myapp'     = 'C:\Users\YourName\Projects\my-app'
    'website'   = 'C:\Users\YourName\Projects\my-website'
    'backend'   = 'C:\Users\YourName\Projects\backend-api'
    'frontend'  = 'C:\Users\YourName\Projects\frontend-app'
}
```

#### Step 3: Add to Your Profile

```powershell
# Open your profile
notepad $PROFILE

# If it doesn't exist, create it
New-Item -Path $PROFILE -Type File -Force
```

Add this line to your profile:
```powershell
. /path/to/project-navigator.ps1
```

#### Step 4: Reload

```powershell
. $PROFILE
```

---

### Bash

#### Step 1: Download the Script

Download `project-navigator.sh` to your local machine.

#### Step 2: Customize Your Projects

Open `project-navigator.sh` and edit the `PROJECTS` array:

```bash
declare -gA PROJECTS=(
    ['myapp']="$HOME/Projects/my-app"
    ['website']="$HOME/Projects/my-website"
    ['backend']="$HOME/Projects/backend-api"
    ['frontend']="$HOME/Projects/frontend-app"
)
```

#### Step 3: Add to Your Profile

```bash
# Open your profile
nano ~/.bashrc

# Add this line at the end
source /path/to/project-navigator.sh
```

#### Step 4: Reload

```bash
source ~/.bashrc
```

**Note:** Bash 4.0+ is required for associative arrays. Check with `bash --version`.

---

### Zsh

#### Step 1: Download the Script

Download `project-navigator.zsh` to your local machine.

#### Step 2: Customize Your Projects

Open `project-navigator.zsh` and edit the `PROJECTS` array:

```zsh
typeset -gA PROJECTS=(
    ['myapp']="$HOME/Projects/my-app"
    ['website']="$HOME/Projects/my-website"
    ['backend']="$HOME/Projects/backend-api"
    ['frontend']="$HOME/Projects/frontend-app"
)
```

#### Step 3: Add to Your Profile

```zsh
# Open your profile
nano ~/.zshrc

# Add this line at the end
source /path/to/project-navigator.zsh
```

**oh-my-zsh users:** You can also copy the script to `~/.oh-my-zsh/custom/` for auto-loading.

#### Step 4: Reload

```zsh
source ~/.zshrc
```

---

## Usage

All commands work the same across shells.

### List All Projects

```bash
$ cdp

Available Projects:
  backend    -> /home/user/Projects/backend-api
  frontend   -> /home/user/Projects/frontend-app
  myapp      -> /home/user/Projects/my-app
  website    -> /home/user/Projects/my-website
```

### Navigate to a Project

```bash
$ cdp myapp
✓ Switched to: myapp
```

### Tab Completion

Press `TAB` to see available options:

```bash
$ cdp [TAB]
backend   frontend   myapp   website
```

### Add a Project (Current Session)

```bash
# Add current directory
$ add_project newproj
✓ Added project 'newproj' -> /current/directory

# Add specific path
$ add_project utils /path/to/utils
✓ Added project 'utils' -> /path/to/utils
```

**Note:** Projects added this way only last for the current session. Add them to the script file to persist.

---

## Configuration

### Project Definition Syntax

| Shell | Syntax |
|-------|--------|
| PowerShell | `'name' = 'C:\path\to\project'` |
| Bash | `['name']="/path/to/project"` |
| Zsh | `['name']="/path/to/project"` |

### Example Configurations

**PowerShell:**
```powershell
$global:Projects = @{
    'fos'       = 'C:\Dev\GoProjects\fos'
    'expense'   = 'C:\Dev\PythonProjects\expense-tracker'
    'trading'   = 'C:\Dev\PythonProjects\ai-trading-bot'
}
```

**Bash/Zsh:**
```bash
declare -gA PROJECTS=(  # Bash
typeset -gA PROJECTS=(  # Zsh
    ['fos']="$HOME/Dev/GoProjects/fos"
    ['expense']="$HOME/Dev/PythonProjects/expense-tracker"
    ['trading']="$HOME/Dev/PythonProjects/ai-trading-bot"
)
```

### Disable Interactive Menu (PowerShell)

Comment out this line in the script:
```powershell
# Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
```

---

## Tips & Tricks

1. **Short, Memorable Aliases**: Use short names like `web`, `api`, `app`
2. **Consistent Naming**: Use a consistent pattern (all lowercase, no spaces)
3. **Group by Type**: Prefix related projects (`work-api`, `work-web`, `personal-blog`)
4. **Use Variables**: Use `$HOME` or `~` for portable paths on Linux/macOS

---

## Troubleshooting

### Tab completion not working

**PowerShell:** Ensure PSReadLine is installed:
```powershell
Get-Module -ListAvailable PSReadLine
```

**Bash:** Ensure bash-completion is installed:
```bash
# Ubuntu/Debian
sudo apt install bash-completion

# macOS
brew install bash-completion
```

**Zsh:** Ensure compinit is initialized in your `.zshrc`:
```zsh
autoload -Uz compinit && compinit
```

### Profile doesn't load

**PowerShell:**
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Bash/Zsh:** Ensure the script path is correct and the file is readable:
```bash
ls -la /path/to/script.sh
```

### Bash version too old (macOS)

macOS ships with Bash 3.x. Install Bash 4+:
```bash
brew install bash
# Add to /etc/shells and change default shell if desired
```

---

## Requirements

| Shell | Version | Notes |
|-------|---------|-------|
| PowerShell | 5.1+ | PSReadLine module included |
| Bash | 4.0+ | Associative arrays required |
| Zsh | 5.0+ | Default on macOS Catalina+ |

---

## Alternative Solutions

If this doesn't fit your needs, check out these alternatives:

- **[zoxide](https://github.com/ajeetdsouza/zoxide)**: Frecency-based directory jumper (learns from your habits)
- **[autojump](https://github.com/wting/autojump)**: Similar to zoxide, maintains a database of visited directories
- **[z](https://github.com/rupa/z)**: The original frecency-based jumper for bash/zsh
- **[fzf](https://github.com/junegunn/fzf)**: Fuzzy finder that can be combined with directory navigation

---

## License

MIT License - Feel free to use and modify as needed!

## Contributing

Found a bug or have a feature request? Feel free to open an issue or submit a pull request!

---

**Happy navigating!**
