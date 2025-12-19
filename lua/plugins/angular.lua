return {
  {
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
        ensure_installed = { "angularls", "tailwindcss", "eslint" },  -- todo automático
      },
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = { "williamboman/mason-lspconfig.nvim" },
      config = function()
        local lspconfig = require("lspconfig")

        lspconfig.angularls.setup({
          -- ¡Con esto solo ya funciona al 100% en el 95% de proyectos!
        })

        -- Opcional pero recomendado: tailwind y eslint
        lspconfig.tailwindcss.setup({})
        lspconfig.eslint.setup({})
      end,
    },

    -- Autocompletado brutal
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

    -- Navegación rápida entre template/component/style (esto es oro puro)
    {
      "joeveiga/ng.nvim",
      keys = {
        { "<leader>gt", "<cmd>NgGotoTemplate<cr>", desc = "Goto Template" },
        { "<leader>gc", "<cmd>NgGotoComponent<cr>", desc = "Goto Component" },
        { "<leader>gs", "<cmd>NgGotoStyle<cr>", desc = "Goto Style" },
      },
    },
  }
}
