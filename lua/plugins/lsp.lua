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
            local mason_registry = require("mason-registry")
            local util = require("lspconfig.util")
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
                        if server_name == "jdtls" then
                            return
                        end
                        lspconfig[server_name].setup({
                            on_attach = on_attach,
                            capabilities = capabilities,
                        })
                    end,
                    ["jdtls"] = function()
                        if vim.fn.executable("java") ~= 1 then
                            vim.notify("未偵測到 Java 可執行檔，已跳過 jdtls 啟動。", vim.log.levels.WARN)
                            return
                        end

                        local version_output = vim.fn.systemlist("java -version 2>&1")
                        local version_str = table.concat(version_output, " ")
                        local captured = version_str:match('version%s+"(%d+[^"]*)"') or version_str:match("openjdk%s+(%d+[^%s]*)")
                        local major
                        if captured then
                            local first = captured:match("^(%d+)")
                            if first then
                                major = tonumber(first)
                                if major == 1 then
                                    local secondary = captured:match("^1%.(%d+)")
                                    if secondary then
                                        major = tonumber(secondary)
                                    end
                                end
                            end
                        end
                        if not major then
                            local fallback = version_str:match("(%d+)")
                            if fallback then
                                major = tonumber(fallback)
                            end
                        end

                        if not major or major < 21 then
                            vim.notify("目前 Java 版本不足 (需要 21 以上)，已跳過 jdtls。", vim.log.levels.WARN)
                            return
                        end

                        local jdtls_pkg = mason_registry.get_package("jdtls")
                        local jdtls_path = jdtls_pkg:get_install_path()
                        local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
                        if launcher == "" then
                            vim.notify("找不到 jdtls 啟動器，請重新安裝 mason 套件。", vim.log.levels.ERROR)
                            return
                        end
                        local system = vim.loop.os_uname().sysname
                        local config_dir = "config_linux"
                        if system == "Darwin" then
                            config_dir = "config_mac"
                        elseif system == "Windows_NT" then
                            config_dir = "config_win"
                        end
                        local workspace_dir = vim.fn.stdpath("data")
                            .. "/jdtls_workspaces/"
                            .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
                        vim.fn.mkdir(workspace_dir, "p")

                        lspconfig.jdtls.setup({
                            on_attach = on_attach,
                            capabilities = capabilities,
                            cmd = {
                                "java",
                                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                                "-Dosgi.bundles.defaultStartLevel=4",
                                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                                "-Dlog.protocol=true",
                                "-Dlog.level=ALL",
                                "-Xms1g",
                                "--add-modules=ALL-SYSTEM",
                                "--add-opens",
                                "java.base/java.util=ALL-UNNAMED",
                                "--add-opens",
                                "java.base/java.lang=ALL-UNNAMED",
                                "-jar",
                                launcher,
                                "-configuration",
                                jdtls_path .. "/" .. config_dir,
                                "-data",
                                workspace_dir,
                            },
                            root_dir = function(fname)
                                return util.root_pattern("gradlew", "mvnw", "pom.xml", "build.gradle", ".git")(fname)
                            end,
                            single_file_support = false,
                        })
                    end,
                },
                -- jdtls 使用專屬 handler，以確保 root_dir 與啟動指令正確
            })
        end,
    },
}
