return { -- add custom handler
  clangd = function(server, opts) require("clangd_extensions").setup { server = opts } end,
  pyright = function(server, opts)
    -- Exclude some files for the root marker.
    -- No `requirements.txt`
    local util = require "lspconfig.util"
    opts.root_dir = util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "pyrightconfig.json")
    return opts
  end,
}
