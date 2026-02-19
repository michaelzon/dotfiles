return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				require("none-ls.diagnostics.eslint_d").with({
					extra_args = { "--rule", "import/order: 0" },
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		vim.api.nvim_create_user_command("Makepretty", function()
			vim.lsp.buf.format({async = true}) 
		end, { desc = "Make your code pretty with eslint etc" })
	end,
}
