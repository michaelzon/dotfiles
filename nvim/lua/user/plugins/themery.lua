return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			-- add the config here
			themes = {
				{
					name = "Rose Pine",
					colorscheme = "rose-pine-main",
				},
				{
					name = "Rose Pine Moon",
					colorscheme = "rose-pine-moon",
				},
				{
					name = "Rose Pine Dawn",
					colorscheme = "rose-pine-dawn",
				},
				{
					name = "Github Dark",
					colorscheme = "github_dark",
				},
				{
					name = "Github Dark Default",
					colorscheme = "github_dark_default",
				},
				{
					name = "Github Dark Dimmed",
					colorscheme = "github_dark_dimmed",
				},
				{
					name = "Github Dark High Contrast",
					colorscheme = "github_dark_high_contrast",
				},
				{
					name = "Github Dark Tritanopia",
					colorscheme = "github_dark_tritanopia",
				},
				{
					name = "Github Light",
					colorscheme = "github_light",
				},
				{
					name = "Github Light Default",
					colorscheme = "github_light_default",
				},
				{
					name = "Github Light High Contrast",
					colorscheme = "github_light_high_contrast",
				},
				{
					name = "Github Light Tritanopia",
					colorscheme = "github_light_tritanopia",
				},
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
