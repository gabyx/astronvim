return {
  -- Use the awesome refactoring library.
  {
    "ThePrimeagen/refactoring.nvim",
    name = "refactoring",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function(_, opts) -- remap to open the Telescope refactoring menu in visual mode
      require("refactoring").setup(opts)
      vim.api.nvim_set_keymap(
        "v",
        "<leader>rr",
        "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
        { noremap = true }
      )
    end,
  }, --
  -- Use the python refactoring library
  { "python-rope/ropevim", run = "pip install ropevim", disable = false },
}
