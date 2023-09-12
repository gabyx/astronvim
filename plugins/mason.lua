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
        "nixd",
        -- "lua_ls",
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
        "gofmt",
        "shfmt",
        "codespell",
        "markdownlint",
        "clang_format",
      },
      automatic_installation = false,
      automatic_setup = true, -- Recommended, but optional
      config = function(plugin, opts)
        local mason_null_ls = require "mason-null-ls"
        local null_ls = require "null-ls"

        mason_null_ls.setup(opts) -- run setup
        mason_null_ls.setup_handlers { -- setup custom handlers
          prettier = function()
            null_ls.register(null_ls.builtins.formatting.prettier.with {
              condition = function(utils)
                return utils.root_has_file "package.json"
                  or utils.root_has_file ".prettierrc"
                  or utils.root_has_file ".prettierrc.json"
                  or utils.root_has_file ".prettierrc.js"
              end,
            })
          end,
          -- For prettierd:
          prettierd = function()
            null_ls.register(null_ls.builtins.formatting.prettierd.with {
              condition = function(utils)
                return utils.root_has_file "package.json"
                  or utils.root_has_file ".prettierrc"
                  or utils.root_has_file ".prettierrc.json"
                  or utils.root_has_file ".prettierrc.js"
              end,
            })
          end,
          -- For eslint_d:
          eslint_d = function()
            null_ls.register(null_ls.builtins.diagnostics.eslint_d.with {
              condition = function(utils)
                return utils.root_has_file "package.json"
                  or utils.root_has_file ".eslintrc.json"
                  or utils.root_has_file ".eslintrc.js"
              end,
            })
          end,
        }
      end,
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
