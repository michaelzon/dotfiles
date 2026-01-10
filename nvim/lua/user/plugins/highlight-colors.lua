return {
	"brenoprata10/nvim-highlight-colors",
	-- lazy = false,
	-- priority = 1000,
	config = function()
		require("nvim-highlight-colors").setup({
			render = "virtual",
			virtual_symbol = '■',
		})
	end,
}
