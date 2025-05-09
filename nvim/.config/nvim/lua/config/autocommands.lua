-- Autocommands
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = "YankHighlight",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
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

autocmd("FileType", {
	group = "FileTypeSettings",
	pattern = { "make", "cmake" },
	command = "setlocal noexpandtab",
})
--
-- autocmd("BufWritePre", {
-- 	pattern = "*.go",
-- 	callback = function()
-- 		local params = vim.lsp.util.make_range_params()
-- 		params.context = { only = { "source.organizeImports" } }
-- 		-- buf_request_sync defaults to a 1000ms timeout. Depending on your
-- 		-- machine and codebase, you may want longer. Add an additional
-- 		-- argument after params if you find that you have to write the file
-- 		-- twice for changes to be saved.
-- 		-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
-- 		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
-- 		for cid, res in pairs(result or {}) do
-- 			for _, r in pairs(res.result or {}) do
-- 				if r.edit then
-- 					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
-- 					vim.lsp.util.apply_workspace_edit(r.edit, enc)
-- 				end
-- 			end
-- 		end
-- 		vim.lsp.buf.format({ async = false })
-- 	end,
-- })
