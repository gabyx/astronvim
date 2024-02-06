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

    local util = require("lspconfig.util")
    local lspconfig = require("lspconfig")
    opts.root_dir = util.root_pattern(unpack(root_files))

    lspconfig[server].setup(opts)
  end,

  rust_analyzer = function(_, opts)
    require("rust-tools").setup({ server = opts })
  end,

  tilt_ls = function(server, opts)
    -- print(vim.inspect(server), vim.inspect(opts))
    local lspconfig = require("lspconfig")
    opts.filetypes = { "tiltfile" }

    opts.on_attach = function(client, bufnr)
      if client.name == "tilt_ls" then
        vim.api.nvim_buf_set_option(bufnr, "filetype", "starlark")
      end
    end

    lspconfig[server].setup(opts)
  end,

  clangd = function(server, opts)
    local lspconfig = require("lspconfig")
    -- Set clangd to verbose logging.
    opts["document_config"]["default_config"]["cmd"] = { "clangd", "--log=verbose" }
    lspconfig[server].setup(opts)
  end,
}
