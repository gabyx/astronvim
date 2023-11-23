-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local maps = {
  n = {
    -- No clipboard override when pressing c, x or Del.
    ["s"] = { '"_s', remap = false },
    ["S"] = { '"_S', remap = false },
    ["x"] = { '"_x', remap = false },
    ["X"] = { '"_x', remap = false },
    ["c"] = { '"_c', remap = false },
    ["C"] = { '"_c', remap = false },
    ["<Del>"] = { '"_x', remap = false },

    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus.
    --
    -- Modifiers:
    -- Alt: A-
    -- Shift: S-
    -- Control: C-
    -- Super: D-
    -- Meta: T-

    ["<leader>b"] = { name = "Buffers" },
    -- Search Git files.
    ["<leader>fg"] = { ":Telescope git_files<cr>", desc = "Find Git files" },
    -- Save all files.
    ["<leader>wa>"] = { ":wa!<cr>", desc = "Save all files" },

    -- Undo Tree toggle.
    ["<leader>bu"] = {
      function() vim.cmd.UndotreeToggle() end,
      desc = "Show Undo Tree",
    },

    -- Select and move inside AST.
    ["<leader>ba"] = { ":<C-U>lua require('tsht').nodes()<CR>", desc = "Select in AST." },
    ["<leader>bA"] = { ":<C-U>lua require('tsht').move()<CR>", desc = "Move in AST." },

    -- UI commands.
    ["<leader>uT"] = { ":TSContextToggle<cr>", desc = "Treesitter Context" },

    -- Search commands.
    ["<leader>s"] = { name = "Search" },
    ["<leader>ss"] = { ":Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy search in current buffer" },

    -- LSP commands.
    ["<leader>l."] = { ":LspRestart<cr>", desc = "Restart LSP" },

    -- File commands.
    ["<leader>b."] = { ":echo expand('%:p')<cr>", desc = "Show Buffer Path" },

    -- Apply commands.
    ["<leader>a"] = { name = "Apply Commands and Macros" },
    ["<leader>am"] = {
      ":. norm @<macro-name>",
      desc = "Apply macro at current line.",
    },
    ["<leader>ac"] = {
      ":. !<sh-cmd>",
      desc = "Apply command at current line.",
    },

    -- Format commands.
    ["<leader>bf"] = {
      ":FormatWriteLock<cr>",
      desc = "Format current buffer.",
    },

    -- Gomove plugin
    -- ["<S-h>"] = { "<Plug>GoNSMLeft" },
    -- ["<D-j>"] = { "<Plug>GoNSMDown" },
    -- ["<S-k>"] = { "<Plug>GoNSMUp" },
    -- ["<S-l>"] = { "<Plug>GoNSMRight" },
    -- ["<D-j>"] = { "<Plug>GoNSMDown" },
    -- ["<C-h>"] = { "<Plug>GoNSDLeft" },
    -- ["<C-j>"] = { "<Plug>GoNSDDown" }
    -- ["<C-k>"] = { "<Plug>GoNSDUp" },
    -- ["<C-l>"] = { "<Plug>GoNSDRight" },
  },

  v = {

    -- No clipboard override when pressing c, x or Del.
    ["s"] = { '"_s', remap = false },
    ["S"] = { '"_S', remap = false },
    ["c"] = { '"_c', remap = false },
    ["C"] = { '"_c', remap = false },
    ["<Del>"] = { '"_x', remap = false },
    -- No clipboard overwrite (reselect and yank again)
    -- when pasting in visual mode.
    ["p"] = { "pgvy", remap = false },

    -- Apply commands.
    ["<leader>a"] = { name = "Apply Commands and Macros" },
    ["<leader>am"] = {
      ":norm @<macro-name>",
      desc = "Apply macro over the selected lines.",
    },
    ["<leader>ac"] = {
      ":!<sh-cmd>",
      desc = "Apply command over the selected lines.",
    },
  },

  [{ "n", "v" }] = {
    -- Harpoon commands.
    ["<leader>jf"] = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = "Harpoon list." },
    ["<leader>jj"] = { ':lua require("harpoon.mark").add_file()<CR>', desc = "Add to harpoon list." },
    ["<S-j>"] = { ':lua require("harpoon.ui").nav_next()<CR>', desc = "Next harpoon file." },
    ["<S-k>"] = { ':lua require("harpoon.ui").nav_prev()<CR>', desc = "Previous harpoon file." },

    -- Hop commands.
    ["<leader>jk"] = { ":HopWord<CR>", desc = "Hop words." },
    ["<leader>jh"] = { ":HopLine<CR>", desc = "Hop lines." },
  },

  x = {
    -- ["<C-h>"] = { "<Plug>GoVSDLeft" },
    -- ["<C-j>"] = { "<Plug>GoVSDDown" },
    -- ["<C-k>"] = { "<Plug>GoVSDUp" },
    -- ["<C-l>"] = { "<Plug>GoVSDRight" },
    -- ["<S-h>"] = { "<Plug>GoVSMLeft" },
    -- ["<S-j>"] = { "<Plug>GoVSMDown" },
    -- ["<S-k>"] = { "<Plug>GoVSMUp" },
    -- ["<S-l>"] = { "<Plug>GoVSMRight" },
  },

  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}

-- Testing modifiers.
-- local map = vim.keymap.set
-- map("n", "<D-h>", ":lua print('D-h')<CR>", { remap = false })
-- map("n", "<M-h>", ":lua print('M-h')<CR>", { remap = false })
-- map("n", "<T-h>", ":lua print('T-h')<CR>", { remap = false })

return maps
