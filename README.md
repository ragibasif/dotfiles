# Dotfiles

My precious configuration (dot) files. Dotfiles management is done through `GNU Stow`.

## Getting Started

### Prerequisites

**Required:**

- `git`
- `stow`

_(Optional):_

- `neovim`
- `tmux`

### Installation

Clone the repo into your $HOME directory using git.

```bash
git clone git@github.com/ragibasif/dotfiles.git
cd dotfiles
```

## Usage

Stow all the files and directories not listed in `.stow-local-ignore`. This
will also overwrite any conflicting pre-existing configuration files.

```bash
./install.sh
```

Or, stow only the files you want by running `stow <directory>`

```bash
stow bash
stow kitty
stow nvim
stow vim
stow git
stow tmux
```

## License

This project is licensed under the **MIT license**.

See [LICENSE](LICENSE) for more information.

## Resources

- [Using GNU Stow to manage your dotfiles](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
- [Force GNU stow to overwrite existing config file](https://www.reddit.com/r/linux4noobs/comments/b5ig2h/is_there_any_way_to_force_gnu_stow_to_overwrite/)

