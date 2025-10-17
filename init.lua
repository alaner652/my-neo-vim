vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- VSCode-style basic settings
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Smart case search
vim.opt.hlsearch = true -- Highlight search results
vim.opt.incsearch = true -- Incremental search
vim.opt.wrap = false -- Disable line wrapping
vim.opt.breakindent = true -- Preserve indentation
vim.opt.tabstop = 4 -- Tab width
vim.opt.shiftwidth = 4 -- Indent width
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart indentation
vim.opt.termguicolors = true -- True color support
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.encoding = "utf-8" -- Set encoding to UTF-8
vim.opt.fileencoding = "utf-8" -- File encoding UTF-8
vim.opt.updatetime = 250 -- Faster update time
vim.opt.timeoutlen = 300 -- Key mapping timeout
vim.opt.splitbelow = true -- Horizontal splits below
vim.opt.splitright = true -- Vertical splits to the right
vim.opt.cursorline = true -- Highlight current line
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

require("config.lazy")
_G.keymaps = require("config.keymaps") -- Load keymaps config and store globally for plugins

-- Set custom highlight for snacks dashboard
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "SnacksDashboardTerminal", { fg = "#a6e3a1" }) -- Light green for ASCII art
    end,
})
vim.api.nvim_set_hl(0, "SnacksDashboardTerminal", { fg = "#a6e3a1" }) -- Light green for ASCII art
