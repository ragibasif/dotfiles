-- keymaps.lua

-- Leader key
local leader = "\\"
vim.g.mapleader = leader
vim.g.maplocalleader = leader

local modes = {
	all = "",
	command = "c",
	insert = "i",
	normal = "n",
	terminal = "t",
	visual = "v",
}

local escape_keys = {
	"jk",
	"Jk",
	"JK",
	"jK",
}

local arrow_keys = {
	"<up>",
	"<down>",
	"<left>",
	"<right>",
}

local function map(mode, lhs, rhs)
	local opts = { noremap = true, silent = true }
	vim.keymap.set(mode, lhs, rhs, opts)
end

local function map_escape()
	for _, v in ipairs(escape_keys) do
		map(modes.insert, v, "<ESC>")
		map(modes.visual, v, "<ESC>")
		map(modes.command, v, "<ESC>")
	end
end

local function map_arrows()
	for _, v in ipairs(arrow_keys) do
		map(modes.all, v, "<nop>")
	end
end

local function map_leader()
	vim.g.mapleader = leader
	vim.g.maplocalleader = leader
	map(modes.normal, leader, "<nop>")
	map(modes.visual, leader, "<nop>")
end

map_leader()
map_escape()
map_arrows()
