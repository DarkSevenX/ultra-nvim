return {
  { 'christoomey/vim-tmux-navigator' }, -- para navegar como en nvim
  { 'nvim-tree/nvim-web-devicons' },
  { 'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  {
    'numToStr/Comment.nvim',
      keys = { "gc", "gb" },
      config = function()
        require('Comment').setup()
      end
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'prisma/vim-prisma',
    ft = 'prisma'
  },
}
