return {
  -- Mason + LSP Config
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "angularls", "tailwindcss", "eslint" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      -- 1. Definimos las capacidades para nvim-cmp (necesario para el autocompletado)
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- 2. Configuramos los servidores usando la nueva API nativa
      -- En lugar de lspconfig.server.setup({}), usamos vim.lsp.config
      
      vim.lsp.config('angularls', {
        capabilities = capabilities,
        -- Añade aquí cualquier configuración específica de angularls si la necesitas
      })

      vim.lsp.config('tailwindcss', { capabilities = capabilities })
      vim.lsp.config('eslint', { capabilities = capabilities })

      -- 3. Habilitamos los servidores
      vim.lsp.enable('angularls')
      vim.lsp.enable('tailwindcss')
      vim.lsp.enable('eslint')
    end,
  },

  -- Autocompletado (Se mantiene igual, funciona perfectamente)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },

  -- Navegación Angular
  {
    "joeveiga/ng.nvim",
    keys = {
      { "<leader>gt", "<cmd>NgGotoTemplate<cr>", desc = "Goto Template" },
      { "<leader>gc", "<cmd>NgGotoComponent<cr>", desc = "Goto Component" },
      { "<leader>gs", "<cmd>NgGotoStyle<cr>", desc = "Goto Style" },
    },
  },
}
