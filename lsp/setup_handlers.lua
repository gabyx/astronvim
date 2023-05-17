return { -- add custom handler
  clangd = function(server, opts) require("clangd_extensions").setup { server = opts } end,
  pyright = function(server, opts)
    -- Exclude some files for the root marker.
    -- No `requirements.txt`
    local root_files = {
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "pyrightconfig.json",
    }

    local util = require "lspconfig.util"
    local lspconfig = require "lspconfig"

    lspconfig[server].setup(vim.tbl_deep_extend("force", opts, {
      root_dir = util.root_pattern(unpack(root_files)),
    }))
  end,
}
