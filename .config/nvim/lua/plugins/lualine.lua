return {
  -- statusline --
  'nvim-lualine/lualine.nvim',
  event = "UIEnter",
  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = false,
        globalstatus = true,
        sections = {
          lualine_a = {
            {
              'windows',
              show_filename_only = true, -- Shows shortened relative path when set to false.
              show_modified_status = true, -- Shows indicator when the window is modified.

              mode = 0,     -- 0: Shows window name
              -- 1: Shows window index
              -- 2: Shows window name + window index

              max_length = vim.o.columns * 2 / 3, -- Maximum width of windows component,
              -- it can also be a function that returns
              -- the value of `max_length` dynamically.
              filetype_names = {
                TelescopePrompt = 'Telescope',
                dashboard = 'Dashboard',
                packer = 'Packer',
                fzf = 'FZF',
                alpha = 'Alpha'
              },

              disabled_buftypes = { 'quickfix', 'prompt' }, -- Hide a window if its buffer's type is disabled

              -- Automatically updates active window color to match color of other components (will be overridden if buffers_color is set)
              use_mode_colors = false,

              windows_color = {
                -- Same values as the general color option can be used here.
                active = 'lualine_{section}_normal', -- Color for active window.
                inactive = 'lualine_{section}_inactive', -- Color for inactive window.
              },
            }
          },
          lualine_c = { 'swenv', icon = '<icon>' }
        }
      },
    }
  end
}
