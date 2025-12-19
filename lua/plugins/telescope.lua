return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
     keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end },
      { "<leader>fb", function() require("telescope.builtin").buffers() end },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end },
      { "<C-p>", function() require("telescope.builtin").git_files() end },
    },
    -- cmd = 'Telescope', -- carga solo al usar :Telescope
    config = function()
      require('telescope').setup({
        defaults = {
          layout_config = {
            horizontal = {
              preview_cutoff = 0,
            },
          },
          border = true,
        },
      })
    end,
  }
}

