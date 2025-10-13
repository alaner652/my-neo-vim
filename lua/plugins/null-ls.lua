return {
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- Lua
					null_ls.builtins.formatting.stylua,

					-- JavaScript/TypeScript
					null_ls.builtins.formatting.prettier.with({
						filetypes = {
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
							"vue",
							"css",
							"scss",
							"less",
							"html",
							"json",
							"jsonc",
							"yaml",
							"markdown",
							"markdown.mdx",
							"graphql",
							"handlebars",
						},
					}),
					null_ls.builtins.diagnostics.eslint_d,

					-- Python
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.diagnostics.flake8,

					-- Shell
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.diagnostics.shellcheck,

					-- C/C++
					null_ls.builtins.formatting.clang_format,

					-- Java
					null_ls.builtins.formatting.google_java_format,

					-- Code Actions
					null_ls.builtins.code_actions.gitsigns,
				},
				-- 自動格式化設置
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.keymap.set("n", "<leader>f", function()
							vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
						end, { buffer = bufnr, desc = "Format buffer" })

						-- 保存時自動格式化
						local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					-- Lua
					"stylua",
					-- JavaScript/TypeScript
					"prettier",
					"eslint_d",
					-- Python
					"black",
					"isort",
					"flake8",
					-- Shell
					"shfmt",
					"shellcheck",
					-- C/C++
					"clang-format",
					-- Java
					"google-java-format",
					-- Markdown
					"markdownlint",
				},
				automatic_installation = true,
			})
		end,
	},
}
