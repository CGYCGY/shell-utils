# Bash Profile Scripts

A collection of useful Bash profile scripts to enhance your development workflow on Linux/macOS.

## Available Scripts

### [Project Navigator](../../docs/project-navigator.md)

Quickly navigate between your development projects with tab completion.

**Key Features:**
- Jump to projects using short aliases (e.g., `cdp myapp`)
- Tab completion support
- Easy project management

**Quick Start:**
```bash
cdp [TAB][TAB]  # See all projects
cdp myapp       # Navigate to project
```

[Full Documentation](../../docs/project-navigator.md)

---

## Installation

1. Choose a script from the list above
2. Follow the installation guide in its documentation
3. Add the script to your Bash profile (`~/.bashrc`)

### Quick Setup

```bash
# Add to ~/.bashrc
source /path/to/project-navigator.sh

# Reload your profile
source ~/.bashrc
```

## Requirements

- Bash 4.0 or later (for associative arrays)
- Linux or macOS

### Checking Your Bash Version

```bash
bash --version
```

**Note:** macOS ships with Bash 3.x by default. Install Bash 4+ via Homebrew:
```bash
brew install bash
```

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.

## License

MIT License - Free to use and modify
