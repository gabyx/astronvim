-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat = true, -- enable or disable auto formatting on start
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },

    -- Customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },

    -- Enable servers that you already have installed without mason
    servers = {
      "rust_analyzer",
      "clangd",
      "golangci_lint_ls",
      "gopls",
      "pyright",
      "bashls",
      "dockerls",
      "texlab",
      "jsonls",
      "yamlls",
      "nil_ls",
      "marksman",
      "lua_ls",
      "tilt_ls",
      "r_language_server",
      "buck2",
      "typos_lsp",
    },

    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      -- Go
      gopls = {
        settings = {
          gopls = {
            analyses = {
              ST1003 = true,
              fieldalignment = false,
              fillreturns = true,
              nilness = true,
              nonewvars = true,
              shadow = true,
              undeclaredname = true,
              unreachable = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            codelenses = {
              gc_details = true, -- Show a code lens toggling the display of gc's choices.
              generate = true, -- show the `go generate` lens.
              regenerate_cgo = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            buildFlags = { "-tags", "integration" },
            completeUnimported = true,
            diagnosticsDelay = "500ms",
            matcher = "Fuzzy",
            semanticTokens = true,
            staticcheck = true,
            symbolMatcher = "fuzzy",
            usePlaceholders = true,
          },
        },
      },

      -- C++
      clangd = {
        cmd = { "clangd", "--log=verbose" },
        capabilities = { offsetEncoding = "utf-8" },
      },

      -- Lua
      lua_ls = {
        settings = {
          Lua = { hint = { enable = true, arrayIndex = "Disable" } },
        },
      },

      -- Rust
      rust_analyzer = {
        settings = {
          rust = {
            inlayHints = {
              bindingModeHints = {
                enable = false,
              },
              chainingHints = {
                enable = true,
              },
              closingBraceHints = {
                enable = true,
                minLines = 25,
              },
              closureReturnTypeHints = {
                enable = true,
              },
              lifetimeElisionHints = {
                enable = true,
                useParameterNames = false,
              },
              maxLength = 25,
              parameterHints = {
                enable = true,
              },
              reborrowHints = {
                enable = true,
              },
              renderColons = true,
              typeHints = {
                enable = true,
                hideClosureInitialization = false,
                hideNamedConstructor = false,
              },
            },
          },
        },
      },

      -- Latex
      texlab = {
        settings = {
          texlab = {
            build = { onSave = true },
            forwardSearch = {
              executable = "zathura",
              args = { "--synctex-forward", "%l:1:%f", "%p" },
            },
          },
        },
      },
    },

    -- Customize how language servers are attached
    handlers = {
      -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
      function(server, opts)
        require("lspconfig")[server].setup(opts)
      end,

      -- the key is the server that is being setup with `lspconfig`
      -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
      --
      -- Python
      pyright = function(server, opts)
        local lspconfig = require("lspconfig")
        local util = require("lspconfig.util")

        -- Exclude some files for the root marker.
        -- No `requirements.txt`
        local root_files = {
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "pyrightconfig.json",
        }

        opts.root_dir = util.root_pattern(unpack(root_files))

        lspconfig[server].setup(opts)
      end,

      -- Rust
      rust_analyzer = function(_, opts)
        require("rust-tools").setup({ server = opts })
      end,

      -- Tiltfile
      tilt_ls = function(server, opts)
        local lspconfig = require("lspconfig")
        opts.filetypes = { "tiltfile" }

        opts.on_attach = function(client, bufnr)
          if client.name == "tilt_ls" then
            vim.api.nvim_buf_set_option(bufnr, "filetype", "starlark")
          end
        end

        lspconfig[server].setup(opts)
      end,
    },

    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      -- first key is the `augroup` to add the auto commands to (:h augroup)
      lsp_document_highlight = {
        -- Optional condition to create/delete auto command group
        -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
        -- condition will be resolved for each client on each execution and if it ever fails for all clients,
        -- the auto commands will be deleted for that buffer
        cond = "textDocument/documentHighlight",
        -- cond = function(client, bufnr) return client.name == "lua_ls" end,
        -- list of auto commands to set
        {
          -- events to trigger
          event = { "CursorHold", "CursorHoldI" },
          -- the rest of the autocmd options (:h nvim_create_autocmd)
          desc = "Document Highlighting",
          callback = function()
            vim.lsp.buf.document_highlight()
          end,
        },
        {
          event = { "CursorMoved", "CursorMovedI", "BufLeave" },
          desc = "Document Highlighting Clear",
          callback = function()
            vim.lsp.buf.clear_references()
          end,
        },
      },
    },

    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        gl = {
          function()
            vim.diagnostic.open_float()
          end,
          desc = "Hover diagnostics",
        },
        -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
        -- gD = {
        --   function() vim.lsp.buf.declaration() end,
        --   desc = "Declaration of current symbol",
        --   cond = "textDocument/declaration",
        -- },
        -- ["<Leader>uY"] = {
        --   function() require("astrolsp.toggles").buffer_semantic_tokens() end,
        --   desc = "Toggle LSP semantic highlight (buffer)",
        --   cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
        -- },
      },
    },

    -- A cstom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}
