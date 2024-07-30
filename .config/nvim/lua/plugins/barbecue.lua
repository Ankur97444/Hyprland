return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	event = "BufReadPost",
	dependencies = {
		"SmiteshP/nvim-navic",
		--"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	opts = {
		dim_dirname = true, -- directory name is dimmed by default
		bold_basename = true,
		dim_context = false,
		alt_background = true,
	},
	config = function()
		require("barbecue").setup({
			create_autocmd = false,
		})

		vim.api.nvim_create_autocmd({
			"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",

			-- include this if you have set `show_modified` to `true`
			"BufModifiedSet",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end,
}
