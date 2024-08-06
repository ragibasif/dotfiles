# Dotfiles


TODO:
[force gnu stow to overwrite](https://www.reddit.com/r/linux4noobs/comments/b5ig2h/is_there_any_way_to_force_gnu_stow_to_overwrite/)

Dotfiles management is done through `GNU Stow`.

## Getting Started

### Prerequisites

Git

```bash
sudo pacman -S git
```
Stow
```bash

sudo pacman -S stow
```

### Installation

Clone the repo into your $HOME directory using git.

```bash
git clone git@github.com/xzazenx/dotfiles.git
cd dotfiles
```

## Usage

Stow all the files and directories not listed in `.stow-local-ignore`.

```bash
stow ./stow.sh
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

## Acknowledgements

- [Using GNU Stow to manage your dotfiles](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
