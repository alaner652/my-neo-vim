-- =====================================================
-- VSCode 風格的快捷鍵配置（Alacritty 優化）
-- =====================================================
-- 注意：Alacritty 對快捷鍵支援較好，但某些組合鍵可能需要在
-- ~/.config/alacritty/alacritty.yml 中額外設定

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- =====================================================
-- LSP 快捷鍵設定函數（供插件使用）
-- =====================================================
local M = {}

-- LSP on_attach 快捷鍵設定
M.setup_lsp_keymaps = function(_, bufnr)
	local buf_opts = { buffer = bufnr, noremap = true, silent = true }

	-- LSP 導航
	map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", buf_opts, { desc = "跳到定義" }))
	map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", buf_opts, { desc = "跳到宣告" }))
	map("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", buf_opts, { desc = "跳到實作" }))
	map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", buf_opts, { desc = "查看引用" }))
	map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", buf_opts, { desc = "顯示文件" }))

	-- LSP 動作
	map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", buf_opts, { desc = "重新命名" }))
	map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", buf_opts, { desc = "程式碼動作" }))
	map("n", "<F2>", vim.lsp.buf.rename, vim.tbl_extend("force", buf_opts, { desc = "重新命名 (F2)" }))

	-- 診斷
	map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", buf_opts, { desc = "上一個診斷" }))
	map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", buf_opts, { desc = "下一個診斷" }))
	map("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", buf_opts, { desc = "顯示診斷" }))
	map("n", "<leader>q", vim.diagnostic.setloclist, vim.tbl_extend("force", buf_opts, { desc = "診斷列表" }))
end

-- 格式化快捷鍵設定（供有格式化功能的 LSP/formatter 使用）
M.setup_format_keymaps = function(_, bufnr)
	local buf_opts = { buffer = bufnr, noremap = true, silent = true }

	map("n", "<leader>f", function()
		vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
	end, vim.tbl_extend("force", buf_opts, { desc = "格式化檔案" }))

	map("v", "<leader>f", function()
		vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
	end, vim.tbl_extend("force", buf_opts, { desc = "格式化選取" }))
end

-- =====================================================
-- 一般快捷鍵
-- =====================================================

-- == VSCode 風格快捷鍵 ==

-- 檔案操作
map("n", "<C-s>", "<cmd>w<cr>", opts) -- Ctrl+S 儲存
map("i", "<C-s>", "<Esc><cmd>w<cr>a", opts) -- Insert 模式下也能儲存
map("n", "<C-w>", "<cmd>bd<cr>", opts) -- Ctrl+W 關閉緩衝區
map("n", "<C-q>", "<cmd>qa<cr>", opts) -- Ctrl+Q 退出全部

-- 視窗切換 (保留原有的 Vim 風格)
map("n", "<C-h>", "<C-w>h", opts) -- 移到左邊視窗
map("n", "<C-j>", "<C-w>j", opts) -- 移到下面視窗
map("n", "<C-k>", "<C-w>k", opts) -- 移到上面視窗
map("n", "<C-l>", "<C-w>l", opts) -- 移到右邊視窗

-- 分割視窗 (VSCode 風格)
map("n", "<C-\\>", "<cmd>vsplit<cr>", opts) -- Ctrl+\ 垂直分割

-- 編輯操作
map("n", "<C-a>", "ggVG", opts) -- Ctrl+A 全選
map("i", "<C-a>", "<Esc>ggVG", opts) -- Insert 模式全選
map("n", "<C-z>", "u", opts) -- Ctrl+Z 復原
map("n", "<C-y>", "<C-r>", opts) -- Ctrl+Y 重做

-- 行操作 (VSCode 風格)
-- 注意：macOS Terminal 需要設定 Option 為 Meta 鍵才能使用 Alt
map("n", "<A-Down>", ":m .+1<cr>==", opts) -- Alt+Down 向下移動行
map("n", "<A-Up>", ":m .-2<cr>==", opts) -- Alt+Up 向上移動行
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", opts) -- Visual 模式向下移動
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", opts) -- Visual 模式向上移動
-- 備用方案：使用 Shift+J/K
map("n", "<S-Down>", ":m .+1<cr>==", opts) -- Shift+Down 向下移動行 (備用)
map("n", "<S-Up>", ":m .-2<cr>==", opts) -- Shift+Up 向上移動行 (備用)
map("v", "<S-Down>", ":m '>+1<cr>gv=gv", opts) -- Visual 模式向下移動 (備用)
map("v", "<S-Up>", ":m '<-2<cr>gv=gv", opts) -- Visual 模式向上移動 (備用)
map("n", "<C-d>", "yyp", opts) -- Ctrl+D 複製當前行到下一行
map("i", "<C-d>", "<Esc>yypi", opts) -- Insert 模式複製行

