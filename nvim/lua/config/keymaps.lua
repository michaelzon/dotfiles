-- SPACE is my leader.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
--vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
--vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true }

-- Reselect visual selection after indenting.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
-- 'm' is for mark
--vim.keymap.set('v', 'y', 'myy`y')
--vim.keymap.set('v', 'Y', 'myY`y')

-- Paste replace visual selection without copying it.
vim.keymap.set("v", "p", '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
-- allows you to just press ;; to add semicolon for end of the line
-- or double press ,, for , at tend of the line
-- disabled it because it took to long to jump out of the mode when normally pressing ; or ,
--vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
--vim.keymap.set('i', ',,', '<Esc>A,<Esc>')

-- todo, change it so that if you press on enter when on the word you were looking for, undo the highlighting
vim.keymap.set("n", "<Leader>k", ":nohlsearch<CR>")

-- Open the current file in the default program (on Mac this should just be just `open`).
-- TODO this does not work
-- vim.keymap.set('n', '<Leader>x', ':!xdg-open %<cr><cr>')

-- Move text up and down
-- Todo figure out how to set A to options for mac because this stuff below does not work
-- https://laracasts.com/series/neovim-as-a-php-ide/episodes/10
--vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
--vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
--vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
--vim.keymap.set('n', '<A-k>', ':move .-2<CR>==')
--vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
--vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")
--
vim.keymap.set("n", "<leader>H", "<cmd>NeotreeToggleHidden<CR>", {
	desc = "Neo-tree: toggle hidden files",
})
-- vim.keymap.set("n", "<leader>1", "<cmd>Neotree reveal=true position=left<CR>", {
-- 	desc = "Neo-tree: toggle left",
-- })
vim.keymap.set("n", "<leader>1", "<cmd>Neotree action=focus reveal=true toggle=true position=left<CR>", {
	desc = "Neo-tree: toggle left",
})
vim.keymap.set("n", "<leader>n", "<cmd>Neotree reveal=true position=float<CR>", {
	desc = "Neo-tree: toggle float",
})
vim.keymap.set("n", "<Leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "gt", ":Telescope lsp_definitions<CR>")
vim.keymap.set("n", "gD", vim.lsp.buf.definition, { desc = "LSP: go to definition" })
vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>")
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "<Leader>lR", ":LspRestart<CR>", { silent = true })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<leader>l", function()
	require("lint").try_lint()
end, { desc = "Run linting" })
vim.keymap.set("n", "<leader>oTSi", ":OrganizeTSImports<CR>")
vim.keymap.set("n", "<leader>oi", function()
	vim.lsp.buf.code_action({
		context = { only = { "source.organizeImports" } },
		apply = true,
	})
end, { desc = "LSP Organize Imports" })

-- Laravel.nvim keymaps
-- Add these to your keymaps.lua file

vim.keymap.set("n", "<leader>ll", function()
	Laravel.pickers.laravel()
end, { desc = "Laravel: Open Laravel Picker" })
vim.keymap.set("n", "<c-g>", function()
	Laravel.commands.run("view:finder")
end, { desc = "Laravel: Open View Finder" })
vim.keymap.set("n", "<leader>la", function()
	Laravel.pickers.artisan()
end, { desc = "Laravel: Open Artisan Picker" })
vim.keymap.set("n", "<leader>lt", function()
	Laravel.commands.run("actions")
end, { desc = "Laravel: Open Actions Picker" })
vim.keymap.set("n", "<leader>lr", function()
	Laravel.pickers.routes()
end, { desc = "Laravel: Open Routes Picker" })
vim.keymap.set("n", "<leader>lh", function()
	Laravel.run("artisan docs")
end, { desc = "Laravel: Open Documentation" })
vim.keymap.set("n", "<leader>lm", function()
	Laravel.pickers.make()
end, { desc = "Laravel: Open Make Picker" })
vim.keymap.set("n", "<leader>lc", function()
	Laravel.pickers.commands()
end, { desc = "Laravel: Open Commands Picker" })
vim.keymap.set("n", "<leader>lo", function()
	Laravel.pickers.resources()
end, { desc = "Laravel: Open Resources Picker" })
vim.keymap.set("n", "<leader>lp", function()
	Laravel.commands.run("command_center")
end, { desc = "Laravel: Open Command Center" })
vim.keymap.set("n", "<leader>lu", function()
	Laravel.commands.run("hub")
end, { desc = "Laravel Artisan hub" })

-- gf - Go to file with Laravel awareness
vim.keymap.set("n", "gf", function()
	local ok, res = pcall(function()
		if Laravel.app("gf").cursorOnResource() then
			return "<cmd>lua Laravel.commands.run('gf')<cr>"
		end
	end)
	if not ok or not res then
		return "gf"
	end
	return res
end, { expr = true, noremap = true })
