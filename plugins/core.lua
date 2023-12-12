return {
  {
    "goolord/alpha-nvim",
    enabled = false,
    -- opts = function(_, opts)
    --   -- customize the dashboard header
    --   opts.section.header.val = {
    --     "     ██████╗  █████╗ ██████╗ ██╗   ██╗██╗  ██╗                   ",
    --     "    ██╔════╝ ██╔══██╗██╔══██╗╚██╗ ██╔╝╚██╗██╔╝                   ",
    --     "    ██║  ███╗███████║██████╔╝ ╚████╔╝  ╚███╔╝                    ",
    --     "    ██║   ██║██╔══██║██╔══██╗  ╚██╔╝   ██╔██╗                    ",
    --     "    ╚██████╔╝██║  ██║██████╔╝   ██║   ██╔╝ ██╗                   ",
    --     "     ╚═════╝ ╚═╝  ╚═╝╚═════╝    ╚═╝   ╚═╝  ╚═╝                   ",
    --     "                                                                 ",
    --     " █████╗ ███████╗████████╗██████╗  ██████╗ ██╗   ██╗██╗███╗   ███╗",
    --     "██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║██║████╗ ████║",
    --     "███████║███████╗   ██║   ██████╔╝██║   ██║██║   ██║██║██╔████╔██║",
    --     "██╔══██║╚════██║   ██║   ██╔══██╗██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
    --     "██║  ██║███████║   ██║   ██║  ██║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
    --     "╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    --   }
    --   return opts
    -- end,
  },
  -- Configure neo-tree.
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
            ".git",
          },
        },
      },
    },
  },
  -- Customize stats bar
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require("astronvim.utils.status")
      opts.statusline = {
        -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode({
          mode_text = { padding = { left = 1, right = 1 } },
        }), -- add the mode text
        status.component.git_branch(),
        status.component.file_info({
          filetype = {},
          filename = false,
          file_modified = false,
        }),
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
  },
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
      local cmp = require("cmp")
      -- modify the sources part of the options table
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
        { name = "emoji", priority = 700 }, -- add new source
      })

      opts.sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.recently_used,
          require("clangd_extensions.cmp_scores"),
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      }
      return opts
    end,
  },
}
