return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup()
    vim.cmd("colorscheme catppuccin-mocha")

    -- Customization for Pmenu
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#343a55", fg = "NONE" })
    vim.api.nvim_set_hl(0, "Pmenu", { fg = "#c8d3f5", bg = "#1a1b26" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#545c7e", bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#8ec07c", bg = "NONE", italic = true })

    -- set the colorscheme
  end,
}
