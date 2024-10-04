-- Autocommands
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    group = "YankHighlight",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
    end,
})

-- Remove trailing whitespace on save
augroup("TrimWhiteSpace", { clear = true })
autocmd("BufWritePre", {
    group = "TrimWhiteSpace",
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Open a terminal in insert mode
autocmd("TermOpen", {
    pattern = "*",
    command = "startinsert",
})

-- Save and restore folds
augroup("RememberFolds", { clear = true })
autocmd("BufWinLeave", {
    group = "RememberFolds",
    pattern = "*.*",
    command = "mkview",
})
autocmd("BufWinEnter", {
    group = "RememberFolds",
    pattern = "*.*",
    command = "silent! loadview",
})

-- Enable spell checking for certain file types
augroup("SpellCheck", { clear = true })
autocmd("FileType", {
    group = "SpellCheck",
    pattern = { "gitcommit", "markdown", "text" },
    command = "setlocal spell",
})

-- Set file type specific tab settings
augroup("FileTypeSettings", { clear = true })
autocmd("FileType", {
    group = "FileTypeSettings",
    pattern = { "python", "lua", "javascript", "typescript" },
    command = "setlocal shiftwidth=4 tabstop=4",
})
autocmd("FileType", {
    group = "FileTypeSettings",
    pattern = { "html", "css", "scss" },
    command = "setlocal shiftwidth=2 tabstop=2",
})

