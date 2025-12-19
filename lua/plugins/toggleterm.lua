return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- puedes fijar una versión o usar la última
    event = "VeryLazy", -- o 'BufWinEnter', etc. dependiendo de cuándo quieras que se cargue
    keys = {
      { '<leader>ñ', ':ToggleTerm 1<CR>', { silent = true } },
      { '<leader>2', ':ToggleTerm 2<CR>', { silent = true} }
    },
    config = function()
      require("toggleterm").setup({
        hide_numbers = true,
        direction = "float",
        shading_factor = 2,
        float_opts = {
          border = "curved",
        },
      })

      -- función global para mapear teclas en terminal
      function _G.set_terminal_keymaps()
        local opts = { noremap = true }
        vim.api.nvim_buf_set_keymap(0, "t", "<ESC>", [[<C-\><C-n>]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
      end

      -- autocmd para aplicar esos keymaps al abrir un terminal
      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  }
}

