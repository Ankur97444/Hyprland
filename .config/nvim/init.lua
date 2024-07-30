
-- Modules
require("config.lazy")
require("config.settings")
require("config.keymaps")
require("config.terminal")

-- Opem markdown in browser
vim.cmd ([[function OpenMarkdownPreview (url)
    execute "silent ! google-chrome-stable --new-window " . a:url
  endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])


-- Neovide Settings
if vim.g.neovide then
  vim.g.neovide_theme = "auto"
  --vim.g.neovide_transparency = 0.8
  vim.opt.termguicolors = true
  vim.g.neovide_confirm_quit = false
  vim.g.neovide_unlink_border_highlights = true
  vim.g.neovide_maximized = false
  vim.g.neovide_fullscreen = false
  vim.g.neovide_remember_window_size = false
  vim.g.neovide_cursor_vfx_mode = "railgun"

  -- padding
  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_right = 5
  vim.g.neovide_padding_left = 5

  -- font
  -- vim.opt.guifont = { "ComicShannsMono Nerd Font", ":18" }
  vim.opt.guifont = { "VictorMono Nerd Font", ":18" }


  vim.keymap.set({ "n", "x" }, "<C-S-C>", '"+y')        -- copy
  vim.keymap.set({ "n", "x" }, "<C-S-V>", '"+p')        -- paste
  vim.keymap.set({ "v", "x" }, "<C-S-V>", '"+p')        -- paste in visual mode
  vim.keymap.set({ "c", "x" }, "<C-S-V>", "<C-R>+")     -- paste in command mode
  vim.keymap.set({ "i", "x" }, "<C-S-V>", '<ESC>l"+Pli') -- paste in insert mode
end


