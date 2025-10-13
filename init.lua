vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- VSCode 風格的基本設定
vim.opt.number = true -- 顯示行號
vim.opt.relativenumber = true -- 相對行號
vim.opt.mouse = "a" -- 啟用滑鼠
vim.opt.ignorecase = true -- 搜尋時忽略大小寫
vim.opt.smartcase = true -- 智慧大小寫搜尋
vim.opt.hlsearch = true -- 高亮搜尋結果
vim.opt.incsearch = true -- 即時搜尋
vim.opt.wrap = false -- 不自動換行
vim.opt.breakindent = true -- 保持縮排
vim.opt.tabstop = 2 -- Tab 寬度
vim.opt.shiftwidth = 2 -- 縮排寬度
vim.opt.expandtab = true -- 使用空格代替 Tab
vim.opt.smartindent = true -- 智慧縮排
vim.opt.termguicolors = true -- 真彩色支援
vim.opt.signcolumn = "yes" -- 總是顯示符號欄
vim.opt.updatetime = 250 -- 更快的更新時間
vim.opt.timeoutlen = 300 -- 快捷鍵等待時間
vim.opt.splitbelow = true -- 水平分割在下方
vim.opt.splitright = true -- 垂直分割在右方
vim.opt.cursorline = true -- 高亮當前行
vim.opt.scrolloff = 8 -- 滾動時保持上下 8 行
vim.opt.sidescrolloff = 8 -- 滾動時保持左右 8 列

require("config.lazy")
require("config.keymaps")
