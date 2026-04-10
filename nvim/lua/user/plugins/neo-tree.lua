return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = {
			{ "<leader>1", ":Neotree reveal=true position=left<CR>" },
			{ "<leader>n", ":Neotree reveal=true position=float<CR>" },
		},
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		opts = {
			close_if_last_window = true,
			filesystem = {
				filtered_items = {
					visible = false,
					show_hidden_count = true,
					hide_dotfiles = true,
					hide_gitignored = true,
					hide_by_name = {
						-- ".git",
					},
					never_show = {
						".DS_Store",
					},
				},
			},
		},
		config = function(_, opts)
			require("neo-tree").setup(opts)

			vim.api.nvim_create_user_command("NeotreeToggleHidden", function()
				local manager = require("neo-tree.sources.manager")
				local commands = require("neo-tree.sources.filesystem.commands")
				commands.toggle_hidden(manager.get_state("filesystem"))
			end, { desc = "Neo-tree: toggle hidden (dotfiles + gitignored)" })
		end,
	},
}
