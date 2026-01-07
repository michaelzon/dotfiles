return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			-- add the config here
			themes = {
				{
					name = "Kanagawa Day",
					colorscheme = "kanagawa-lotus",
				},
				{
					name = "Kanagawa Night",
					colorscheme = "kanagawa-dragon",
				},
				{
					name = "Ayu Mirage",
					colorscheme = "ayu-mirage",
				},
				{
					name = "Ayu Light",
					colorscheme = "ayu-light",
				},
				{
					name = "Tokyo Night Moon",
					colorscheme = "tokyonight",
					before = [[
            require("tokyonight").setup({
              style = "moon",
            })
            vim.opt.background = "dark"
          ]],
				},

				{
					name = "Tokyo Night Storm",
					colorscheme = "tokyonight",
					before = [[
            require("tokyonight").setup({
              style = "storm",
            })
            vim.opt.background = "dark"
          ]],
				},

				{
					name = "Tokyo Night Night",
					colorscheme = "tokyonight",
					before = [[
            require("tokyonight").setup({
              style = "night",
            })
            vim.opt.background = "dark"
          ]],
				},

				{
					name = "Tokyo Night Day",
					colorscheme = "tokyonight",
					before = [[
            require("tokyonight").setup({
              style = "day",
            })
            vim.opt.background = "light"
          ]],
				},
			},
			livePreview = true, -- Apply theme while picking. Default to true.
		})
	end,
}
