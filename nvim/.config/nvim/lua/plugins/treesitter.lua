return {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "cpp", "c", "lua", "python", "javascript, typescript, html, css, json, cmake, make, markdown, bash, asm, nasm"} },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}
