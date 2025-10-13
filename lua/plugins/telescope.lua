return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8", -- 使用穩定版本
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- 可選：FZF 原生排序器（提升性能）
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
				-- 預設配置
				prompt_prefix = "🔍 ",
				selection_caret = "➤ ",
				path_display = { "truncate" }, -- 截斷過長路徑

				-- 按鍵映射
				mappings = {
					i = { -- insert 模式
						["<C-k>"] = actions.move_selection_previous, -- 上一個
						["<C-j>"] = actions.move_selection_next, -- 下一個
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- 發送到 quickfix
					},
				},
			},
			pickers = {
				-- 個別 picker 的配置
				find_files = {
					theme = "dropdown", -- 使用下拉主題
					previewer = false, -- 關閉預覽（更快）
				},
			},
		})

		-- 載入 FZF 擴展（如果已安裝）
		pcall(telescope.load_extension, "fzf")
	end,
}
