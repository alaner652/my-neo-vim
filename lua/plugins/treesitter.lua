return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- 第一次安裝時自動執行 :TSUpdate
	config = function()
		require("nvim-treesitter.configs").setup({
			-- 自動安裝常見語言的解析器
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"json",
				"yaml",
				"bash",
				"python",
				"markdown",
				"markdown_inline",
			},
			-- 啟用語法高亮
			highlight = {
				enable = true,
			},
			-- 啟用增量選擇
			incremental_selection = {
				enable = true,
			},
		})
	end,
}
