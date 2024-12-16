return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "notes",
                path = "~/repos/notes",
            },{
                name = "university",
                path = "~/repos/university",
            },
        },
    },-- Preview markdown code directly in your neovim terminal

}
