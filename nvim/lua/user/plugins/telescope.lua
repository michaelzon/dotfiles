-- return {
-- 	"nvim-telescope/telescope.nvim",
-- 	tag = "v0.2.1",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		-- optional but recommended
-- 		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
-- 	},
-- 	pickers = {
-- 		find_files = true
-- 	}
-- }
return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.1",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{
			"<leader>b",
			function()
				require("telescope.builtin").buffers()
			end,
		},
		{
			"<leader>f",
			function()
				require("telescope.builtin").find_files({ hidden = false, previewer = true })
			end,
		},
		{
			"<leader>F",
			function()
				require("telescope.builtin").find_files({
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--no-ignore-vcs",
						"-g",
						"!.git",
						"-g",
						"!.git/**",
					},
					prompt_title = "All Files",
				})
			end,
		},
		{
			"<leader>g",
			function()
				require("telescope").extensions.live_grep_args.live_grep_args({
					prompt_title = "Grep Project",
					vimgrep_arguments = {
						"rg",
						"--hidden",
						"-L",
						"--color=never",
						"--sort=path",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
				})
			end,
		},
		{
			"<leader>G",
			function()
				require("telescope").extensions.live_grep_args.live_grep_args({
					prompt_title = "Grep All Files",
					vimgrep_arguments = {
						"rg",
						"--hidden",
						"--no-ignore-vcs",
						"-g",
						"!.git",
						"-g",
						"!.git/**",
						"-L",
						"--color=never",
						"--sort=path",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
				})
			end,
		},
	},
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<esc>"] = actions.close,
						-- TODO this triggers an macos shortcut
						--['<C-Down>'] = actions.cycle_history_next,
						--['<C-Up>'] = actions.cycle_history_prev,
					},
				},
				-- pickers = {
				--   find_files = {
				--     hidden = false
				--   },
				-- },
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("live_grep_args")
		require("telescope").load_extension("ui-select")
	end,
}
