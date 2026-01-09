local M = {}

local colors = {
	bright_snow = "#f8f9fa",
	platinum = "#e9ecef",
	alabaster_grey = "#dee2e6",
	pale = "#ced4da",
	pale_slate = "#adb5bd",
	slate_grey = "#6c757d",
	iron_grey = "#495057",
	gun_metal = "#343a40",
	shadow_grey = "#212529",
}

function M.colorscheme()
	vim.cmd("highlight clear")
	vim.cmd("syntax reset")

	vim.o.background = "dark"
	vim.g.colors_name = "oostenburg"

	local set = vim.api.nvim_set_hl

	set(0, "Normal", { bg = colors.shadow_grey, fg = colors.platinum })
end

return M
