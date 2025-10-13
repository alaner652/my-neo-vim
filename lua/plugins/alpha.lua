return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- 設置 header
		dashboard.section.header.val = {
			"",
			"",
			"",
			"    ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
			"    ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
			"    ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
			"    ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
			"    ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
			"    ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
			"",
			"",
		}

		-- 設置按鈕
		dashboard.section.buttons.val = {
			dashboard.button("f", "  [f]  查找文件", ":Telescope find_files <CR>"),
			dashboard.button("e", "  [e]  新建文件", ":ene <BAR> startinsert <CR>"),
			dashboard.button("r", "  [r]  最近文件", ":Telescope oldfiles <CR>"),
			dashboard.button("g", "  [g]  查找文字", ":Telescope live_grep <CR>"),
			dashboard.button("c", "  [c]  配置設定", ":e $MYVIMRC <CR>"),
			dashboard.button("q", "  [q]  退出程式", ":qa<CR>"),
		}

		-- 設置 footer
		local function footer()
			local total_plugins = require("lazy").stats().count
			local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
			local version = vim.version()
			local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

			return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
		end

		dashboard.section.footer.val = footer()

		-- 設置顏色
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"
		dashboard.section.footer.opts.hl = "Type"

		-- 發送配置到 alpha
		alpha.setup(dashboard.opts)

		-- 禁用 folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
