return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "catppuccin", -- 使用 Catppuccin 主題
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true, -- 全域狀態列（VSCode 風格）
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				-- 左側
				lualine_a = { "mode" }, -- 模式顯示（NORMAL, INSERT 等）
				lualine_b = {
					"branch", -- Git 分支
					"diff", -- Git 差異
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
				},
				lualine_c = {
					{
						"filename",
						file_status = true, -- 顯示檔案狀態（修改、唯讀等）
						newfile_status = true,
						path = 1, -- 0: 只顯示檔名, 1: 相對路徑, 2: 絕對路徑
						shorting_target = 40,
						symbols = {
							modified = "[+]",
							readonly = "[-]",
							unnamed = "[未命名]",
							newfile = "[新檔案]",
						},
					},
				},
				-- 右側
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
				lualine_y = { "progress" }, -- 檔案位置百分比
				lualine_z = { "location" }, -- 行號:列號
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
