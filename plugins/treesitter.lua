return {
  -- Treesitter setup.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "rust",
        "toml",
        "python",
        "c",
        "html",
        "css",
        "javascript",
        "json",
        "go",
        "cmake",
        "cpp",
        "dockerfile",
        "bash",
        "markdown",
        "markdown_inline",
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      ident = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          scope_incremental = "<CR>",
          node_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
        },
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
    },
  },
  { "mfussenegger/nvim-treehopper", dependencies = { "smoka7/hop.nvim" } },
  { "nvim-treesitter/nvim-treesitter-context", lazy = false },
}
