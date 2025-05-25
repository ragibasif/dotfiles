-- init.lua

local modules = {
	[1] = "options",
	[2] = "keymaps",
	[3] = "autocommands",
	[4] = "lazy",
	[5] = "colorscheme",
}

local dir = "core"

for _, v in ipairs(modules) do
	require(dir .. "." .. v)
end
