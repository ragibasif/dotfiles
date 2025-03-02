---
name: Improve Windows Support
about: Enhance the `install.sh` script to support Windows.
title: "[Enhancement] Improve Windows support"
labels: enhancement, windows
assignees: ''

---

### Description
Enhance the `install.sh` script to support Windows (e.g., via WSL or native tools like Git Bash).

### Tasks
- Detect Windows environments and adjust symlink creation (e.g., use `mklink`).
- Add Windows-specific instructions to the README.

### Additional Notes
- Test the script on both WSL and native Windows environments.
