-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
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
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- Search Git files.
    ["<leader>fg"] = { ":Telescope git_files<cr>", desc = "Find Git files" },
    ["<leader>wa>"] = { ":wa!<cr>", desc = "Save all files" },
    -- Undo Tree toggle.
    ["<leader>bu"] = {
      function() vim.cmd.UndotreeToggle() end,
      desc = "Show Undo Tree",
    },
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
      ":'<,'> norm @<macro-letter-name>",
      desc = "Apply macro over the selected lines.",
    },
    ["<leader>ac"] = {
      ":'<,'> !<shell-command>",
      desc = "Apply command over the selected lines.",
    },
    ["<leader>aM"] = {
      ":'<,'> norm @<macro-letter-name>",
      desc = "Apply macro over the buffer.",
    },
    ["<leader>aC"] = {
      ":'<,'> !<shell-command>",
      desc = "Apply command over the buffer.",
    },

    -- Format commands.
    ["<leader>bf"] = {
      ":FormatWriteLock<cr>",
      desc = "Format current buffer."
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
