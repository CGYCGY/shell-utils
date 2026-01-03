# PowerShell Utils

A collection of PowerShell utilities and scripts to supercharge your command-line productivity.

## 📦 Available Utilities

### [Profile Scripts](profile-scripts/)

Essential scripts to add to your PowerShell profile for enhanced daily workflows.

- **[Project Navigator](docs/project-navigator.md)** - Quickly jump between development projects with tab completion
  ```powershell
  cdp myproject  # Navigate instantly to any project
  ```

## 🚀 Quick Start

1. Browse the utilities above
2. Click on any utility to see its detailed documentation
3. Follow the installation instructions for each utility you want to use

## 📋 Requirements

- PowerShell 5.1 or later (PowerShell 7+ recommended)
- Windows, Linux, or macOS

## 💡 Usage Philosophy

These utilities are designed to be:
- **Lightweight** - No heavy dependencies
- **Modular** - Use only what you need
- **Customizable** - Easy to adapt to your workflow
- **Well-documented** - Clear instructions and examples

## 🛠️ Installation Tips

### Finding Your PowerShell Profile

```powershell
# See your profile path
$PROFILE

# Open your profile in notepad
notepad $PROFILE

# If profile doesn't exist, create it
New-Item -Path $PROFILE -Type File -Force
```

### Reloading Your Profile

After making changes:
```powershell
. $PROFILE
```

### Execution Policy

If scripts don't run, you may need to adjust your execution policy:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 🤝 Contributing

Contributions are welcome! Whether it's:
- Bug fixes
- New utilities
- Documentation improvements
- Feature suggestions

Feel free to open an issue or submit a pull request.

## 📄 License

MIT License - Free to use, modify, and distribute.

## 🔗 Resources

- [PowerShell Documentation](https://docs.microsoft.com/powershell/)
- [PSReadLine Module](https://github.com/PowerShell/PSReadLine)
- [PowerShell Gallery](https://www.powershellgallery.com/)

---

**Star ⭐ this repo if you find it useful!**
