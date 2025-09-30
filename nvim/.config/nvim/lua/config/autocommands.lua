-- autocommands.lua

-- Helper function to create autocommands with less verbose syntax
local function autocmd(name, opts)
	vim.api.nvim_create_autocmd(name, opts)
end

-- Helper function to create autocommand groups with less verbose syntax
local function augroup(name, opts)
	vim.api.nvim_create_augroup(name, opts)
end

-- Highlight on yank
-- Briefly highlight text when it's yanked (copied) for visual feedback
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = "YankHighlight",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Remove trailing whitespace on save
-- Automatically trim trailing whitespace from all lines when saving any file
augroup("TrimWhiteSpace", { clear = true })
autocmd("BufWritePre", {
	group = "TrimWhiteSpace",
	pattern = "*",
	command = [[%s/\s\+$//e]], -- Regex substitution: find trailing whitespace and remove it
})

-- Open a terminal in insert mode
-- Automatically enter insert mode when opening a terminal buffer
autocmd("TermOpen", {
	pattern = "*",
	command = "startinsert",
})

-- Save and restore folds
-- Preserve manual folds between editing sessions
augroup("RememberFolds", { clear = true })
autocmd("BufWinLeave", {
	group = "RememberFolds",
	pattern = "*.*", -- Only for files with extensions
	command = "mkview", -- Save fold state
})
autocmd("BufWinEnter", {
	group = "RememberFolds",
	pattern = "*.*",
	command = "silent! loadview", -- Restore fold state (silent to ignore errors)
})

-- Enable spell checking for certain file types
-- Turn on spell checking for text-heavy files where it's most useful
augroup("SpellCheck", { clear = true })
autocmd("FileType", {
	group = "SpellCheck",
	pattern = { "gitcommit", "markdown", "text" },
	command = "setlocal spell",
})

-- Set file type specific tab settings
-- Configure indentation preferences based on language conventions
augroup("FileTypeSettings", { clear = true })

-- 4-space indentation for Python, Lua, JavaScript, TypeScript
autocmd("FileType", {
	group = "FileTypeSettings",
	pattern = { "python", "lua", "javascript", "typescript" },
	command = "setlocal shiftwidth=4 tabstop=4",
})

-- 2-space indentation for web markup and styling languages
autocmd("FileType", {
	group = "FileTypeSettings",
	pattern = { "html", "css", "scss" },
	command = "setlocal shiftwidth=2 tabstop=2",
})

-- Use real tabs (not spaces) for Makefiles and CMake
autocmd("FileType", {
	group = "FileTypeSettings",
	pattern = { "make", "cmake" },
	command = "setlocal noexpandtab",
})

-- Prevent continuation of comments on new line
-- Disable automatic comment continuation when pressing Enter or o/O
-- (formatoptions: c=auto-wrap comments, r=insert comment leader on Enter, o=insert comment leader with o/O)
autocmd("FileType", {
	group = "FileTypeSettings",
	pattern = "*",
	command = "setlocal formatoptions-=cro",
})

-- Restore cursor position to last place on file open
-- Jump to the last known cursor position when reopening a file
augroup("RestoreCursor", { clear = true })
autocmd("BufReadPre", {
	group = "RestoreCursor",
	pattern = "*",
	callback = function()
		local line = vim.fn.line("'\"") -- Get line number of last cursor position mark
		-- Only restore if the line number is valid (within file bounds)
		if line >= 1 and line <= vim.fn.line("$") then
			vim.cmd("normal! g'\"") -- Jump to the mark
		end
	end,
})
