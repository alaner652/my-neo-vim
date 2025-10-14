-- Kitty Navigator Plugin
-- 在 Neovim 分割窗口和 Kitty 窗口之間無縫導航
return {
	"knubie/vim-kitty-navigator",
	-- Python scripts are already in kitty config, no build needed
	-- If needed: cp ~/.local/share/nvim/lazy/vim-kitty-navigator/*.py ~/.config/kitty/
	config = function()
		-- Keymaps are defined in keymaps.lua (Ctrl+h/j/k/l)
		-- This plugin enables seamless navigation between Neovim splits and Kitty windows
		--
		-- Requirements:
		-- 1. Kitty config must have: allow_remote_control yes, listen_on unix:/tmp/kitty
		-- 2. Kitty must use pass_keys.py kitten for window navigation
		-- 3. See kitty.conf for complete setup
	end,
}
