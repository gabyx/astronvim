--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below
-- A split up user configuration example can be found at: https://github.com/AstroNvim/split_user_example
-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main",       -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },
  -- Set colorscheme to use
  colorscheme = "monokai",
  -- Add highlight groups in any theme
  highlights = {
    init = { -- this table overrides highlights in all themes
      Visual = { bg = "#AAAAAA" },
    },
    duskfox = { -- a table of overrides/changes to the duskfox theme
      Visual = { bg = "#AAAAAA" },
    },
  },
  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true,         -- sets vim.opt.number
      spell = false,         -- sets vim.opt.spell
      signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
      wrap = false,          -- sets vim.opt.wrap
    },
    g = {
      mapleader = " ",                 -- sets vim.g.mapleader
      autoformat_enabled = true,       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true,              -- enable completion at start
      autopairs_enabled = true,        -- enable autopairs at start
      diagnostics_mode = 3,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
      icons_enabled = true,            -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = { underline = true },
  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {},
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          "go",
          "python",
          "rust",
          "markdown",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the LSP setup handler function based on server name
    -- setup_handlers = {
    --   -- first function changes the default setup handler
    --   function(server, opts) require("lspconfig")[server].setup(opts) end,
    --   -- keys for a specific server name will be used for that LSP
    --   lua_ls = function(server, opts)
    --     -- custom lua_ls setup handler
    --     require("lspconfig")["lua_ls"].setup(opts)
    --   end,
    -- },

    -- Add overrides for LSP server settings, the keys are the name of the server
    config = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },
  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = {
        "<cmd>BufferLinePickClose<cr>",
        desc = "Pick to close",
      },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = {
        "<cmd>BufferLineSortByTabs<cr>",
        desc = "Sort by tabs",
      },
      -- tables with the `name` key will be registered with which-key if it's installed
      -- this is useful for naming menus
      ["<leader>b"] = { name = "Buffers" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
          "matchparen",
        },
      },
    },
  },
  -- Configure plugins
  plugins = {
    {
      "tanvirtin/monokai.nvim",
      as = "monokai",
      config = function()
        local monokai = require "monokai"
        monokai.setup {}
      end,
    },
    {
      "simrat39/rust-tools.nvim",
      name = "rust-tools",
      config = function(_, opts)
        local rt = require "rust-tools"
        opts["server"] = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        }
        rt.setup(opts)
      end,
    }, --
    {
      "neo-tree.nvim",
      opts = {
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            never_show = {
              ".DS_Store",
              ".git"
            }
          },
        },
      },
    },
    --
    -- You can disable default plugins as follows:
    -- { "max397574/better-escape.nvim", enabled = false },
    --
    -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
    -- {
    --   "L3MON4D3/LuaSnip",
    --   config = function(plugin, opts)
    --     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
    --     -- add more custom luasnip configuration such as filetype extend or custom snippets
    --     local luasnip = require "luasnip"
    --     luasnip.filetype_extend("javascript", { "javascriptreact" })
    --   end,
    -- },
    -- {
    --   "windwp/nvim-autopairs",
    --   config = function(plugin, opts)
    --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
    --     -- add more custom autopairs configuration such as custom rules
    --     local npairs = require "nvim-autopairs"
    --     local Rule = require "nvim-autopairs.rule"
    --     local cond = require "nvim-autopairs.conds"
    --     npairs.add_rules(
    --       {
    --         Rule("$", "$", { "tex", "latex" })
    --           -- don't add a pair if the next character is %
    --           :with_pair(cond.not_after_regex "%%")
    --           -- don't add a pair if  the previous character is xxx
    --           :with_pair(
    --             cond.not_before_regex("xxx", 3)
    --           )
    --           -- don't move right when repeat character
    --           :with_move(cond.none())
    --           -- don't delete if the next character is xx
    --           :with_del(cond.not_after_regex "xx")
    --           -- disable adding a newline when you press <cr>
    --           :with_cr(cond.none()),
    --       },
    --       -- disable for .vim files, but it work for another filetypes
    --       Rule("a", "a", "-vim")
    --     )
    --   end,
    -- }, --
    -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
    -- {
    --   "folke/which-key.nvim",
    --   config = function(plugin, opts)
    --     require "plugins.configs.which-key"(plugin, opts)
    --     -- Add bindings which show up as group name
    --     local wk = require "which-key"
    --     wk.register({
    --       b = { name = "Buffer" },
    --     }, { mode = "n", prefix = "<leader>" })
    --   end,
    -- }, --
    -- You can also add new plugins here as well:
    -- Add plugins, the lazy syntax
    -- "andweeb/presence.nvim",
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- }, --
    -- Plugin entries can also be used to override the default options for plugins as well
    {
      "goolord/alpha-nvim",
      opts = function(_, opts)
        -- customize the dashboard header
        opts.section.header.val = {
          "     ██████╗  █████╗ ██████╗ ██╗   ██╗██╗  ██╗                   ",
          "    ██╔════╝ ██╔══██╗██╔══██╗╚██╗ ██╔╝╚██╗██╔╝                   ",
          "    ██║  ███╗███████║██████╔╝ ╚████╔╝  ╚███╔╝                    ",
          "    ██║   ██║██╔══██║██╔══██╗  ╚██╔╝   ██╔██╗                    ",
          "    ╚██████╔╝██║  ██║██████╔╝   ██║   ██╔╝ ██╗                   ",
          "     ╚═════╝ ╚═╝  ╚═╝╚═════╝    ╚═╝   ╚═╝  ╚═╝                   ",
          "                                                                 ",
          " █████╗ ███████╗████████╗██████╗  ██████╗ ██╗   ██╗██╗███╗   ███╗",
          "██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║██║████╗ ████║",
          "███████║███████╗   ██║   ██████╔╝██║   ██║██║   ██║██║██╔████╔██║",
          "██╔══██║╚════██║   ██║   ██╔══██╗██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "██║  ██║███████║   ██║   ██║  ██║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        }
        return opts
      end,
    }, --
    -- Install the neoconf setup.
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      },
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, config)
        -- config variable is the default configuration table for the setup function call
        local null_ls = require "null-ls"

        -- Check supported formatters and linters
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        config.sources = {
          -- Set a formatter
          null_ls.builtins.formatting.trim_whitespace,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.rustfmt,
          null_ls.builtins.formatting.terraform_fmt,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.markdownlint,
          null_ls.builtins.formatting.markdown_toc,
          null_ls.builtins.formatting.codespell,
          null_ls.builtins.formatting.stylua,
        }
        return config -- return final config table
      end,
    },                --
    -- Treesitter setup.
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "lua",
          "rust",
          "toml",
          "python",
          "go",
          "cpp",
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
    }, --
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
        },
      },
    }, --
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
    },                          --
    -- Use mason-nvim-dap to configure debug adapters.
    {
      "jay-babu/mason-nvim-dap.nvim",
      -- overrides `require("mason-nvim-dap").setup(...)`
      opts = {
        ensure_installed = { "python", "delve", "codelldb" },
        automatic_setup = true,
      },
    }, --
    -- Customize source priority
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-emoji", -- add cmp source as dependency of cmp
      },
      -- override the options table that is used in the `require("cmp").setup()` call
      opts = function(_, opts)
        -- opts parameter is the default options table
        -- the function is lazy loaded so cmp is able to be required
        local cmp = require "cmp"
        -- modify the sources part of the options table
        opts.sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750 },
          { name = "buffer",   priority = 500 },
          { name = "path",     priority = 250 },
          { name = "emoji",    priority = 700 }, -- add new source
        }
        return opts
      end,
    }, --
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
    -- Customize status bar
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local status = require "astronvim.utils.status"
        opts.statusline = {
          -- statusline
          hl = { fg = "fg", bg = "bg" },
          status.component.mode {
            mode_text = { padding = { left = 1, right = 1 } },
          }, -- add the mode text
          status.component.git_branch(),
          status.component.file_info {
            filetype = {},
            filename = false,
            file_modified = false,
          },
          status.component.git_diff(),
          status.component.diagnostics(),
          status.component.fill(),
          status.component.cmd_info(),
          status.component.fill(),
          status.component.lsp(),
          status.component.treesitter(),
          status.component.nav(),
          -- remove the 2nd mode indicator on the right
        }

        -- return the final configuration table
        return opts
      end,
    }, --
    -- Adjust Icons to VS Code
    {
      "onsails/lspkind.nvim",
      opts = function(_, opts)
        -- use codicons preset
        opts.preset = "codicons"
        -- set some missing symbol types
        opts.symbol_map = {
          Array = "",
          Boolean = "",
          Key = "",
          Namespace = "",
          Null = "",
          Number = "",
          Object = "",
          Package = "",
          String = "",
        }
        return opts
      end,
    },
  },
  icons = {
    ActiveLSP = "",
    ActiveTS = " ",
    BufferClose = "",
    DapBreakpoint = "",
    DapBreakpointCondition = "",
    DapBreakpointRejected = "",
    DapLogPoint = "",
    DapStopped = "",
    DefaultFile = "",
    Diagnostic = "",
    DiagnosticError = "",
    DiagnosticHint = "",
    DiagnosticInfo = "",
    DiagnosticWarn = "",
    Ellipsis = "",
    FileModified = "",
    FileReadOnly = "",
    FoldClosed = "",
    FoldOpened = "",
    FolderClosed = "",
    FolderEmpty = "",
    FolderOpen = "",
    Git = "",
    GitAdd = "",
    GitBranch = "",
    GitChange = "",
    GitConflict = "",
    GitDelete = "",
    GitIgnored = "",
    GitRenamed = "",
    GitStaged = "",
    GitUnstaged = "",
    GitUntracked = "",
    LSPLoaded = "",
    LSPLoading1 = "",
    LSPLoading2 = "",
    LSPLoading3 = "",
    MacroRecording = "",
    Paste = "",
    Search = "",
    Selected = "",
    TabClose = "",
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    local vim = vim
    local opt = vim.opt

    -- Treesitter folding
    opt.foldmethod = "expr"
    opt.foldexpr = "nvim_treesitter#foldexpr()"

    -- vim.diagnostic.config({virtual_text = false})
    -- vim.diagnostic.config({signs = false})

    -- load refactoring Telescope extension
    require("telescope").load_extension "refactoring"

    -- require("mason-nvim-dap").setup_handlers {}
  end,
}

return config
