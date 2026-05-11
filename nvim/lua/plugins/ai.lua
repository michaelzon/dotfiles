return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},
	keys = {
		{
			"<leader>oa",
			function()
				require("opencode").ask()
			end,
		},
		{
			"<leader>oa",
			function()
				require("opencode").ask("@this: ")
			end,
			mode = "v",
		},
	},
}
