---
name: Improve Install Script
about: Enhance the `install.sh` script to be more adaptable to different operating systems.
title: "[Improvement] Make install.sh adaptable to different OS"
labels: enhancement, help wanted
assignees: ''

---

### Description
The current `install.sh` script assumes a specific environment and may not work seamlessly across different operating systems (e.g., Linux, macOS, Windows with WSL). This issue aims to improve the script to:
1. Detect the operating system and adjust accordingly.
2. Handle dependencies (e.g., `stow`, `git`, `neovim`, `tmux`) based on the OS.
3. Provide clear feedback and instructions for users on unsupported or partially supported systems.

### Proposed Changes
1. **OS Detection:**
   - Add logic to detect the operating system (e.g., using `uname` or `os-release` on Linux, `sw_vers` on macOS, or `systeminfo` on Windows).
   - Store the OS type in a variable for use in subsequent steps.

2. **Dependency Management:**
   - Check for required tools (`git`, `stow`) and install them if missing.
   - For optional tools (`neovim`, `tmux`), prompt the user to install them if not detected.
   - Use OS-specific package managers (e.g., `apt` for Debian-based systems, `brew` for macOS, `choco` for Windows).

3. **Error Handling and Feedback:**
   - Provide clear error messages if a required tool is missing or cannot be installed.
   - Offer fallback options or manual installation instructions for unsupported systems.

4. **Cross-Platform Symlink Handling:**
   - Ensure symlinks are created correctly on all platforms (e.g., using `mklink` on Windows if necessary).

5. **Testing:**
   - Test the script on various operating systems to ensure compatibility.

### Example Implementation
Here’s a rough outline of how the script might look:

```bash
#!/bin/bash

# Detect OS
OS="$(uname -s)"
case "$OS" in
  Linux*)   OS="linux" ;;
  Darwin*)  OS="macos" ;;
  CYGWIN*)  OS="windows" ;;
  MINGW*)   OS="windows" ;;
  *)        echo "Unsupported OS: $OS"; exit 1 ;;
esac

# Install dependencies based on OS
if [ "$OS" == "linux" ]; then
  sudo apt update
  sudo apt install -y git stow
elif [ "$OS" == "macos" ]; then
  brew install git stow
elif [ "$OS" == "windows" ]; then
  echo "Windows support is experimental. Please install git and stow manually."
  exit 1
fi

# Stow dotfiles
stow bash
stow kitty
stow nvim
stow vim
stow git
stow tmux

echo "Installation complete!"
