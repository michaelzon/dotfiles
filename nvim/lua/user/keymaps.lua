-- SPACE is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
--vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
--vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true } 

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
-- 'm' is for mark
--vim.keymap.set('v', 'y', 'myy`y')
--vim.keymap.set('v', 'Y', 'myY`y')

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
-- allows you to just press ;; to add semicolon for end of the line
-- or double press ,, for , at tend of the line
-- disabled it because it took to long to jump out of the mode when normally pressing ; or , 
--vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
--vim.keymap.set('i', ',,', '<Esc>A,<Esc>')

-- todo, change it so that if you press on enter when on the word you were looking for, undo the highlighting
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

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
