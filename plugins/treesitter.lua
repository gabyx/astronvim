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
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
    },
  },
  { "nvim-treesitter/nvim-treesitter-context", lazy = false },
}
