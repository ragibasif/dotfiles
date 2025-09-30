-- keymaps.lua

-- Leader key
-- Set the leader key to backslash (used as prefix for custom commands)
local leader = "\\"
vim.g.mapleader = leader
vim.g.maplocalleader = leader

-- Mode shortcuts for vim.keymap.set
-- Makes it easier to reference modes in keymaps
local modes = {
	all = "", -- All modes
	command = "c", -- Command-line mode
	insert = "i", -- Insert mode
	normal = "n", -- Normal mode
	terminal = "t", -- Terminal mode
	visual = "v", -- Visual mode
}

-- Alternative escape key combinations
-- Press these key combinations quickly to exit insert/visual/command mode
local escape_keys = {
	"jk",
	"Jk",
	"JK",
	"jK",
}

-- Arrow keys to disable (encourages use of hjkl navigation)
local arrow_keys = {
	"<up>",
	"<down>",
	"<left>",
	"<right>",
}

-- Helper function to create keymaps with default options
-- Sets noremap (don't use recursive mappings) and silent (don't show command in status)
local function map(mode, lhs, rhs)
	local opts = { noremap = true, silent = true }
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Map alternative escape keys
-- Allows quick exit from insert/visual/command modes without reaching for ESC
local function map_escape()
	for _, v in ipairs(escape_keys) do
		map(modes.insert, v, "<ESC>")
		map(modes.visual, v, "<ESC>")
		map(modes.command, v, "<ESC>")
	end
end

-- Disable arrow keys
-- Forces use of hjkl for navigation (vim best practice)
local function map_arrows()
	for _, v in ipairs(arrow_keys) do
		map(modes.all, v, "<nop>") -- <nop> = no operation (disable the key)
	end
end

-- Set up leader key mappings
-- Prevents leader key from performing any action on its own
local function map_leader()
	vim.g.mapleader = leader
	vim.g.maplocalleader = leader
	map(modes.normal, leader, "<nop>") -- Leader does nothing by itself
	map(modes.visual, leader, "<nop>")
end

-- Initialize all keymaps
map_leader()
map_escape()
map_arrows()
