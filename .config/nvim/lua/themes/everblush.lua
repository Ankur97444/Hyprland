return{
  'Everblush/nvim',
  name = 'everblush',
  lazy = false,
  config = function()
    vim.cmd('colorscheme everblush')
    require("everblush").setup()
  end
}
