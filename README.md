# Dotfiles

My `dotfiles` managed by `GNU Stow`.

## Getting Started

### Prerequisites

**Required:**

- **`git`**: For cloning and managing the repository.
- **`stow`**: For symlinking and managing dotfiles.

**Optional (but recommended):**

- **`neovim`**: For a modern Vim experience.
- **`tmux`**: For terminal multiplexing and session management.

### Installation

1. **Clone the Repository:**

   ```sh
   git clone git@github.com:ragibasif/dotfiles.git ~/dotfiles && cd ~/dotfiles
   ```

2. **Run the Installation Script:**

   ```sh
   ./install.sh
   ```

## Usage

### Stowing Specific Configurations

```sh
stow bash      # Applies ONLY the bash configurations
stow nvim      # Applies ONLY the neovim configurations
stow vim       # Applies ONLY the vim configurations
stow git       # Applies ONLY the git configurations
stow tmux      # Applies ONLY the tmux configurations
```

### Customizing the `.stow-local-ignore` File

The `.stow-local-ignore` file allows you to specify files or directories that
should be ignored when stowing.

### Overwriting Existing Files

By default, `stow` will not overwrite existing files. Using the `--adopt` or
`--override` flags will overwrite conflicting files.

```sh
stow --override bash
```

Or

```sh
stow --adopt zsh
```

## License

This project is licensed under the **MIT License**. Feel free to use, modify,
and distribute the code as you see fit. For more details, see the
[LICENSE](LICENSE) file.

## References

- [Using GNU Stow to manage your dot files](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html): A comprehensive guide on using `stow` for dotfiles management.
- [Force GNU stow to overwrite existing configuration file](https://www.reddit.com/r/linux4noobs/comments/b5ig2h/is_there_any_way_to_force_gnu_stow_to_overwrite/): A Reddit thread discussing how to handle conflicts with `stow`.
