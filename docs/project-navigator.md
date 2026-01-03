# PowerShell Project Navigator

A simple PowerShell utility that lets you quickly navigate between your development projects using tab completion and an interactive menu.

## Features

- 🚀 **Quick Navigation**: Jump to any project with a short alias
- 🔍 **Tab Completion**: Press `TAB` to see all available projects
- 📋 **Interactive Menu**: Visual selection menu for easy browsing
- ✨ **Easy to Extend**: Add new projects on-the-fly
- 🎨 **Color-coded Output**: Clear visual feedback

## Why Use This?

Instead of typing:
```powershell
cd C:\Users\YourName\Documents\Projects\my-very-long-project-name
```

Just type:
```powershell
cdp myproj
```

Or use tab completion:
```powershell
cdp my[TAB]  # autocompletes to 'myproj'
```

## Installation

### Step 1: Download the Script

Download `project-navigator.ps1` to your local machine.

### Step 2: Customize Your Projects

Open `project-navigator.ps1` and edit the `$global:Projects` hashtable with your actual projects:

```powershell
$global:Projects = @{
    'myapp'     = 'C:\Users\YourName\Projects\my-app'
    'website'   = 'C:\Users\YourName\Projects\my-website'
    'backend'   = 'C:\Users\YourName\Projects\backend-api'
    'frontend'  = 'C:\Users\YourName\Projects\frontend-app'
}
```

**Example:**
```powershell
$global:Projects = @{
    'fos'       = 'C:\Dev\GoProjects\fos'
    'expense'   = 'C:\Dev\PythonProjects\expense-tracker'
    'trading'   = 'C:\Dev\PythonProjects\ai-trading-bot'
    'autokit'   = 'C:\Dev\WebProjects\claude-autokit-plugin'
}
```

### Step 3: Add to Your PowerShell Profile

1. **Open your PowerShell profile:**
   ```powershell
   notepad $PROFILE
   ```

2. **If the file doesn't exist, create it:**
   ```powershell
   New-Item -Path $PROFILE -Type File -Force
   notepad $PROFILE
   ```

3. **Copy the entire contents** of `project-navigator.ps1` and paste it at the end of your profile file.

4. **Save and close** the file.

5. **Reload your profile:**
   ```powershell
   . $PROFILE
   ```

### Step 4: Test It!

```powershell
# Show all projects
cdp

# Navigate to a project
cdp myapp

# Use tab completion
cdp [TAB][TAB]
```

## Usage

### List All Projects

```powershell
PS C:\> cdp

Available Projects:
  backend    -> C:\Users\YourName\Projects\backend-api
  frontend   -> C:\Users\YourName\Projects\frontend-app
  myapp      -> C:\Users\YourName\Projects\my-app
  website    -> C:\Users\YourName\Projects\my-website
```

### Navigate to a Project

```powershell
PS C:\> cdp myapp
✓ Switched to: myapp
PS C:\Users\YourName\Projects\my-app>
```

### Tab Completion

Press `TAB` to cycle through options or see the interactive menu:

```powershell
PS C:\> cdp [TAB]

backend
frontend
myapp
website

PS C:\> cdp █
```

Use arrow keys to select, then press `Enter`.

### Add a Project (Temporary)

```powershell
# Add current directory
PS C:\path\to\new-project> Add-Project newproj
✓ Added project 'newproj' -> C:\path\to\new-project
⚠ Remember to add this to your $PROFILE to persist across sessions!

# Add specific path
PS C:\> Add-Project utils C:\Dev\utility-scripts
✓ Added project 'utils' -> C:\Dev\utility-scripts
```

**Note:** Projects added with `Add-Project` only last for the current session. To make them permanent, add them to the `$global:Projects` hashtable in your profile.

## Configuration

### Disable Interactive Menu

If you prefer the default tab cycling behavior instead of the interactive menu, comment out this line in the script:

```powershell
# Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
```

### Customize Key Bindings

You can change the menu activation key. For example, to use `Ctrl+Space` instead:

```powershell
Set-PSReadLineKeyHandler -Key Ctrl+Space -Function MenuComplete
```

## Tips & Tricks

1. **Short, Memorable Aliases**: Use short names like `web`, `api`, `app` instead of full project names
2. **Consistent Naming**: Use a consistent pattern (e.g., all lowercase, no spaces)
3. **Group by Type**: Prefix related projects (e.g., `work-api`, `work-web`, `personal-blog`)
4. **Current Directory**: Use `Add-Project` to quickly bookmark directories while exploring

## Troubleshooting

### Tab completion not working

Make sure PSReadLine is installed (it comes with PowerShell 5.1+ by default):
```powershell
Get-Module -ListAvailable PSReadLine
```

### Profile doesn't load automatically

Check your execution policy:
```powershell
Get-ExecutionPolicy

# If it's Restricted, set it to RemoteSigned:
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Changes to $PROFILE don't take effect

Reload your profile:
```powershell
. $PROFILE
```

## Requirements

- PowerShell 5.1 or later
- PSReadLine module (included by default in PowerShell 5.1+)
- Windows, Linux, or macOS

## License

MIT License - Feel free to use and modify as needed!

## Contributing

Found a bug or have a feature request? Feel free to open an issue or submit a pull request!

## Alternative Solutions

If this doesn't fit your needs, check out these alternatives:

- **[zoxide](https://github.com/ajeetdsouza/zoxide)**: Frecency-based directory jumper (learns from your habits)
- **[pshazz](https://github.com/lukesampson/pshazz)**: Comprehensive PowerShell customization framework
- **[z](https://github.com/badmotorfinger/z)**: PowerShell implementation of z.sh

---

**Happy navigating!** 🚀
