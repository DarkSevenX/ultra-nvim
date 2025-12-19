-- coc.nvim
return {
  {
    'neoclide/coc.nvim',
    branch = 'release',
    lazy = false,
    config = function()
      local map = vim.keymap.set
      function _G.check_back_space()
          local col = vim.fn.col('.') - 1
          return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
      end

      function _G.show_docs()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
        else
          vim.apli.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
      end

      local opts = {
        silent = true, 
        noremap = true, 
        expr = true, 
        replace_keycodes = false
      }

      -->  <Tab> to accept selected completion item 
      map('i', '<Tab>', [[pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Tab>"]], opts)
      map('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })

      --> `[g` and `]g` to navigate diagnostics
      map("n", "[g", "<Plug>(coc-diagnostic-prev)", opts)
      map("n", "]g", "<Plug>(coc-diagnostic-next)", opts)
    end
  }
}
