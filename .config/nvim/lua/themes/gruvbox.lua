return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("gruvbox").setup()
		vim.cmd([[colorscheme gruvbox]])

		-- Customization for wildmenu
		vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#282828", fg = "NONE" })
		vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#83a598", bg = "NONE" })
		vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#83a598", bg = "NONE" })
		vim.api.nvim_set_hl(0, "CmpPmenu", { fg = "NONE", bg = "#282828" })
		vim.api.nvim_set_hl(0, "CmpSel", { link = "PmenuSel", bold = true })
	end,
}
