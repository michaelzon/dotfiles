return {
	enabled = false,
	"adalessa/laravel.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-neotest/nvim-nio",
	},
	ft = { "php", "blade" },
	event = {
		"BufEnter composer.json",
	},
	opts = {
		features = {
			pickers = {
				provider = "snacks", -- "snacks | telescope | fzf-lua | ui-select"
			},
		},
	},
}
