return {
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.opt.termguicolors = true

      require('nvim-tree').setup({
        view = {
          width = 28
        },
        filters = {
          dotfiles = false
        }
      })
    end,
  }
}
