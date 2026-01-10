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

-- local palette = {
-- tag
-- #55B4D4
-- #5CCFE6
-- #39BAE6
-- func
-- #F2AE49
-- #FFD173
-- #FFB454
-- entity
-- #399EE6
-- #73D0FF
-- #59C2FF
-- string
-- #86B300
-- #D5FF80
-- #AAD94C
-- regexp
-- #4CBF99
-- #95E6CB
-- #95E6CB
-- markup
-- #F07171
-- #F28779
-- #F07178
-- keyword
-- #FA8D3E
-- #FFAD66
-- #FF8F40
-- special
-- #E6BA7E
-- #FFDFB3
-- #E6B673
-- comment
-- #787B8099
-- #B8CFE680
-- #ACB6BF8C
-- constant
-- #A37ACC
-- #DFBFFF
-- #D2A6FF
-- operator
-- #ED9366
-- #F29E74
-- #F29668
-- added
-- #6CBF43
-- #87D96C
-- #7FD962
-- modified
-- #478ACC
-- #80BFFF
-- #73B8FF
-- removed
-- #FF7383
-- #F27983
-- #F26D78
-- fg
-- #5C6166
-- #CCCAC2
-- #BFBDB6
-- bg
-- #FCFCFC
-- #242936
-- #0D1017
-- line
-- #8A91991A
-- #1A1F29
-- #131721
-- selection.active
-- #035BD626
-- #409FFF40
-- #409FFF4D
-- selection.inactive
-- #035BD612
-- #409FFF21
-- #409FFF21
-- findMatch.active
-- #9F40FF2B
-- #695380
-- #6C5980
-- findMatch.inactive
-- #9F40FFCC
-- #69538066
-- #6C598066
-- gutter.active
-- #8A9199CC
-- #8A9199CC
-- #6C7380E6
-- gutter.normal
-- #8A919966
-- #8A919966
-- #6C738099
-- indentGuide.active
-- #8A919959
-- #8A919959
-- #6C738080
-- indentGuide.normal
-- #8A91992E
-- #8A91992E
-- #6C738033
--
-- 		fg
-- #8A9199
-- #707A8C
-- #565B66
-- 		bg
-- #F8F9FA
-- #1F2430
-- #0B0E14
-- 		line
-- #6B7D8F1F
-- #171B24
-- #11151C
-- 		selection.active
-- #56728F1F
-- #63759926
-- #47526640
-- 		selection.normal
-- #6B7D8F1F
-- #69758C1F
-- #47526633
-- 		panel.bg
-- #F3F4F5
-- #1C212B
-- #0F131A
-- 		panel.shadow
-- #00000026
-- #12151CB3
-- #00000080
-- 		COMMON
-- 		accent
-- #FFAA33
-- #FFCC66
-- #E6B450
-- 		error
-- #E65050
-- #FF6666
-- #D95757
-- }
--

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
	set(0, "Statusline", { fg = colors.common.accent })
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

	-- php 
	set(0, "@constant.php" , { fg = colors.syntax.keyword })
	set(0, "@function.call.php" , { fg = colors.syntax.markup })

	-- rainbow delimiters (only brackets and parentheses etc)
	set(0, "RainbowDelimiterPink", { fg = colors.delimiters.pink })
	set(0, "RainbowDelimiterYellow", { fg = colors.delimiters.yellow })
	set(0, "RainbowDelimiterBlue", { fg = colors.delimiters.blue })
end

return M
