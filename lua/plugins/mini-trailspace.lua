return {
    "echasnovski/mini.trailspace",
    version = "*",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("mini.trailspace").setup()
        -- Trim trailing whitespace on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function()
                MiniTrailspace.trim()
                MiniTrailspace.trim_last_lines()
            end,
        })
    end,
}
