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
    opts.root_dir = util.root_pattern(unpack(root_files))
    lspconfig[server].setup(opts)
  end,
}
