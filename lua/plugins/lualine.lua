return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function() 
      local lualine = require('lualine')
      local status, theme = pcall(require, 'lualine.themes.auto')
      if not status then 
        print('Error al cargar el tema de lualine')
        return 
      end

      lualine.setup({
        options = {
          theme = 'tokyodark',
          disabled_filetypes = { 'NvimTree', 'toggleterm' }
        },
         sections = {
            lualine_a = {
            { 'mode', separator = { left = '' }},
          },
          lualine_b = { 'filename', 'branch', 'diagnostics' },
          lualine_c = {}, -- it shows SO Icon
          lualine_x = { },
          --lualine_y = { set_env , 'filetype'  }, para mostrar el env de python
          lualine_y = { 'filetype'  },
          lualine_z = { 
            {'location', separator = { right = '' } }
          },
        },      
      })
    end
  }
}
