---@diagnostic disable: undefined-global
return {
	{
		-- Mason: 輕鬆管理和安裝 LSP 伺服器、格式化工具等
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- Lspconfig: 處理 Neovim 與 LSP 伺服器的連接配置
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Mason Lspconfig: 讓 Lspconfig 自動與 Mason 協同工作
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- 設置 LSP 伺服器的通用函數
			local lspconfig = require("lspconfig")
			-- luacheck: globals vim
			local vim = vim

			-- 設置補全能力
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- LSP on_attach：統一從 keymaps.lua 管理
			local on_attach = function(client, bufnr)
				-- 使用統一的 LSP keymap 設定
				if _G.keymaps and _G.keymaps.setup_lsp_keymaps then
					_G.keymaps.setup_lsp_keymaps(client, bufnr)
				end
			end

			-- 啟用 Mason Lspconfig，並使用 handlers 配置每個伺服器
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "cssls", "html", "jsonls", "ts_ls", "clangd", "jdtls" },
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
