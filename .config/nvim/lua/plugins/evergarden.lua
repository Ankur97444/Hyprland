return {
  "comfysage/evergarden",
  priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
  lazy = false,
  opts = {
    transparent_background = true,
    contrast_dark = "hard", -- 'hard'|'medium'|'soft'
    override_terminal = true,
    style = {
      tabline = { reverse = false, color = "black" },
      search = { reverse = false, inc_reverse = true },
      types = { italic = true },
      keyword = { italic = true },
      comment = { italic = true },
      sign = { highlight = false },
    },
    overrides = {}, -- add custom overrides
  },
  config = function()
    vim.cmd([[ colorscheme evergarden ]])

    vim.api.nvim_set_hl(0, "CmpSel", { link = "PmenuSel", bold = true })
  end,
}
