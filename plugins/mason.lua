return {
  -- Install the neoconf setup.
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    },
  },
  -- Use mason-lspconfig to configure LSP installations
  -- Do only use Mason for Lsp which can be installed independent of the system.
  -- NixOS its better to install the packages.
  -- Some LSPs need nix-ld etc to make the binaries work.
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {},
    },
  },
  -- check
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      -- first load null-ls
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup {
        ensure_installed = { "codespell" },
        automatic_installation = true,
      }
    end,
  },
  -- Use mason-nvim-dap to configure debug adapters.
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {},
      automatic_setup = true,
    },
  },
  -- Debugger setup project wise.
  { "ldelossa/nvim-dap-projects" },
}
