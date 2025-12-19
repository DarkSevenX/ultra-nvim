return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    config = function() 
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 
          'python',
          'javascript',
          'html',
          'query',
          'markdown',
          'markdown_inline',
          'typescript',
          'css',
          'http',
          'json'
        },

        auto_install = true,
        sync_install = false,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      })
    end
  }
}
