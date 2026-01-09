-- https://github.com/Danielkonge/dotfiles/blob/main/nvim/lua/daniel/plugins/rainbow_delimiters.lua

vim.keymap.set("n", "<leader>e", function()
	vim.cmd.write()
	vim.cmd.edit()
end, { desc = "Reload file" })

return {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		local rd = require("rainbow-delimiters")

		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rd.strategy["global"],
			},
			query = {
				[""] = "rainbow-parens",
			},
			highlight = {
				"RainbowDelimiterYellow",
				"RainbowDelimiterPink",
				"RainbowDelimiterBlue",
			},
		}
	end,
}
