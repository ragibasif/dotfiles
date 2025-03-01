return {
    'nvim-lualine/lualine.nvim',
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },

    config = function()
        require('lualine').setup {
            -- config
        }
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
}


