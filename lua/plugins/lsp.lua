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
			local on_attach = function(_, bufnr)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename Symbol" })
			end

			-- 啟用 Mason Lspconfig，並使用 handlers 配置每個伺服器
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "cssls", "html", "jsonls", "ts_ls" },
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({ on_attach = on_attach })
					end,
				},
			})
		end,
	},
}
