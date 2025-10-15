-- =====================================================
-- 簡潔快捷鍵配置（終端友好）
-- =====================================================
-- 設計理念：
-- 1. 避免與終端衝突的快捷鍵（Ctrl+A/Z/F 等）
-- 2. 以 Leader 鍵（Space）為核心
-- 3. Ctrl+hjkl 與 Kitty 無縫整合
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
-- 基本編輯操作
-- =====================================================

-- 檔案操作
map("n", "<C-s>", "<cmd>w<cr>", opts) -- 儲存
map("i", "<C-s>", "<Esc><cmd>w<cr>a", opts) -- 插入模式儲存
map("n", "<leader>w", "<cmd>w<cr>", opts) -- Leader+w 儲存
map("n", "<leader>Q", "<cmd>qa!<cr>", opts) -- Leader+Q 強制離開全部

-- 基本編輯
map("n", "<leader>a", "ggVG", opts) -- 全選

-- 搜尋
map("n", "<leader>s", "/", { noremap = true, desc = "搜尋" })
map("n", "<Esc>", "<cmd>noh<cr>", opts) -- 清除高亮

-- 縮排
map("v", "<Tab>", ">gv", opts) -- 增加縮排
map("v", "<S-Tab>", "<gv", opts) -- 減少縮排
map("n", "<", "<<", opts) -- 減少縮排
map("n", ">", ">>", opts) -- 增加縮排

-- =====================================================
-- 視窗管理（與 Kitty 整合）
-- =====================================================

-- 視窗導航（透過 vim-kitty-navigator 與 Kitty 無縫整合）
-- 注意: Ctrl+hjkl 會被 kitty-navigator 攔截用於 Neovim <-> Kitty 切換
-- 如果要在 Neovim 內部切換(例如到 Neo-tree),使用 Leader+w+方向鍵
map("n", "<C-h>", "<C-w>h", opts) -- 左視窗
map("n", "<C-j>", "<C-w>j", opts) -- 下視窗
map("n", "<C-k>", "<C-w>k", opts) -- 上視窗
map("n", "<C-l>", "<C-w>l", opts) -- 右視窗

-- 備用視窗導航(確保在 Neovim 內部始終可用)
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
-- Buffer/Tab 管理（簡化版）
-- =====================================================

-- Buffer 切換（使用 Vim 風格快捷鍵）
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "下一個 buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "上一個 buffer" })
map("n", "<leader>c", "<cmd>bdelete<cr>", { desc = "關閉目前 buffer" })
map("n", "<leader>C", "<cmd>BufferLineCloseOthers<cr>", { desc = "關閉其他 buffer" })

-- Buffer 跳轉（只保留 Leader+數字，更可靠）
map("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "跳到 buffer 1" })
map("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "跳到 buffer 2" })
map("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "跳到 buffer 3" })
map("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "跳到 buffer 4" })
map("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "跳到 buffer 5" })
map("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "跳到 buffer 6" })
map("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "跳到 buffer 7" })
map("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "跳到 buffer 8" })
map("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "跳到 buffer 9" })

-- Buffer 排序
map("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "釘選/取消釘選 buffer" })
map("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", { desc = "關閉左側 buffers" })
map("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", { desc = "關閉右側 buffers" })

-- =====================================================
-- 檔案操作（Telescope - 以 Leader 鍵為主）
-- =====================================================

-- 主要操作（保留 Ctrl+P 作為特例，因為常用且不衝突）
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "快速開啟檔案" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "尋找檔案" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "全域搜尋" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffer 列表" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "最近檔案" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "說明文件" })
map("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "指令列表" })

-- 側邊欄（保留 Ctrl+B，因為與 Kitty 不衝突）
map("n", "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "切換側邊欄" })
map("n", "<leader>e", "<cmd>Neotree focus<cr>", { desc = "聚焦側邊欄" })
map("n", "<leader>E", "<cmd>Neotree reveal<cr>", { desc = "在側邊欄中定位目前檔案" })

-- =====================================================
-- 行操作（簡化版）
-- =====================================================

-- 移動行（使用 Alt 鍵避免與終端衝突）
map("n", "<A-j>", ":m .+1<cr>==", opts) -- 向下移動行
map("n", "<A-k>", ":m .-2<cr>==", opts) -- 向上移動行
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts) -- 向下移動選取行
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts) -- 向上移動選取行

-- 複製行
map("n", "<leader>dd", "yyp", { desc = "複製目前行" })

-- =====================================================
-- 註解（統一使用 Leader 鍵）
-- =====================================================
-- 需要 Comment.nvim 外掛
map("n", "<leader>/", "gcc", { remap = true, desc = "切換註解" })
map("v", "<leader>/", "gc", { remap = true, desc = "切換註解" })

-- =====================================================
-- 其他實用操作
-- =====================================================

-- 貼上改進
map("v", "p", '"_dP', opts) -- 貼上不覆蓋暫存器

-- 快速離開插入模式
map("i", "jk", "<Esc>", opts) -- jk 離開插入模式

-- 分割視窗下的終端機
map("n", "<leader>tt", "<cmd>split | terminal<cr>", { desc = "開啟終端機" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<cr>", { desc = "垂直終端機" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", opts) -- 終端模式下雙擊 Esc 離開

-- =====================================================
-- Export Module (for plugin use)
-- =====================================================
return M
