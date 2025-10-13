return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")
		npairs.setup({
			check_ts = true,
		})
		-- 與 nvim-cmp 整合：在 confirm 時自動補全配對符號
		local cmp_ok, cmp = pcall(require, "cmp")
		if cmp_ok then
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end
	end,
}
