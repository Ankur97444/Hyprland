return {
	"folke/trouble.nvim",
	ft = { "python", "javascript" },
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xw",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>xd",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>gR",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xl",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
	config = function()
		require("trouble").setup({
			icons = {
				indent = {
          last       = "╰╴", -- rounded
					fold_open = " ",
					fold_closed = " ",
          ws = "│  ",
				},
			},
		})
		-- Lua
		-- vim.keymap.set("n", "<leader>xx", function()
		-- 	require("trouble").toggle("diagnostics")
		-- end)
		-- vim.keymap.set("n", "<leader>xw", function()
		-- 	require("trouble").toggle("diagnostics")
		-- end)
		-- vim.keymap.set("n", "<leader>xd", function()
		-- 	require("trouble").toggle("document_diagnostics")
		-- end)
		-- vim.keymap.set("n", "<leader>xq", function()
		-- 	require("trouble").toggle("quickfix")
		-- end)
		-- vim.keymap.set("n", "<leader>xl", function()
		-- 	require("trouble").toggle("loclist")
		-- end)
		-- vim.keymap.set("n", "gR", function()
		-- 	require("trouble").toggle("lsp_references")
		-- end)
	end,
}
