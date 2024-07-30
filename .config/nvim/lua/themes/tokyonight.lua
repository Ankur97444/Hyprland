return {
  -- colorscheme --
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
  },
  config = function()
    vim.cmd([[colorscheme tokyonight]])

    require("tokyonight").setup({})

    -- Customization for wildmenu
    vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#1a1b26", fg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#2ac3de", bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#2ac3de", bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpPmenu", { fg = "NONE", bg = "#1a1b26"})
    vim.api.nvim_set_hl(0, "CmpSel", { link = "PmenuSel", bold = true })
  end,
}
