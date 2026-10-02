# PowerShell Profile Scripts

A collection of useful PowerShell profile scripts to enhance your development workflow.

## Available Scripts

### 📁 [Project Navigator](../../docs/project-navigator.md)

Quickly navigate between your development projects with tab completion and interactive menus.

**Key Features:**
- Jump to projects using short aliases (e.g., `cdp myapp`)
- Tab completion with visual menu
- `cdp add` / `cdp rm` save changes to the script file
- `cdp help` shows usage

**Quick Start:**
```powershell
cdp                       # List all projects
cdp [TAB][TAB]            # See all projects
cdp myapp                 # Navigate to project
cdp add newproj           # Save current directory as a project
cdp add newproj /some/dir # Save a specific path (re-adding a name updates it)
cdp rm newproj            # Remove a project
cdp help                  # Show usage
```

[📖 Full Documentation](../../docs/project-navigator.md)

---

## Installation

1. Choose a script from the list above
2. Follow the installation guide in its documentation
3. Add the script to your PowerShell profile (`$PROFILE`)

## Requirements

- PowerShell 5.1 or later
- Windows, Linux, or macOS

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.

## License

MIT License - Free to use and modify
