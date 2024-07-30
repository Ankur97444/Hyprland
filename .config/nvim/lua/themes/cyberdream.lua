return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      -- Recommended - see "Configuring" below for more config options
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = true,
      terminal_colors = true,
    })
    vim.cmd("colorscheme cyberdream") -- set the colorscheme

    vim.api.nvim_set_hl(0, "MiniIndentScopeSymbol", { bg = "NONE", fg = "#f1ff5e" })


		vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#1e2124", fg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#1e2124", bg = "#1e2124" })
    vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#ffffff", bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpPmenu", { fg = "NONE", bg = ""})
    vim.api.nvim_set_hl(0, "CmpSel", { link = "PmenuSel", bold = true })

  end,
}
