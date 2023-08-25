return {
  {
    "tanvirtin/monokai.nvim",
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
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  -- Cpp plugins
  { "Civitasv/cmake-tools.nvim" },
  { "p00f/clangd_extensions.nvim", pin = true }, -- install lsp plugin
  -- Move Plugint
  {
    "booperlv/nvim-gomove",
    lazy = false,
    opts = {
      -- whether or not to map default key bindings, (true/false)
      map_defaults = true,
      -- whether or not to reindent lines moved vertically (true/false)
      reindent = true,
      -- whether or not to undojoin same direction moves (true/false)
      undojoin = true,
      -- whether to not to move past end column when moving blocks horizontally, (true/false)
      move_past_end_col = false,
    },
  },
}
