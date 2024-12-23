<div align="center">
  <a href="https://github.com/ragibasif/dotfiles">
      <h1>Dotfiles</h1>
  </a>
</div>

<h2>**WIP**</h2>

<details open="open">
<summary>Table of Contents</summary>

- [About](#about)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Support](#support)
- [Authors](#authors)
- [License](#license)
- [Acknowledgements](#acknowledgements)

</details>

---

## About

Dotfiles management is done through `GNU Stow`.

## Getting Started

### Prerequisites

Git

```bash
sudo pacman -S git
```
GNU Stow

```bash
sudo pacman -S stow
```

(Optional): Kitty, Neovim, Vim, Tmux

```bash
sudo pacman -S neovim tmux kitty vim
```

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

## Extra

### Map `jk` to `Esc` in Vim for VSCode

```json
{
  "vim.insertModeKeyBindings": [
    {
      "before": ["j", "k"],
      "after": ["<Esc>"]
    }
  ],
  "vim.visualModeKeyBindings": [
    {
      "before": ["j", "k"],
      "after": ["<Esc>"]
    }
  ],
  "vim.commandLineModeKeyBindings": [
    {
      "before": ["j", "k"],
      "after": ["<Esc>"]
    }
  ]
}
```
