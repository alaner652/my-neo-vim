-- =====================================================
-- 簡潔快捷鍵配置（終端友好）
-- =====================================================
-- 設計理念：
-- 1. 避免與終端衝突的快捷鍵（Ctrl+A/Z/F 等）
-- 2. 以 Leader 鍵（Space）為核心
-- 3. 保留 Vim 原生 Ctrl+w 視窗導覽
-- 4. 簡單直觀，易於記憶
-- =====================================================

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- =====================================================
-- LSP Keymaps Setup Function (for plugin use)
-- =====================================================
local M = {}

-- LSP on_attach keymaps
M.setup_lsp_keymaps = function(_, bufnr)
	local buf_opts = { buffer = bufnr, noremap = true, silent = true }

	-- LSP 導航
	map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", buf_opts, { desc = "跳轉到定義" }))
	map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", buf_opts, { desc = "跳轉到聲明" }))
	map("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", buf_opts, { desc = "跳轉到實作" }))
	map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", buf_opts, { desc = "顯示引用" }))
	map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", buf_opts, { desc = "顯示文件" }))

	-- LSP 操作
	map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", buf_opts, { desc = "重新命名符號" }))
	map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", buf_opts, { desc = "程式碼操作" }))
	map("n", "<F2>", vim.lsp.buf.rename, vim.tbl_extend("force", buf_opts, { desc = "重新命名 (F2)" }))

	-- 診斷訊息
	map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", buf_opts, { desc = "上一個診斷" }))
	map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", buf_opts, { desc = "下一個診斷" }))
	map("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", buf_opts, { desc = "顯示診斷" }))
	map("n", "<leader>dl", vim.diagnostic.setloclist, vim.tbl_extend("force", buf_opts, { desc = "診斷列表" }))
end

-- Format keymaps (for LSP/formatters with formatting capability)
M.setup_format_keymaps = function(_, bufnr)
	local buf_opts = { buffer = bufnr, noremap = true, silent = true }

	map("n", "<leader>fm", function()
		vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
	end, vim.tbl_extend("force", buf_opts, { desc = "格式化檔案" }))

	map("v", "<leader>fm", function()
		vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
	end, vim.tbl_extend("force", buf_opts, { desc = "格式化選取" }))
end

-- =====================================================
-- 基本編輯操作（避免 Leader 前綴衝突）
-- 使用 <leader>f* 管理檔案相關操作，防止與視窗快捷鍵互搶時序
map("n", "<leader>fs", "<cmd>w<cr>", opts) -- 儲存檔案
map("n", "<leader>fq", "<cmd>q<cr>", opts) -- 關閉目前視窗
map("n", "<leader>fQ", "<cmd>qa!<cr>", opts) -- 強制離開全部
map("n", "<leader>sa", "ggVG", opts) -- 全選（Select All）
map("n", "<Esc>", "<cmd>noh<cr>", opts) -- 清除高亮

-- 縮排
map("v", "<Tab>", ">gv", opts) -- 增加縮排
map("v", "<S-Tab>", "<gv", opts) -- 減少縮排
map("n", "<", "<<", opts) -- 減少縮排
map("n", ">", ">>", opts) -- 增加縮排

-- =====================================================
-- 視窗管理
-- =====================================================

-- Leader 視窗導航（保留 Neovim 原生 Ctrl+W 鍵位）
map("n", "<leader>wh", "<C-w>h", opts) -- 左視窗
map("n", "<leader>wj", "<C-w>j", opts) -- 下視窗
map("n", "<leader>wk", "<C-w>k", opts) -- 上視窗
map("n", "<leader>wl", "<C-w>l", opts) -- 右視窗

-- 分割視窗（使用 Leader 鍵）
map("n", "<leader>v", "<cmd>vsplit<cr>", opts) -- 垂直分割
map("n", "<leader>h", "<cmd>split<cr>", opts) -- 水平分割
map("n", "<leader>x", "<cmd>close<cr>", opts) -- 關閉目前視窗

-- 視窗大小調整
map("n", "<leader>=", "<C-w>=", opts) -- 平均分配視窗
map("n", "<leader>-", "<cmd>resize -5<cr>", opts) -- 減小高度
map("n", "<leader>+", "<cmd>resize +5<cr>", opts) -- 增加高度
map("n", "<leader><", "<cmd>vertical resize -5<cr>", opts) -- 減小寬度
map("n", "<leader>>", "<cmd>vertical resize +5<cr>", opts) -- 增加寬度

-- =====================================================
-- Buffer 管理
-- =====================================================

map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "下一個 buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "上一個 buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "關閉目前 buffer" })
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "關閉其他 buffer" })

-- =====================================================
-- 檔案操作（Telescope - 以 Leader 鍵為主）
-- =====================================================

-- 主要操作（統一使用 Leader）
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "尋找檔案" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "全域搜尋" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffer 列表" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "最近檔案" })

-- 側邊欄
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "切換側邊欄" })
map("n", "<leader>E", "<cmd>Neotree reveal<cr>", { desc = "在側邊欄中定位目前檔案" })

-- =====================================================
-- 註解（統一使用 Leader 鍵）
-- =====================================================
-- 需要 Comment.nvim 外掛
map("n", "<leader>/", "gcc", { remap = true, desc = "切換註解" })
map("v", "<leader>/", "gc", { remap = true, desc = "切換註解" })

-- =====================================================
-- Export Module (for plugin use)
-- =====================================================
return M
