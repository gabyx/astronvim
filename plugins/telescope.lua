return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { -- add a new dependency to telescope that is our new plugin
      "nvim-telescope/telescope-media-files.nvim",
      -- "ahmedkhalf/project.nvim", -- defined in  ./editor.lua
    },

    -- The first parameter is the plugin specification
    -- The second is the table of options as set up in Lazy with the `opts` key
    opts = function(plugin, opts)
      local telescope = require "telescope"
      local actions = require "telescope.actions"

      return require("astronvim.utils").extend_tbl(opts, {
        defaults = {
          mappings = {
            -- Default mapping does not work for me `<M-q>`.
            i = {
              ["<C-f>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
            n = {
              ["<C-f>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          git_files = {
            recurse_submodules = true,
          },
          buffers = {
            path_display = { "smart" },
          },
        },
      })
    end,

    config = function(plugin, opts)
      require "plugins.configs.telescope"(plugins, opts)
      local telescope = require "telescope"

      -- telescope.load_extension "projects"
      telescope.load_extension "media_files"
    end,
  },
}
