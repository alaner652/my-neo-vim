return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        -- Required LSP completion source
        "hrsh7th/cmp-nvim-lsp",
        -- Other commonly used completion sources
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        -- Snippet engine + common snippets
        {
            "L3MON4D3/LuaSnip",
            dependencies = { "rafamadriz/friendly-snippets" },
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        -- UI icons
        "onsails/lspkind.nvim",
        -- Command line completion
        "hrsh7th/cmp-cmdline",
        -- Function signature help
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "…",
                    show_labelDetails = true,
                }),
            },
            -- Performance and intelligence improvements
            performance = {
                debounce = 60,
                throttle = 30,
                fetching_timeout = 500,
                max_view_entries = 30,
            },
            -- More aggressive completion trigger
            completion = {
                keyword_length = 1,
                autocomplete = {
                    require("cmp.types").cmp.TriggerEvent.TextChanged,
                    require("cmp.types").cmp.TriggerEvent.InsertEnter,
                },
            },
            -- Experimental features
            experimental = {
                ghost_text = true,
            },
            mapping = cmp.mapping.preset.insert({
                -- Use Ctrl+p/n for completion navigation (Vim-style, avoids window navigation conflict)
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 1000 },
                { name = "nvim_lsp_signature_help", priority = 900 },
                { name = "luasnip", priority = 800 },
                { name = "buffer", priority = 500, keyword_length = 3 },
                { name = "path", priority = 300 },
            }),
            sorting = {
                priority_weight = 2,
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
        })

        -- Search completion (buffer)
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Command line completion (path + cmdline)
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
        })
    end,
}
