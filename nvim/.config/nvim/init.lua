-- init.lua
-- List of configuration modules to load in order
local modules = {
	[1] = "options", -- General Neovim settings (tab width, line numbers, etc.)
	[2] = "keymaps", -- Custom key mappings
	[3] = "autocommands", -- Automatic commands and event handlers
	[4] = "lazy", -- Lazy.nvim plugin manager setup
	[5] = "colorscheme", -- Color scheme configuration
}

-- Base directory where config modules are located
local dir = "config"

-- Load each module in sequence
for _, v in ipairs(modules) do
	require(dir .. "." .. v)
end
