return {
  {
    'mistweaverco/kulala.nvim',
    keys = {
      { "<leader>rr", sesc = "Send request" },
      { "<leader>ra", desc = "Send all requests" },
      { "<leader>rb", desc = "Open scratchpad" },
    },
    ft = {"http", "rest"},
    opts = {
      global_keymaps = false,
      global_keymaps_prefix = "<leader>R",
      kulala_keymaps_prefix = "",
    },
  },
}
