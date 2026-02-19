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

local palette = {
	syntax = {
		tag = {
			light = "#55B4D4",
			mirage = "#5CCFE6",
			dark = "#39BAE6",
		},
		func = {
			light = "#F2AE49",
			mirage = "#FFD173",
			dark = "#FFB454",
		},
		entity = {
			light = "#399EE6",
			mirage = "#73D0FF",
			dark = "#59C2FF",
		},
		string = {
			light = "#86B300",
			mirage = "#D5FF80",
			dark = "#AAD94C",
		},
		regexp = {
			light = "#4CBF99",
			mirage = "#95E6CB",
			dark = "#95E6CB",
		},
		markup = {
			light = "#F07171",
			mirage = "#F28779",
			dark = "#F07178",
		},
		keyword = {
			light = "#FA8D3E",
			mirage = "#FFAD66",
			dark = "#FF8F40",
		},
		special = {
			light = "#E6BA7E",
			mirage = "#FFDFB3",
			dark = "#E6B673",
		},
		comment = {
			light = "#787B8099",
			mirage = "#B8CFE680",
			dark = "#ACB6BF8C",
		},
		constant = {
			light = "#A37ACC",
			mirage = "#DFBFFF",
			dark = "#D2A6FF",
		},
		operator = {
			light = "#ED9366",
			mirage = "#F29E74",
			dark = "#F29668",
		},
	},
	vcs = {
		added = {
			light = "#6CBF43",
			mirage = "#87D96C",
			dark = "#7FD962",
		},
		modified = {
			light = "#478ACC",
			mirage = "#80BFFF",
			dark = "#73B8FF",
		},
		removed = {
			light = "#FF7383",
			mirage = "#F27983",
			dark = "#F26D78",
		},
	},
	editor = {
		fg = {
			light = "#5C6166",
			mirage = "#CCCAC2",
			dark = "#BFBDB6",
		},
		bg = {
			light = "#FCFCFC",
			mirage = "#242936",
			dark = "#0D1017",
		},
		line = {
			light = "#8A91991A",
			mirage = "#1A1F29",
			dark = "#131721",
		},
		selection_active = {
			light = "#035BD626",
			mirage = "#409FFF40",
			dark = "#409FFF4D",
		},
		selection_inactive = {
			light = "#035BD612",
			mirage = "#409FFF21",
			dark = "#409FFF21",
		},
		findMatch_active = {
			light = "#9F40FF2B",
			mirage = "#695380",
			dark = "#6C5980",
		},
		findMatch_inactive = {
			light = "#9F40FFCC",
			mirage = "#69538066",
			dark = "#6C598066",
		},
		gutter_active = {
			light = "#8A9199CC",
			mirage = "#8A9199CC",
			dark = "#6C7380E6",
		},
		gutter_normal = {
			light = "#8A919966",
			mirage = "#8A919966",
			dark = "#6C738099",
		},
		indentGuide_active = {
			light = "#8A919959",
			mirage = "#8A919959",
			dark = "#6C738080",
		},
		indentGuide_normal = {
			light = "#8A91992E",
			mirage = "#8A91992E",
			dark = "#6C738033",
		},
	},
	ui = {
		fg = {
			light = "#8A9199",
			mirage = "#707A8C",
			dark = "#565B66",
		},
		bg = {
			light = "#F8F9FA",
			mirage = "#1F2430",
			dark = "#0B0E14",
		},
		line = {
			light = "#6B7D8F1F",
			mirage = "#171B24",
			dark = "#11151C",
		},
		selection_active = {
			light = "#56728F1F",
			mirage = "#63759926/",
			dark = "#47526640",
		},
		selection_normal = {
			light = "#6B7D8F1F",
			mirage = "#69758C1F",
			dark = "#47526633",
		},
		panel_bg = {
			light = "#F3F4F5",
			mirage = "#1C212B",
			dark = "#0F131A",
		},
		panel_shadow = {
			light = "#00000026",
			mirage = "#12151CB3",
			dark = "#00000080	",
		},
	},
	common = {
		accent = {
			light = "#FFAA33",
			mirage = "#FFCC66",
			dark = "#E6B450",
		},
		error = {
			light = "#E65050",
			mirage = "#FF6666",
			dark = "#D95757",
		},
	},
}

