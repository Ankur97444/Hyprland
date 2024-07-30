return {
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	lazy = false,
	priority = 1000,
	config = function()
		-- require("moonfly").setup({})
		vim.g.moonflyCursorColor = true
		vim.g.moonflyItalics = false
		vim.cmd("colorscheme moonfly")
	end,
}
