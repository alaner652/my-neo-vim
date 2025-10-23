local api = vim.api

api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        api.nvim_set_hl(0, "SnacksDashboardTerminal", { fg = "#a6e3a1" })
    end,
})

api.nvim_set_hl(0, "SnacksDashboardTerminal", { fg = "#a6e3a1" })