function M.colorscheme()
	vim.cmd("highlight clear")
	vim.cmd("syntax reset")
	--
	vim.o.background = "dark"
	vim.g.colors_name = "ayu-sun"
	--
	local set = vim.api.nvim_set_hl
	--
	-- 	-- Core editor
	-- 	set(0, "Normal", {
	-- 		fg = palette.editor.fg.mirage,
	-- 		bg = palette.editor.bg.mirage,
	-- 	})
	--
	-- 	set(0, "NormalFloat", {
	-- 		fg = palette.editor.fg.mirage,
	-- 		bg = palette.ui.panel_bg.mirage,
	-- 	})
	--
	-- 	set(0, "FloatBorder", {
	-- 		fg = palette.ui.fg.mirage,
	-- 		bg = palette.ui.panel_bg.mirage,
	-- 	})
	--
	-- 	-- Cursor / selection
	-- 	set(0, "CursorLine", {
	-- 		bg = palette.editor.line.mirage,
	-- 	})
	--
	-- 	set(0, "Visual", {
	-- 		bg = "#DFBFFF",
	-- 	})
	--
	-- 	-- Search
	-- 	set(0, "Search", {
	-- 		fg = palette.editor.bg.mirage,
	-- 		bg = palette.common.accent.mirage,
	-- 	})
	--
	-- 	set(0, "IncSearch", {
	-- 		fg = palette.editor.bg.mirage,
	-- 		bg = palette.syntax.keyword.mirage,
	-- 	})
	--
	-- 	-- Statusline
	-- 	set(0, "StatusLine", {
	-- 		fg = palette.editor.fg.mirage,
	-- 		bg = palette.ui.bg.mirage,
	-- 	})
	--
	-- 	set(0, "StatusLineNC", {
	-- 		fg = palette.ui.fg.mirage,
	-- 		bg = palette.editor.line.mirage,
	-- 	})
	--
	-- 	-- Splits / separators
	-- 	set(0, "VertSplit", {
	-- 		fg = palette.ui.line.mirage,
	-- 		bg = palette.editor.bg.mirage,
	-- 	})
	--
	-- 	set(0, "WinSeparator", {
	-- 		fg = palette.ui.line.mirage,
	-- 		bg = palette.editor.bg.mirage,
	-- 	})
	--
	-- 	-- Line numbers / gutter
	-- 	set(0, "LineNr", {
	-- 		-- fg = palette.editor.gutter_normal.mirage,
	-- 		bg = palette.editor.bg.mirage,
	-- 	})
	--
	-- 	set(0, "CursorLineNr", {
	-- 		-- fg = palette.editor.gutter_active.mirage,
	-- 		bg = palette.editor.line.mirage,
	-- 	})
	--
	-- 	set(0, "SignColumn", {
	-- 		bg = palette.editor.bg.mirage,
	-- 	})
	--
	-- 	-- Folding
	-- 	set(0, "Folded", {
	-- 		fg = palette.ui.fg.mirage,
	-- 		-- bg = palette.editor.selection_inactive.mirage,
	-- 		italic = true,
	-- 	})
	--
	-- 	-- Indent guides (indent-blankline / ibl)
	-- 	set(0, "IndentBlanklineContextChar", {
	-- 		-- fg = palette.editor.indentGuide_active.mirage,
	-- 	})
	--
	-- 	-- Statusline base
	-- 	set(0, "StatusLine", {
	-- 	  fg = colors.editor.fg,
	-- 	  bg = colors.ui.bg,
	-- 	})
	--
	-- 	set(0, "StatusLineNC", {
	-- 	  fg = colors.ui.fg,
	-- 	  bg = colors.ui.bg,
	-- 	})
	--
	-- 	-- Accent for updates / warnings
	-- 	set(0, "StatusLineAccent", {
	-- 	  fg = colors.common.accent,
	-- 	  bg = colors.ui.bg,
	-- 	})
	--
	-- 	-- Errors / diagnostics
	-- 	set(0, "StatusLineError", {
	-- 	  fg = colors.common.error,
	-- 	  bg = colors.ui.bg,
	-- 	})
	-- base ui
	--
	-- set(0, "Normal", { fg = colors.editor.fg, bg = colors.editor.bg })
	-- set(0, "NormalFloat", { fg = colors.editor.fg, bg = colors.editor.bg })
	-- set(0, "FloatBorder", { fg = colors.editor.fg, bg = colors.editor.bg })
	-- set(0, "CursorLine", { bg = colors.ui.second_line })
	-- set(0, "Visual", { fg = colors.editor.fg, bg = colors.editor.bg })
	-- set(0, "Search", { fg = colors.editor.fg, bg = colors.editor.bg })
	-- set(0, "IncSearch", { fg = colors.editor.fg, bg = colors.editor.bg })
	-- set(0, "StatusLine", { fg = colors.editor.fg, bg = colors.editor.bg })
	-- set(0, "StatuslineNC", { bg = colors.ui.second_line })
	-- set(0, "VertSplit", { bg = colors.ui.second_line })
	-- set(0, "WinSeparator", { bg = colors.ui.second_line })
	-- set(0, "LineNr", { bg = colors.ui.second_line })
	-- set(0, "CursorLine", { bg = colors.ui.second_line })
	-- set(0, "SignColumn", { bg = palette.syntax.keyword.mirage })
	-- set(0, "Folded", { fg = palette.editor.bg.dark, bg = palette.vcs.added.mirage })
	-- set(0, "IndentBlanklineContextChar", { fg = colors.syntax.comment })

	-- editor/syntax
	-- set(0, "Comment", { fg = colors.syntax.comment, italic = true })
	-- set(0, "Constant", { fg = colors.syntax.constant })
	-- set(0, "String", { fg = colors.syntax.string })
	-- set(0, "Identifier", { fg = colors.syntax.identifier })
	-- set(0, "Function", { fg = colors.syntax.func })
	-- set(0, "Statement", { fg = colors.syntax.keyword })
	-- set(0, "Type", { fg = colors.syntax.type })
	-- set(0, "Special", { fg = colors.syntax.special })
	-- set(0, "Error", { fg = colors.common.error, bold = true })
	-- set(0, "Delimiter", { fg = colors.common.accent })
	-- set(0, "Operator", { fg = colors.syntax.keyword })
	--set(0, "Statusline", { fg = colors.common.accent, bg = palette.syntax.tag.light})
	--set(0, "StatuslineNC", { fg = palette.syntax.constant.light, bg = palette.syntax.tag.dark})
	--
	--
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
	set(0, "@constant.php", { fg = colors.syntax.keyword })
	set(0, "@function.call.php", { fg = colors.syntax.markup })

	-- rainbow delimiters (only brackets and parentheses etc)
	set(0, "RainbowDelimiterPink", { fg = colors.delimiters.pink })
	set(0, "RainbowDelimiterYellow", { fg = colors.delimiters.yellow })
	set(0, "RainbowDelimiterBlue", { fg = colors.delimiters.blue })
end

return M
