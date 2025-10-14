---@diagnostic disable: undefined-global
return {
    {
        -- Mason: Easy management and installation of LSP servers, formatters, etc.
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        -- Lspconfig: Handles Neovim's connection configuration with LSP servers
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Mason Lspconfig: Allows Lspconfig to automatically work with Mason
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            -- Setup function for LSP servers
            local lspconfig = require("lspconfig")
            -- luacheck: globals vim
            local vim = vim

            -- Setup completion capabilities
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- LSP on_attach: Unified management from keymaps.lua
            local on_attach = function(client, bufnr)
                -- Use unified LSP keymap settings
                if _G.keymaps and _G.keymaps.setup_lsp_keymaps then
                    _G.keymaps.setup_lsp_keymaps(client, bufnr)
                end
            end

            -- Enable Mason Lspconfig and configure each server using handlers
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "cssls",
                    "html",
                    "jsonls",
                    "ts_ls",
                    "pyright", -- Python LSP (includes diagnostics, replaces flake8)
                    "clangd",
                    "jdtls",
                },
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({
                            on_attach = on_attach,
                            capabilities = capabilities,
                        })
                    end,
                },
            })
        end,
    },
}
