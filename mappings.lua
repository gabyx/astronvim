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
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
