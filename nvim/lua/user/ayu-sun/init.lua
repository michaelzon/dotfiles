local M = {}

local colors = {

	delimiters = {
		purple = "#a37acc",
		pink = "#da70d6",
		blue = "#399EE6",
		yellow = "#ffd173",
	},

	editor = {
		bg = "#242936",
		--bg = '#000000',
		fg = "#CCCAC2",
		line = "#1A1F29",
	},

	syntax = {
		identifier = "#c3c1bb",
		entity = "#73D0FF",
		tag = "#5CCFE6",
		keyword = "#FFAD66",
		string = "#D5FF80",
		func = "#FFD173",
		comment = "#6C7A8B",
		type = "#73D0FF",
		constant = "#DFBFFF",
		operator = "#F29E74",
		regexp = "#95E6CB",
		markup = "#F28779",
		special = "#FFDFB3",
	},

	ui = {
		fg = "#707a8c",
		bg = "#1F2430",
		line = "#171B24",
		second_line = "#1b1f29",
		panel = "#282E3B",
	},

	common = {
		accent = "#FFCC66",
		error = "#FF6666",
	},
}

function M.colorscheme()
	vim.cmd("highlight clear")
	vim.cmd("syntax reset")

	vim.o.background = "dark"
	vim.g.colors_name = "ayu-sun"

	local set = vim.api.nvim_set_hl

	-- normal
	set(0, "Normal", { fg = colors.editor.fg, bg = colors.editor.bg })
	set(0, "CursorLine", { bg = colors.ui.second_line })
	set(0, "Comment", { fg = colors.syntax.comment, italic = true })
	set(0, "Constant", { fg = colors.syntax.constant })
	set(0, "String", { fg = colors.syntax.string })
	set(0, "Identifier", { fg = colors.syntax.identifier })
	set(0, "Function", { fg = colors.syntax.func })
	set(0, "Statement", { fg = colors.syntax.keyword })
	set(0, "Type", { fg = colors.syntax.type })
	set(0, "Special", { fg = colors.syntax.special })
	set(0, "Error", { fg = colors.common.error, bold = true })
	set(0, "Delimiter", { fg = colors.common.accent })
	set(0, "Operator", { fg = colors.syntax.keyword })
	set(0, "IndentBlanklineContextChar", { fg = colors.syntax.comment})

	-- TREESITTER

	-- typescript
	set(0, "@type.builtin", { fg = colors.syntax.type })
	set(0, "@tag.builtin.tsx", { fg = colors.syntax.tag })
	set(0, "@tag.tsx", { fg = colors.syntax.tag })
	set(0, "@tag.attribute.tsx", { fg = colors.common.accent })
	set(0, "@tag.delimiter.tsx", { fg = colors.syntax.tag })
	set(0, "@punctuation.bracket.tsx", { fg = colors.delimiters.blue })
	set(0, "@variable.parameter.tsx", { fg = colors.syntax.constant })
	set(0, "@lsp.type.parameter.typescriptreact", { fg = colors.syntax.constant })

	-- rainbow delimiters (only brackets and parentheses etc)
	set(0, "RainbowDelimiterPink", { fg = colors.delimiters.pink })
	set(0, "RainbowDelimiterYellow", { fg = colors.delimiters.yellow })
	set(0, "RainbowDelimiterBlue", { fg = colors.delimiters.blue })
end

return M
