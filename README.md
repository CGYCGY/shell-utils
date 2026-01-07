# Shell Utils

A collection of shell utilities and scripts to supercharge your command-line productivity across multiple platforms and shells.

## Supported Shells

| Shell | Platform | Directory |
|-------|----------|-----------|
| PowerShell | Windows, Linux, macOS | [powershell/](powershell/) |
| Bash | Linux, macOS | [bash/](bash/) |
| Zsh | Linux, macOS | [zsh/](zsh/) |

## Available Utilities

### Project Navigator

Quickly jump between development projects with tab completion.

```bash
cdp myproject  # Navigate instantly to any project
```

| Shell | Script | Documentation |
|-------|--------|---------------|
| PowerShell | [powershell/profile-scripts/](powershell/profile-scripts/) | [Full Docs](docs/project-navigator.md) |
| Bash | [bash/profile-scripts/](bash/profile-scripts/) | [Full Docs](docs/project-navigator.md) |
| Zsh | [zsh/profile-scripts/](zsh/profile-scripts/) | [Full Docs](docs/project-navigator.md) |

## Quick Start

1. Choose your shell from the directories above
2. Browse the available utilities
3. Follow the installation instructions for each utility

## Installation by Shell

### PowerShell

```powershell
# Add to your $PROFILE
. /path/to/script.ps1

# Reload profile
. $PROFILE
```

### Bash

```bash
# Add to ~/.bashrc
source /path/to/script.sh

# Reload profile
source ~/.bashrc
```

### Zsh

```zsh
# Add to ~/.zshrc
source /path/to/script.zsh

# Reload profile
source ~/.zshrc
```

## Requirements

| Shell | Version | Notes |
|-------|---------|-------|
| PowerShell | 5.1+ | PowerShell 7+ recommended |
| Bash | 4.0+ | macOS ships with 3.x, use `brew install bash` |
| Zsh | 5.0+ | Default on macOS Catalina+ |

## Usage Philosophy

These utilities are designed to be:
- **Cross-platform** - Same functionality across shells
- **Lightweight** - No heavy dependencies
- **Modular** - Use only what you need
- **Customizable** - Easy to adapt to your workflow
- **Well-documented** - Clear instructions and examples

## Contributing

Contributions are welcome! Whether it's:
- Bug fixes
- New utilities
- Documentation improvements
- Feature suggestions
- Ports to other shells

Feel free to open an issue or submit a pull request.

## License

MIT License - Free to use, modify, and distribute.

## Resources

- [PowerShell Documentation](https://docs.microsoft.com/powershell/)
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/)
- [Zsh Documentation](https://zsh.sourceforge.io/Doc/)

---

**Star this repo if you find it useful!**
