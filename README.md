# Dotfiles

[![GitHub](https://img.shields.io/badge/GitHub-0D1117?style=for-the-badge&logo=github&logoColor=C9D1D9)](https://github.com/ragibasif/dotfiles)
[![Last Commit](https://img.shields.io/github/last-commit/ragibasif/dotfiles?style=for-the-badge&logo=github&color=58A6FF&logoColor=C9D1D9&labelColor=0D1117)](https://github.com/ragibasif/dotfiles/pulse)
[![Stars](https://img.shields.io/github/stars/ragibasif/dotfiles?style=for-the-badge&logo=apachespark&color=D29922&logoColor=C9D1D9&labelColor=0D1117)](https://github.com/ragibasif/dotfiles/stargazers)
[![Forks](https://img.shields.io/github/forks/ragibasif/dotfiles?style=for-the-badge&logo=github&color=3FB950&logoColor=C9D1D9&labelColor=0D1117)](https://github.com/ragibasif/dotfiles/network/members)
[![Visitors](https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Fragibasif%2Fdotfiles&label=visitors&labelColor=%230D1117&countColor=%2358A6FF)](https://visitorbadge.io/status?path=https%3A%2F%2Fgithub.com%2Fragibasif%2Fdotfiles)
[![License](https://img.shields.io/github/license/ragibasif/dotfiles?style=for-the-badge&logo=starship&color=8957E5&logoColor=C9D1D9&labelColor=0D1117)](https://github.com/ragibasif/dotfiles/blob/master/LICENSE)

My `dotfiles` managed by `GNU Stow`.

## Overview

| Package | Tool | Description |
|---------|------|-------------|
| `git` | Git | User config, delta diff pager, global ignore, commit template |
| `zsh` | Zsh + Oh My Zsh | Shell configuration and aliases |
| `vim` | Vim | Editor settings, keymaps, color schemes |
| `tmux` | Tmux | Terminal multiplexer with custom keymaps and theme |
| `ssh` | SSH | Host configuration for GitHub (ed25519) |
| `fastfetch` | Fastfetch | System information display |
| `Code` | VS Code | Editor settings with Vim keybindings |
| `bin` | Scripts | Custom utility scripts (see [Scripts](#scripts)) |

## Directory Structure

```
dotfiles/
├── bin/            # Custom utility scripts
├── Code/           # VS Code settings
├── fastfetch/      # Fastfetch config
├── git/            # Git config, ignore, and commit template
├── ssh/            # SSH config
├── tmux/           # Tmux config (options, keymaps, colorscheme)
├── vim/            # Vimrc and plugins
├── zsh/            # Zshrc and Oh My Zsh setup
├── install.sh      # Automated installation script
└── LICENSE
```

## Getting Started

### Prerequisites

Required:

- `git`: For cloning and managing the repository.
- `stow`: For symlinking and managing dotfiles.

Optional (install for full setup):

- `zsh` + [Oh My Zsh](https://ohmyz.sh/): Shell and plugin framework.
- `vim`: Text editor.
- `tmux`: Terminal multiplexer.
- `delta`: Enhanced git diff pager.
- `fastfetch`: System information tool.
- `exiftool` + `qpdf`: Required by the `clean_pdf_metadata` script.

### Installation

1. Clone the repository:

   ```bash
   git clone git@github.com:ragibasif/dotfiles.git ~/dotfiles
   ```

2. Enter the directory:

   ```bash
   cd ~/dotfiles
   ```

3. Run the installation script:

   ```bash
   ./install.sh
   ```

The script automatically stows all packages and handles platform differences between macOS and Linux.

#### Install script flags

```
--dry-run    Preview what would be stowed without making changes
--verbose    Show detailed output during installation
--help       Display usage information
```

## Usage

### Stowing specific packages

To apply only a subset of configurations:

```bash
stow zsh       # Applies ONLY the zsh configuration
stow vim       # Applies ONLY the vim configuration
stow git       # Applies ONLY the git configuration
stow tmux      # Applies ONLY the tmux configuration
stow ssh       # Applies ONLY the SSH configuration
stow fastfetch # Applies ONLY the fastfetch configuration
```

### Unstowing

To remove symlinks for a package:

```bash
stow -D zsh    # Remove zsh symlinks
stow -D vim    # Remove vim symlinks
```

### Overwriting existing files

By default, `stow` will not overwrite existing files. Use `--adopt` or `--override` to handle conflicts:

```bash
stow --override zsh   # Overwrite existing files with symlinks
stow --adopt zsh      # Pull existing files into the repo, then symlink
```

> **Note:** After using `--adopt`, run `git restore .` to revert any pulled-in files back to the repo versions.

### Customizing `.stow-local-ignore`

The `.stow-local-ignore` file specifies files or directories that `stow` should skip when symlinking.

## Scripts

Custom utility scripts installed to `bin/`:

| Script | Description |
|--------|-------------|
| `snake` | Sanitizes filenames by replacing non-alphanumeric characters with underscores. Supports single files or recursive directory mode. |
| `git_update` | Runs a gitleaks security scan, commits with a standard message, and pushes to GitHub. |
| `git_obliterate_commits` | **Destructive.** Rewrites repository history by creating a new orphan branch and force-pushing. Use with caution. |
| `clean_pdf_metadata` | Strips metadata from PDF files using `exiftool` and `qpdf`. Supports recursive directory processing. |
| `clean_image_metadata` | Strips metadata from image files. |
| `remove_z_library` | Removes `_Z_Library_` prefix from PDF and EPUB filenames. |

## Platform Notes

- **macOS:** `bin/` scripts are installed to `/usr/local/bin` (requires `sudo`). VS Code settings are copied rather than symlinked.
- **Linux:** `bin/` scripts are installed to `~/bin`. VS Code settings are symlinked via `stow`.

## License

This project is licensed under the MIT License. Feel free to use, modify,
and distribute the code as you see fit. For more details, see the
[LICENSE](LICENSE) file.

## References

- [Using GNU Stow to manage your dot files](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html): Comprehensive guide on using `stow` for dotfiles management.
- [Force GNU stow to overwrite existing configuration file](https://www.reddit.com/r/linux4noobs/comments/b5ig2h/is_there_any_way_to_force_gnu_stow_to_overwrite/): Handling conflicts with `stow`.
- [GNU Stow manual](https://www.gnu.org/software/stow/manual/stow.html): Official documentation.
- [delta](https://github.com/dandavison/delta): Syntax-highlighting pager for git diffs.
