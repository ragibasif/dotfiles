return {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "cpp" } },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}
