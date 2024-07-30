return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000,
	config = function()
		require("everforest").setup({
			background = "hard",
		})
		vim.cmd([[colorscheme everforest]])

		-- Customization for wildmenu
    --vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#e67e80", fg = "None" })
		vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#272e33", fg = "NONE" })
		vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#7fbbb3", bg = "NONE" })
		vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#7fbbb3", bg = "NONE" })
		vim.api.nvim_set_hl(0, "CmpPmenu", { fg = "NONE", bg = "#272e33" })
		vim.api.nvim_set_hl(0, "CmpSel", { link = "PmenuSel", bold = true })
	end,
}
