

-- Open terminal to woking directory
vim.cmd("autocmd BufEnter * silent! lcd %:p:h")

-- Terminal
vim.cmd[[
command Vterm :vsplit | :terminal zsh
command Hterm :split | :terminal zsh
]]

-- toggle Vertical terminal by key press
vim.cmd("map <F6> :let $VIM_DIR=expand('%:p:h')<CR>:Vterm<CR>")

--toggle Horizontal terminal by key press
vim.cmd("map <F7> :let $VIM_DIR=expand('%:p:h')<CR>:Hterm<CR>")



-- Change 2 split windows from vert to horiz or horiz to vert
vim.cmd[[
map <Leader>tv <C-w>t<C-w>H,
map <Leader>th <C-w>t<C-w>K,
]]

