return { -- add custom handler
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

  rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end,
}
