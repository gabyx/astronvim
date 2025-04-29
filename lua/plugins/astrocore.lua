-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap

        -- Treesitter folding
        foldmethod = "expr",
        foldexpr = "nvim_treesitter#foldexpr()",
        -- Whitespace Characters
        listchars = "tab:▷ ,trail:·,extends:◣,precedes:◢,nbsp:○",
        list = true,
        -- Auto-reload files when modified externally
        -- https://unix.stackexchange.com/a/383044
        autoread = true,
        -- Do not conceal anything in files
        -- (markdown code blocks as example).
        conceallevel = 0,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
  },
  -- Configure neo-tree.
  {
    "nvim-neo-tree/neo-tree.nvim",
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
  -- {
  --   "rebelot/heirline.nvim",
  --   opts = function(_, opts)
  --     local status = require "astroui.status"
  --
  --     opts.statusline = { -- statusline
  --       hl = { fg = "fg", bg = "bg" },
  --       status.component.mode(),
  --       status.component.git_branch(),
  --       status.component.file_info(),
  --       status.component.git_diff(),
  --       status.component.diagnostics(),
  --       status.component.fill(),
  --       status.component.cmd_info(),
  --       status.component.fill(),
  --       status.component.lsp(),
  --       status.component.virtual_env(),
  --       status.component.treesitter(),
  --       status.component.nav(),
  --       status.component.mode { surround = { separator = "right" } },
  --     }
  --
  --     opts.winbar = { -- winbar
  --       init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
  --       fallthrough = false,
  --       { -- inactive winbar
  --         condition = function() return not status.condition.is_active() end,
  --         status.component.separated_path(),
  --         status.component.file_info {
  --           file_icon = {
  --             hl = status.hl.file_icon "winbar",
  --             padding = { left = 0 },
  --           },
  --           filename = {},
  --           filetype = false,
  --           file_read_only = false,
  --           hl = status.hl.get_attributes("winbarnc", true),
  --           surround = false,
  --           update = "BufEnter",
  --         },
  --       },
  --       { -- active winbar
  --         status.component.breadcrumbs {
  --           hl = status.hl.get_attributes("winbar", true),
  --         },
  --       },
  --     }
  --
  --     opts.tabline = { -- tabline
  --       { -- file tree padding
  --         condition = function(self)
  --           self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
  --           self.winwidth = vim.api.nvim_win_get_width(self.winid)
  --           return self.winwidth ~= vim.o.columns -- only apply to sidebars
  --             and not require("astrocore.buffer").is_valid(vim.api.nvim_win_get_buf(self.winid)) -- if buffer is not in tabline
  --         end,
  --         provider = function(self) return (" "):rep(self.winwidth + 1) end,
  --         hl = { bg = "tabline_bg" },
  --       },
  --       status.heirline.make_buflist(status.component.tabline_file_info()), -- component for each buffer tab
  --       status.component.fill { hl = { bg = "tabline_bg" } }, -- fill the rest of the tabline with background color
  --       { -- tab list
  --         condition = function() return #vim.api.nvim_list_tabpages() >= 2 end, -- only show tabs if there are more than one
  --         status.heirline.make_tablist { -- component for each tab
  --           provider = status.provider.tabnr(),
  --           hl = function(self) return status.hl.get_attributes(status.heirline.tab_type(self, "tab"), true) end,
  --         },
  --         { -- close button for current tab
  --           provider = status.provider.close_button {
  --             kind = "TabClose",
  --             padding = { left = 1, right = 1 },
  --           },
  --           hl = status.hl.get_attributes("tab_close", true),
  --           on_click = {
  --             callback = function() require("astrocore.buffer").close_tab() end,
  --             name = "heirline_tabline_close_tab_callback",
  --           },
  --         },
  --       },
  --     }
  --
  --     opts.statuscolumn = { -- statuscolumn
  --       init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
  --       status.component.foldcolumn(),
  --       status.component.numbercolumn(),
  --       status.component.signcolumn(),
  --     }
  --   end,
  -- },
  {
    "folke/snacks.nvim",
    opts = {
      notifier = {
        timeout = 100,
      },
    },
  },
}
