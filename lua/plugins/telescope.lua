return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8", -- Use stable version
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- Optional: FZF native sorter (performance boost)
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                -- Default configuration
                prompt_prefix = "🔍 ",
                selection_caret = "➤ ",
                path_display = { "truncate" }, -- Truncate long paths

                -- Key mappings
                mappings = {
                    i = { -- Insert mode
                        ["<C-k>"] = actions.move_selection_previous, -- Previous
                        ["<C-j>"] = actions.move_selection_next, -- Next
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- Send to quickfix
                    },
                },
            },
            pickers = {
                -- Individual picker configuration
                find_files = {
                    theme = "dropdown", -- Use dropdown theme
                    previewer = false, -- Disable preview (faster)
                },
            },
        })

        -- Load FZF extension (if installed)
        pcall(telescope.load_extension, "fzf")
    end,
}
