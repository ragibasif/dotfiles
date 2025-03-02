# Dotfiles

Welcome to my dotfiles repository! This is where I store and manage my precious configuration files (commonly referred to as "dotfiles"). These files are essential for customizing and optimizing my development environment. To manage these configurations efficiently, I use **GNU Stow**, a symlink manager that helps keep everything organized and easily deployable.

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [License](#license)
- [Resources](#resources)

## Getting Started

### Prerequisites

Before you begin, ensure you have the following tools installed on your system:

**Required:**
- **`git`**: For cloning and managing the repository.
- **`stow`**: For symlinking and managing dotfiles.

**Optional (but recommended):**
- **`neovim`**: For a modern Vim experience.
- **`tmux`**: For terminal multiplexing and session management.

### Installation

1. **Clone the Repository:**
   First, clone this repository into your `$HOME` directory. This ensures that the symlinks created by `stow` point to the correct locations.

   ```bash
   git clone git@github.com:ragibasif/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Run the Installation Script:**
   The `install.sh` script automates the process of stowing all the configuration files. It will also overwrite any pre-existing configuration files that may conflict with the ones in this repository.

   ```bash
   ./install.sh
   ```

   Alternatively, you can manually stow specific directories if you don't want to apply all configurations at once.

## Usage

### Stowing Specific Configurations

If you prefer to stow only specific configurations, you can do so by running the `stow` command followed by the directory name. For example:

```bash
stow bash      # Applies bash configurations
stow kitty     # Applies kitty terminal configurations
stow nvim      # Applies Neovim configurations
stow vim       # Applies Vim configurations
stow git       # Applies Git configurations
stow tmux      # Applies tmux configurations
```

### Customizing the `.stow-local-ignore` File

The `.stow-local-ignore` file allows you to specify files or directories that should be ignored when stowing. This is useful if you have local configurations that you don't want to overwrite or symlink.

### Overwriting Existing Files

By default, `stow` will not overwrite existing files. If you want to force `stow` to overwrite conflicting files, you can use the `--adopt` or `--override` options. Be cautious with this, as it will replace your existing configurations.

```bash
stow --override bash
```

## License

This project is licensed under the **MIT License**. Feel free to use, modify, and distribute the code as you see fit. For more details, see the [LICENSE](LICENSE) file.

## Resources

Here are some additional resources to help you understand and manage dotfiles with GNU Stow:

- [Using GNU Stow to manage your dotfiles](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html): A comprehensive guide on using `stow` for dotfiles management.
- [Force GNU stow to overwrite existing config file](https://www.reddit.com/r/linux4noobs/comments/b5ig2h/is_there_any_way_to_force_gnu_stow_to_overwrite/): A Reddit thread discussing how to handle conflicts with `stow`.

---

Feel free to explore the repository and customize it to fit your needs. If you have any questions or suggestions, please open an issue or submit a pull request. Happy coding! 🚀
