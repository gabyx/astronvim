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
}
