-- Status line

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = {
		"arkav/lualine-lsp-progress",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			component_separators = "",
			globalstatus = true,
			theme = {
				normal = {
					a = "StatusLine",
					b = "StatusLineNC",
					c = "VertSplit",
					x = "StatusLine",
					y = "StatusLine",
					z = "StatusLine",
				},
			},
		},
		sections = {
			lualine_a = {
				"mode",
			},
			lualine_b = {
				"branch",
				{
					"diff",
					symbols = { added = " ", modified = " ", removed = " " },
				},
				function()
					return "󰅭 " .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.get_clients())) or "")
				end,
				{ "diagnostics", sources = { "nvim_diagnostic" } },
			},
			lualine_c = {
				{
					"filename",
					path = 1, -- show relative path instead of just filename
				},
			},
			lualine_x = {
				
				{
				  function()
					return "■ " .. require("lazy.status").updates()
				  end,
				  cond = require("lazy.status").has_updates,
				  color = "StatusLineAccent",
				},
			},
			lualine_y = {
				"filetype",
				"encoding",
				"fileformat",
				'(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
			},
			lualine_z = {
				"searchcount",
				"selectioncount",
				"location",
				"progress",
			},
		},
	},
}
