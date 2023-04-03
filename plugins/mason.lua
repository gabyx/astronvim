return {
  -- Install the neoconf setup.
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    },
  },
  -- Use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "pyright",
        "rust_analyzer",
        "golangci_lint_ls",
        "clangd",
        "gopls",
        "bashls",
        "dockerls",
      },
    },
  },
  -- Use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "prettier",
        "prettierd",
        "stylua",
        "rustfmt",
        "gofmt",
        "shfmt",
        "codespell",
        "markdownlint",
        "clang_format",
      },
      automatic_installation = false,
      automatic_setup = true, -- Recommended, but optional
    },
  }, --
  -- Use mason-nvim-dap to configure debug adapters.
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = { "python", "delve", "codelldb" },
      automatic_setup = true,
    },
  },
}
