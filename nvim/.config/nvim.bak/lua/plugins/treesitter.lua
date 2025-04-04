return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "cpp", "c", "lua", "python", "javascript, typescript, html, css, json, cmake, make, markdown, bash, asm, nasm, regex, toml, vim, vimdoc, git_config, git_rebase, gitattributes, gitcommit, gitignore"
        },
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
    },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
}
