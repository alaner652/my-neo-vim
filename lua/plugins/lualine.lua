return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "catppuccin", -- Use Catppuccin theme
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true, -- Global statusline (VSCode style)
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                -- Left side
                lualine_a = { "mode" }, -- Mode display (NORMAL, INSERT, etc.)
                lualine_b = {
                    "branch", -- Git branch
                    "diff", -- Git diff
                    {
                        "diagnostics",
                        sources = { "nvim_lsp" },
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                    },
                },
                lualine_c = {
                    {
                        "filename",
                        file_status = true, -- Show file status (modified, readonly, etc.)
                        newfile_status = true,
                        path = 1, -- 0: filename only, 1: relative path, 2: absolute path
                        shorting_target = 40,
                        symbols = {
                            modified = "[+]",
                            readonly = "[-]",
                            unnamed = "[Unnamed]",
                            newfile = "[New]",
                        },
                    },
                },
                -- Right side
                lualine_x = {
                    {
                        "encoding",
                        show_bomb = true,
                    },
                    {
                        "fileformat",
                        symbols = {
                            unix = "LF",
                            dos = "CRLF",
                            mac = "CR",
                        },
                    },
                    "filetype",
                },
                lualine_y = { "progress" }, -- File position percentage
                lualine_z = { "location" }, -- Line:column
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = { "neo-tree", "lazy", "mason" },
        })
    end,
}
