# Zsh Profile Scripts

A collection of useful Zsh profile scripts to enhance your development workflow on Linux/macOS.

## Available Scripts

### [Project Navigator](../../docs/project-navigator.md)

Quickly navigate between your development projects with tab completion and descriptions.

**Key Features:**
- Jump to projects using short aliases (e.g., `cdp myapp`)
- Tab completion with path descriptions
- Easy project management
- oh-my-zsh compatible

**Quick Start:**
```zsh
cdp [TAB][TAB]  # See all projects with paths
cdp myapp       # Navigate to project
```

[Full Documentation](../../docs/project-navigator.md)

---

## Installation

1. Choose a script from the list above
2. Follow the installation guide in its documentation
3. Add the script to your Zsh profile (`~/.zshrc`)

### Quick Setup

```zsh
# Add to ~/.zshrc
source /path/to/project-navigator.zsh

# Reload your profile
source ~/.zshrc
```

### oh-my-zsh Users

You can also place scripts directly in the custom directory:
```bash
cp project-navigator.zsh ~/.oh-my-zsh/custom/
```

Scripts in this directory are automatically loaded.

## Requirements

- Zsh 5.0 or later
- Linux or macOS

### Checking Your Zsh Version

```zsh
zsh --version
```

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.

## License

MIT License - Free to use and modify
