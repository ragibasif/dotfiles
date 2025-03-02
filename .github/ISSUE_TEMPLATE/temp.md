---
name: Create a Backup Script
about: Add a script to back up existing dotfiles before applying new configurations.
title: "[Enhancement] Add a backup script"
labels: enhancement, scripting
assignees: ''

---

### Description
Add a script to back up existing dotfiles before applying new configurations. This will prevent accidental overwrites and make it easier to revert changes.

### Tasks
- Write a backup script that copies existing dotfiles to a `backup/` directory.
- Integrate the script into the `install.sh` process.

### Additional Notes
- Ensure the backup script is cross-platform and works on Linux, macOS, and Windows (WSL).
