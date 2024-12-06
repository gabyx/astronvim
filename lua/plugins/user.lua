return {
  {
    "simrat39/rust-tools.nvim",
    name = "rust-tools",
    config = function(_, opts)
      local rt = require("rust-tools")
      opts["server"] = {
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set(
            "n",
            "<C-space>",
            rt.hover_actions.hover_actions,
            { buffer = bufnr }
          )
          -- Code action groups
          vim.keymap.set(
            "n",
            "<Leader>a",
            rt.code_action_group.code_action_group,
            { buffer = bufnr }
          )
        end,
      }
      rt.setup(opts)
    end,
  },
  {
    "mbbill/undotree",
    lazy = false,
  },
  -- Smart Splits to Switch between Neovim and Multiplexer.
  { "mrjones2014/smart-splits.nvim", version = ">=1.0.0", lazy = false },
  -- Markdown plugins.
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    lazy = false,
  },
  -- Cpp plugins
  { "Civitasv/cmake-tools.nvim" },
  { "p00f/clangd_extensions.nvim", pin = true },
  -- See keystrokes
  {
    "tamton-aquib/keys.nvim",
    lazy = false,
    opts = {
      enable_on_startup = false,
    },
  },
  -- Move Plugin
  {
    "booperlv/nvim-gomove",
    lazy = false,
    opts = {
      -- whether or not to map default key bindings, (true/false)
      map_defaults = false,
      -- whether or not to reindent lines moved vertically (true/false)
      reindent = true,
      -- whether or not to undojoin same direction moves (true/false)
      undojoin = true,
      -- whether to not to move past end column when moving blocks horizontally, (true/false)
      move_past_end_col = false,
    },
  },
  { "ThePrimeagen/harpoon", lazy = false },
  {
    "chentoast/marks.nvim",
    lazy = false,
    opts = {
      -- whether to map keybinds or not. default true
      default_mappings = true,
      -- which builtin marks to show. default {}
      builtin_marks = { "a", "b", "d", "f" },
      -- whether movements cycle back to the beginning/end of buffer. default true
      cyclic = true,
      -- whether the shada file is updated after modifying uppercase marks. default false
      force_write_shada = false,
      -- how often (in ms) to redraw signs/recompute mark positions.
      -- higher values will have better performance but may cause visual lag,
      -- while lower values may cause performance penalties. default 150.
      refresh_interval = 250,
      -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
      -- marks, and bookmarks.
      -- can be either a table with all/none of the keys, or a single number, in which case
      -- the priority applies to all marks.
      -- default 10.
      sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
      -- disables mark tracking for specific filetypes. default {}
      excluded_filetypes = {},
      -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
      -- sign/virttext. Bookmarks can be used to group together positions and quickly move
      -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
      -- default virt_text is "".
      bookmark_0 = {
        sign = "⚑",
        annotate = false,
      },
    },
  },
  {
    "smoka7/hop.nvim",
    version = "v2.5.0",
    opts = {},
    lazy = false,
  },
  -- Surround plugin to easily replace brackets and other shit.
  {
    "kylechui/nvim-surround",
    version = "2.1.5", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  -- Local Project Configuration
  {
    lazy = false,
    "klen/nvim-config-local",
    opts = {
      -- Config file patterns to load (lua supported)
      config_files = { ".nvim/nvim.lua" },

      -- Where the plugin keeps files data
      hashfile = vim.fn.stdpath("data") .. "/nvim-config-local",

      autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
      commands_create = true, -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalIgnore)
      silent = false, -- Disable plugin messages (Config loaded/ignored)
      lookup_parents = false, -- Lookup config files in parent directories
    },
  },
  -- Diff view plugin.
  { lazy = true, "sindrets/diffview.nvim", cmd = { "DiffviewOpen" } },
  -- Trouble shows all diagnostics in a common window
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { auto_preview = false, focus = true },
  },
  { "nvim-pack/nvim-spectre" },
}
