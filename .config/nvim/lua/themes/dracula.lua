return {
  "Mofiqul/dracula.nvim",
  lazy = false,
  config = function()
    vim.cmd([[colorscheme dracula]])

    -- Customization for Pmenu
    vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#282a36", fg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#bd93f9", bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#bd93f9", bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpPmenu", { fg = "NONE", bg = "#282a36"})
    vim.api.nvim_set_hl(0, "CmpSel", { link = "PmenuSel", bold = true })
  end,
}
