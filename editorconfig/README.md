# EditorConfig Usage

This repository includes an `.editorconfig` file to maintain consistent coding styles across different editors and IDEs. The configuration ensures uniform indentation, line endings, and character encoding.

## What is EditorConfig?

[EditorConfig](https://editorconfig.org/) helps developers define and maintain consistent coding styles between different editors and IDEs. It works by reading configuration settings from an `.editorconfig` file placed in the project root.

## Configuration Details

### Root Declaration

```ini
root = true
```

This ensures that this is the top-most `.editorconfig` file, and no settings from parent directories are inherited.

### Default Settings (Applies to All Files)

```ini
[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
indent_style = space
indent_size = 4
trim_trailing_whitespace = true
max_line_length = 80
```

- UTF-8 encoding.
- Unix-style line endings (`LF`).
- Ensures a final newline at the end of files.
- Uses spaces for indentation, defaulting to 4 spaces.
- Trims trailing whitespace.
- Limits the maximum line length to 80 characters.

### Python Files (`.py`)

```ini
[*.py]
indent_style = space
indent_size = 4
```

Python files follow the standard 4-space indentation.

### Web Development Files

```ini
[*.{js,ts,jsx,tsx,css,scss,html,json,yml,yaml,md}]
indent_size = 2
trim_trailing_whitespace = true
```

- JavaScript, TypeScript, JSX, TSX, CSS, SCSS, HTML, JSON, YAML, and Markdown files use 2-space indentation.
- Trims trailing whitespace.

### JavaScript Files in `lib/` Directory

```ini
[lib/**.js]
indent_style = space
indent_size = 2
```

Overrides JavaScript files under the `lib/` directory to use 2-space indentation.

### Specific Files (`package.json`, `.travis.yml`)

```ini
[{package.json,.travis.yml}]
indent_style = space
indent_size = 2
```

Ensures `package.json` and `.travis.yml` files follow 2-space indentation.

### Markdown Files (`.md`)

```ini
[*.md]
trim_trailing_whitespace = false
```

Prevents trimming trailing whitespace to allow for intentional line breaks.

### Shell Scripts (`.sh`, `.bash`, `.zsh`)

```ini
[*.{sh,bash,zsh}]
indent_style = space
indent_size = 2
```

Shell scripts use spaces with 2-space indentation.

### Makefiles

```ini
[Makefile]
indent_style = tab
```

Makefiles require tab-based indentation.

## Usage

1. Install the EditorConfig plugin for your editor (if necessary).
2. Place the `.editorconfig` file in your project's root directory.
3. The settings will automatically apply when editing files in a compatible editor.

For more information, visit [EditorConfig.org](https://editorconfig.org/).
