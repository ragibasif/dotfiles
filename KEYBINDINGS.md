---

# Custom Keybindings and Aliases

This document outlines the custom keybindings and aliases configured in this dotfiles repository. These settings are meant to streamline your workflow in tmux, Neovim, and your shell (Bash/Zsh).

---

## Tmux Keybindings

Tmux has been configured to use Vim-style navigation and to make reloading the configuration easier. Below are the key custom bindings:

### Reload Configuration

- **`bind r`**  
  **Purpose:** Reloads the tmux configuration file (`~/.tmux.conf`).  
  **Usage:** Press the tmux prefix (default is `Ctrl+b`) then `r` to apply any changes you’ve made.

### Pane Navigation

- **`bind h`**  
  **Purpose:** Switch to the pane on the **left**.  
  **Usage:** After the prefix, press `h` to move left.
  
- **`bind j`**  
  **Purpose:** Switch to the pane **below**.  
  **Usage:** After the prefix, press `j` to move down.
  
- **`bind k`**  
  **Purpose:** Switch to the pane **above**.  
  **Usage:** After the prefix, press `k` to move up.
  
- **`bind l`**  
  **Purpose:** Switch to the pane on the **right**.  
  **Usage:** After the prefix, press `l` to move right.

*These mappings enable quick, Vim-inspired navigation between panes without having to use the mouse.*

---

## Neovim Keybindings

Neovim’s configuration disables the arrow keys to encourage more efficient navigation and adds a quick way to exit insert or visual modes:

### Disable Arrow Keys

- **Mappings:**  
  - `<up>`, `<down>`, `<left>`, `<right>` are all mapped to `<nop>` (no operation).  
  **Purpose:** This discourages the use of the arrow keys and encourages you to use `h`, `j`, `k`, `l` for navigation.  
  **Usage:** When in normal or visual mode, the arrow keys are disabled so rely on the home row.

### Quick Escape from Insert/Visual Modes

- **Mappings:**  
  - In **Insert Mode**: Typing `jk`, `JK`, or `jK` exits insert mode (maps to `<ESC>`).  
  - In **Visual Mode**: The same key sequences (`jk`, `JK`, or `jK`) exit visual mode.  
  **Purpose:** Provides a fast, ergonomic alternative to pressing the Escape key.  
  **Usage:** Simply type one of the combinations while in insert or visual mode to return to normal mode.

---

## Shell Aliases (Bash/Zsh)

### Common Aliases

- **`alias v='nvim'`**  
  **Purpose:** Launch Neovim quickly using the short command `v`.  
  **Usage:** Type `v filename` to open a file in Neovim.

- **`alias ls='lsd'`**  
  **Purpose:** Replace the standard `ls` command with `lsd` for improved file listing and aesthetics.  
  **Usage:** Simply use `ls` as you normally would.

- **`alias cat='bat'`**  
  **Purpose:** Substitute `cat` with `bat` to display file contents with syntax highlighting and better formatting.  
  **Usage:** Use `cat filename` to display a file.

- **`alias grep='grep --color=auto'`**  
  **Purpose:** Automatically highlight matching text in `grep` output.  
  **Usage:** Run `grep <pattern> filename` to see highlighted results.

- **`alias cd='z'`**  
  **Purpose:** Leverages the `z` tool to quickly jump between frequently used directories instead of the traditional `cd`.  
  **Usage:** Use `cd <directory>` to switch directories with smarter navigation.

### Zsh-Specific Aliases

- **`alias zshconfig="nvim ~/.zshrc"`**  
  **Purpose:** Open the Zsh configuration file in Neovim for quick edits.  
  **Usage:** Type `zshconfig` to load your `.zshrc` in Neovim.

- **`alias ohmyzsh="nvim ~/.oh-my-zsh"`**  
  **Purpose:** Quickly navigate to your Oh My Zsh installation directory for modifications.  
  **Usage:** Type `ohmyzsh` to open the directory in Neovim.

- **`alias dl-song='yt-dlp ...'`**  
  **Purpose:** A custom command to download audio from YouTube with preset options.  
  **Usage:** Type `dl-song <URL>` to download a song with the specified settings.

---

## Conclusion

This repository’s custom keybindings and aliases are designed to improve efficiency and maintain consistency across your development environment. Each section above describes the purpose and usage of the bindings and aliases for tmux, Neovim, and your shell. Feel free to extend or adjust these settings to best suit your personal workflow.

---