return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "BufEnter",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
      autochdir = true,
			winbar = {
				enabled = true,
				name_formatter = function(term) --  term: Terminal
					return term.name
				end,
			},
      start_in_insert = true,
      insert_mapping = true,
      persist_size = true,
      persist_mode = true,
      direction = "float",
      float_opts = {
        border = "single",
        width = 70,
        height = 30,
        windblend = 3,
        title_pos = "left",
      },
		})

    --Keymap
    local map = vim.api.nvim_set_keymap
    local default_opts = {noremap = true, silent = true}

    map('n', '<C-t>', ':ToggleTerm<CR>', default_opts)
    map('i', '<C-t>', ":ToggleTerm<CR>", default_opts)

    map('n', "<F6>", ":ToggleTerm direction=vertical<CR>", default_opts)
    map('n', "<F7>", ":ToggleTerm direction=horizontal<CR>", default_opts)

    map('n', "<leader>t-s", "TermSelect<CR>", default_opts)

	end,
}
