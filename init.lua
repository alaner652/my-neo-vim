vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.options")
require("config.lazy")
require("config.autocmds")

_G.keymaps = require("config.keymaps") -- Load keymaps config and store globally for plugins
