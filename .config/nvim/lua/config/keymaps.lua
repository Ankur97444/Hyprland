-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
--- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', default_opts)

-- map Esc to kk
map('i', 'jk', '<Esc>', default_opts)

-- don't use arrow keys
map('', '<up>', '<nop>', default_opts)
map('', '<down>', '<nop>', default_opts)
map('', '<left>', '<nop>', default_opts)
map('', '<right>', '<nop>', default_opts)

-- move code-block up or down
map("v", "j", ":m '>+1<CR>gv=gv", default_opts)
map("v", "k", ":m '<-2<CR>gv=gv", default_opts)

-- fast saving with CONTROL and s
map('n', '<leader>ww', ':w<CR>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- adjust split size
map('n', "<C-Left>", ':vertical resize +3', default_opts)
map('n', "<C-Right>", ':vertical resize -3', default_opts)
map('n', "<C-Up>", ':resize +3', default_opts)
map('n', "<C-Down>", ':resize -3', default_opts)

-- Toggle Layout ( Horizontal <==> vertical)
map('n', "<leader>tv", "<C-w>t<C-w>H", default_opts)
map('n', "<leader>th", "<C-w>t<C-w>K", default_opts)

-- close all windows and exit from neovim
map('n', '<leader>q', ':qa<CR>', default_opts)

-- jump out of parenthesis
map('i', '<leader>j', '<C-o>A', default_opts)

-- move left and right in insert mode
-- map('i', '<m-h>', '<left>', default_opts)
-- map('i', '<m-l>', '<right>', default_opts)

-----------------------------------------------------------
-- Plugins shortcuts:
-----------------------------------------------------------
-- Neo tree
map('n', '<C-n>', ':Neotree reveal toggle<CR>', default_opts)




