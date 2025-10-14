return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Auto-run :TSUpdate on first install
    config = function()
        require("nvim-treesitter.configs").setup({
            -- Auto-install parsers for common languages
            ensure_installed = {
                "lua",
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "json",
                "yaml",
                "bash",
                "python",
                "markdown",
                "markdown_inline",
                "c",
                "cpp",
                "java",
            },
            -- Enable syntax highlighting
            highlight = {
                enable = true,
            },
            -- Enable incremental selection
            incremental_selection = {
                enable = true,
            },
        })
    end,
}
