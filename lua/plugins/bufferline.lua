return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- 顯示緩衝區而非標籤頁
				style_preset = require("bufferline").style_preset.default,
				themable = true,
				numbers = "none", -- 不顯示編號
				close_command = "bdelete! %d", -- 關閉緩衝區指令
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator = {
					icon = "▎", -- 當前緩衝區指示器
					style = "icon",
				},
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 18,
				max_prefix_length = 15,
				truncate_names = true,
				tab_size = 20,
				diagnostics = "nvim_lsp", -- 顯示 LSP 診斷
				diagnostics_update_in_insert = false,
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "檔案總管",
						text_align = "center",
						separator = true,
					},
				},
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = false,
				show_tab_indicators = true,
				show_duplicate_prefix = true,
				persist_buffer_sort = true,
				separator_style = "thin", -- 分隔符樣式: "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				sort_by = "insert_after_current", -- 排序方式
			},
			highlights = {
				fill = {
					bg = "none", -- 透明背景
				},
				background = {
					bg = "none",
				},
				buffer_selected = {
					bold = true,
					italic = false,
				},
			},
		})
	end,
}