-- 註解 (需要 Comment.nvim 插件)
map("n", "<C-/>", "gcc", { remap = true }) -- Ctrl+/ 切換註解 (可能不工作)
map("v", "<C-/>", "gc", { remap = true }) -- Visual 模式切換註解
map("n", "<C-_>", "gcc", { remap = true }) -- Ctrl+/ 替代 (終端機實際按鍵)
map("v", "<C-_>", "gc", { remap = true }) -- Visual 模式替代
map("n", "<leader>/", "gcc", { remap = true }) -- Space+/ 註解 (備用)
map("v", "<leader>/", "gc", { remap = true }) -- Visual 模式備用

-- 搜尋
map("n", "<C-f>", "/", { noremap = true }) -- Ctrl+F 搜尋
map("n", "<Esc>", "<cmd>noh<cr>", opts) -- ESC 清除高亮

-- 縮排
map("v", "<Tab>", ">gv", opts) -- Tab 增加縮排
map("v", "<S-Tab>", "<gv", opts) -- Shift+Tab 減少縮排

-- 快速導航
map("n", "<C-Home>", "gg", opts) -- Ctrl+Home 跳到檔案開頭
map("n", "<C-End>", "G", opts) -- Ctrl+End 跳到檔案結尾

-- == 插件快捷鍵 (VSCode 風格) ==

-- Neo-tree (側邊欄)
map("n", "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "切換側邊欄" }) -- Ctrl+B 切換側邊欄
map("n", "<leader>e", "<cmd>Neotree focus<cr>", { desc = "聚焦側邊欄" }) -- Space+E 聚焦到側邊欄

-- Telescope (快速開啟)
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "快速開啟檔案" }) -- Ctrl+P 開啟檔案
map("n", "<C-S-f>", "<cmd>Telescope live_grep<cr>", { desc = "全域搜尋" }) -- Ctrl+Shift+F (可能不工作)
map("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "全域搜尋" }) -- Space+sg 全域搜尋 (備用)
map("n", "<C-S-p>", "<cmd>Telescope commands<cr>", { desc = "指令面板" }) -- Ctrl+Shift+P (可能不工作)
map("n", "<leader>sc", "<cmd>Telescope commands<cr>", { desc = "指令面板" }) -- Space+sc 指令面板 (備用)
map("n", "<C-Tab>", "<cmd>Telescope buffers<cr>", { desc = "切換檔案" }) -- Ctrl+Tab (可能不工作)
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "切換檔案" }) -- Space+bb 切換檔案 (備用)

-- 傳統快捷鍵 (備用)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "尋找檔案" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "全域搜尋" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "緩衝區列表" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "幫助文件" })

-- Bufferline (標籤頁管理 - VSCode 風格)
map("n", "<A-,>", "<cmd>BufferLineCyclePrev<cr>", { desc = "上一個標籤" }) -- Alt+, 上一個
map("n", "<A-.>", "<cmd>BufferLineCycleNext<cr>", { desc = "下一個標籤" }) -- Alt+. 下一個
map("n", "<A-<>", "<cmd>BufferLineMovePrev<cr>", { desc = "向左移動標籤" }) -- Alt+< 向左移
map("n", "<A->>", "<cmd>BufferLineMoveNext<cr>", { desc = "向右移動標籤" }) -- Alt+> 向右移
map("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "跳到標籤 1" })
map("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "跳到標籤 2" })
map("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "跳到標籤 3" })
map("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "跳到標籤 4" })
map("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "跳到標籤 5" })
map("n", "<A-6>", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "跳到標籤 6" })
map("n", "<A-7>", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "跳到標籤 7" })
map("n", "<A-8>", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "跳到標籤 8" })
map("n", "<A-9>", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "跳到標籤 9" })
map("n", "<A-0>", "<cmd>BufferLineGoToBuffer -1<cr>", { desc = "跳到最後標籤" })
map("n", "<A-c>", "<cmd>bdelete<cr>", { desc = "關閉當前標籤" }) -- Alt+C 關閉
map("n", "<A-p>", "<cmd>BufferLineTogglePin<cr>", { desc = "釘選/取消釘選標籤" }) -- Alt+P 釘選

-- 複製貼上改進
map("v", "p", '"_dP', opts) -- 貼上時不覆蓋暫存器

-- =====================================================
-- 匯出模組（供插件使用）
-- =====================================================
return M
