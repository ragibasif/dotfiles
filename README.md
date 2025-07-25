<div align="center">
<h1>
Dotfiles
</h1>
</div>

<div align="center">
<p>
  <a href="https://github.com/ragibasif/dotfiles">
    <img alt="GitHub" src="https://img.shields.io/badge/GitHub-0D1117?style=for-the-badge&logo=github&logoColor=C9D1D9">
  </a>
  <a href="https://github.com/ragibasif/dotfiles/pulse">
    <img alt="Last Commit" src="https://img.shields.io/github/last-commit/ragibasif/dotfiles?style=for-the-badge&logo=github&color=58A6FF&logoColor=C9D1D9&labelColor=0D1117">
  </a>
  <a href="https://github.com/ragibasif/dotfiles/stargazers">
    <img alt="Stars" src="https://img.shields.io/github/stars/ragibasif/dotfiles?style=for-the-badge&logo=apachespark&color=D29922&logoColor=C9D1D9&labelColor=0D1117">
  </a>
  <a href="https://github.com/ragibasif/dotfiles/network/members">
    <img alt="Forks" src="https://img.shields.io/github/forks/ragibasif/dotfiles?style=for-the-badge&logo=github&color=3FB950&logoColor=C9D1D9&labelColor=0D1117">
  </a>
  <a href="https://github.com/ragibasif/dotfiles/actions">
    <img alt="Build Status" src="https://img.shields.io/github/actions/workflow/status/ragibasif/dotfiles/build.yml?branch=master&style=for-the-badge&label=build&logo=githubactions&color=58A6FF&logoColor=C9D1D9&labelColor=0D1117">
  </a>
  <a href="https://visitorbadge.io/status?path=https%3A%2F%2Fgithub.com%2Fragibasif%2Fdotfiles">
    <img alt="Visitors" src="https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Fragibasif%2Fdotfiles&label=visitors&labelColor=%230D1117&countColor=%2358A6FF">
  </a>
  <a href="https://github.com/ragibasif/dotfiles/issues">
    <img alt="Issues" src="https://img.shields.io/github/issues/ragibasif/dotfiles?style=for-the-badge&logo=bilibili&color=F85149&logoColor=C9D1D9&labelColor=0D1117">
  </a>
  <a href="https://github.com/ragibasif/dotfiles/blob/master/LICENSE">
    <img alt="License" src="https://img.shields.io/github/license/ragibasif/dotfiles?style=for-the-badge&logo=starship&color=8957E5&logoColor=C9D1D9&labelColor=0D1117">
  </a>
</p>
</div>

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
   git clone git@github.com:ragibasif/dotfiles.git ~/dotfiles
   ```

2. **Enter the Directory:**

   ```sh
   cd ~/dotfiles
   ```

3. **Run the Installation Script:**

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
