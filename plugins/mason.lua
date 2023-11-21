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
        "texlab",
        "jsonls",
        "yamlls",
        "rnix",
        "lua_ls",
      },
    },
  },
  -- Use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "codespell",
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
  -- CPP clangd extension.
  {
    "p00f/clangd_extensions.nvim",
    pin = true,
    init = function()
      -- load clangd extensions when clangd attaches
      local augroup = vim.api.nvim_create_augroup("clangd_extensions", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        desc = "Load 'clangd_extensions' with 'clangd'",
        callback = function(args)
          if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
            require "clangd_extensions"
            -- add more `clangd` setup here as needed such as loading autocmds
            vim.api.nvim_del_augroup_by_id(augroup) -- delete auto command since it only needs to happen once
          end
        end,
      })
    end,
  }, -- install lsp plugin
}
