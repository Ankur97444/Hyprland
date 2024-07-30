return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nordic").load()
		vim.cmd([[colorscheme nordic]])

		-- changes
		vim.api.nvim_set_hl(0, "MiniIndentScopeSymbol", { bg = "NONE", fg = "#8fbcbb" })


		vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#1e222a", fg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#1e222a", bg = "#1e222a" })
    vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#434c5e", bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpPmenu", { fg = "NONE", bg = "#242933"})
    vim.api.nvim_set_hl(0, "CmpSel", { link = "PmenuSel", bold = true })
	end,
}
