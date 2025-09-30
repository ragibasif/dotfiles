-- options.lua

-- Spell checking
vim.opt.spell = true -- Enable spell checking
vim.opt.spelllang = "en" -- Use English dictionary

-- Line numbers
vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers (useful for motions like 5j)
vim.opt.numberwidth = 4 -- Width of the number column

-- Editor behavior
vim.opt.ruler = true -- Show cursor position in status line
vim.opt.hidden = true -- Allow switching buffers without saving
vim.opt.confirm = true -- Prompt to save changes before closing buffer
vim.opt.background = "dark" -- Tell vim we're using a dark terminal background
vim.opt.wrap = false -- Don't wrap long lines
vim.opt.scrolloff = 10 -- Keep 10 lines visible above/below cursor
vim.opt.sidescrolloff = 10 -- Keep 10 columns visible left/right of cursor
vim.opt.mouse = "" -- Disable mouse support (keyboard only)

-- File handling
vim.opt.swapfile = false -- Don't create swap files
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before overwriting
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo" -- Store undo history in config directory
vim.opt.undofile = true -- Persistent undo across sessions

-- Search
vim.opt.incsearch = true -- Show matches as you type
vim.opt.hlsearch = true -- Highlight all search matches
vim.opt.ignorecase = true -- Case-insensitive search by default
vim.opt.smartcase = true -- Case-sensitive if search contains uppercase

-- Performance and timing
vim.opt.updatetime = 300 -- Faster completion (default 4000ms)
vim.opt.timeoutlen = 500 -- Time to wait for mapped sequence (ms)

-- UI elements
vim.opt.signcolumn = "yes" -- Always show sign column (prevents text shifting)
vim.opt.termguicolors = true -- Enable 24-bit RGB colors

-- Indentation
vim.opt.shiftwidth = 4 -- Number of spaces for each indent level
vim.opt.smarttab = true -- Insert blanks according to shiftwidth
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.tabstop = 4 -- Number of spaces a tab counts for
vim.opt.softtabstop = 4 -- Number of spaces for tab in insert mode
vim.opt.cindent = true -- Smart indenting for C-like languages
vim.opt.smartindent = true -- Smart autoindenting on new lines
vim.opt.autoindent = true -- Copy indent from current line to new line
vim.opt.breakindent = true -- Preserve indentation in wrapped lines

-- Visual aids
vim.opt.cursorline = true -- Highlight the current line
vim.opt.cursorcolumn = true -- Highlight the current column
vim.opt.colorcolumn = "80" -- Show vertical line at column 80
vim.opt.guicursor = "" -- Keep block cursor in all modes
vim.opt.inccommand = "split" -- Show live preview of substitutions in split
vim.opt.splitbelow = true -- Open horizontal splits below
vim.opt.splitright = true -- Open vertical splits to the right

-- File monitoring
vim.opt.autoread = true -- Auto-reload files changed outside vim

-- Command-line completion
vim.opt.wildmenu = true -- Enhanced command-line completion
vim.opt.wildmode = "longest:full,full" -- Complete longest common string, then full match
vim.opt.pumheight = 10 -- Maximum height of popup menu

-- Whitespace visualization
vim.opt.list = true -- Show invisible characters
vim.opt.fillchars = "eob: ,vert:¦" -- Characters for empty lines and vertical splits
vim.opt.conceallevel = 2 -- Hide concealed text (e.g., markdown syntax)

-- Display
vim.opt.showmatch = true -- Briefly jump to matching bracket
vim.opt.showmode = true -- Show current mode in command line
vim.opt.showcmd = true -- Show partial commands in last line
vim.opt.laststatus = 0 -- Never show status line
vim.opt.ttyfast = true -- Faster redrawing (for fast terminals)
vim.opt.smoothscroll = true -- Smooth scrolling for wrapped lines
vim.opt.statuscolumn = "%s%=%l  " -- Custom status column format (signs, line number)

-- Only for Neovim 0.10+
-- Set rounded borders for floating windows
if vim.fn.has("nvim-0.10") == 1 then
	vim.opt.winborder = "rounded"
end

-- Remove background color from status line
vim.cmd("hi statusline guibg=NONE")

-- Completion options
vim.opt.completeopt = { "menuone", "noselect" } -- Show menu even for one match, don't auto-select

-- Define which invisible characters to show and how
vim.opt.listchars = {
	tab = "» ", -- Show tabs as »
	space = "·", -- Show spaces as ·
	trail = "·", -- Show trailing spaces as ·
	extends = "→", -- Show → when line extends beyond screen
	precedes = "←", -- Show ← when line starts before screen
	nbsp = "␣", -- Show non-breaking spaces as ␣
	eol = "¬", -- Show end of line as ¬
}

-- Shorten certain messages to avoid clutter
vim.opt.shortmess:append("c") -- Don't give ins-completion-menu messages

-- Set up clipboard integration (scheduled to avoid potential race conditions)
vim.schedule(function()
	vim.o.clipboard = "unnamedplus" -- Use system clipboard for all operations
end)

-- Diagnostic (error/warning) display configuration
vim.diagnostic.config({
	signs = true, -- Show signs in the gutter for diagnostics (errors, warnings, etc.)
})

-- Disable LSP logging (improves performance)
vim.lsp.set_log_level("off")
