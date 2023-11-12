return {
  -- Monokai Theme.
  {
    "tanvirtin/monokai.nvim",
  },
  -- Automatically configures lua-language-server for your Neovim config,
  -- Neovim runtime and plugin directories
  { "folke/neodev.nvim", lazy = false, opts = {} },
  -- Auto session management.
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
      }
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
  },
  {
    "mbbill/undotree",
    lazy = false,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    pin = true,
    opts = {
      disable_when_zoomed = true,
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      },
    },
  },
  -- Markdown plugins.
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    lazy = false,
  },
  -- Cpp plugins
  { "Civitasv/cmake-tools.nvim" },
  { "p00f/clangd_extensions.nvim", pin = true }, -- install lsp plugin
  { "tamton-aquib/keys.nvim", lazy = false, opts = {
    enable_on_startup = true,
  } }, -- See keystrokes
  -- Move Plugint
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
}
