-- colorscheme.lua

--------------------------------------------------------------------------------
--                                COLORSCHEME                                 --
--------------------------------------------------------------------------------

local colorschemes = {
	"zenwritten",
	"darcubox",
	"kanagawabones",
	"rose-pine",
	"gruvbox",
	"dracula",
	"retrobox",
	"quiet",
	"default",
}

local function get_colorscheme()
	for _, v in ipairs(colorschemes) do
		local ok, _ = pcall(vim.cmd.colorscheme, v)
		if ok then
			return v
		end
	end
	return "default"
end

local function set_colorscheme(name)
	vim.cmd.colorscheme(name)
end

set_colorscheme(get_colorscheme())
