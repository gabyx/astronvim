return {
  "mhartington/formatter.nvim",
  cmd = { "Format", "FormatWrite" },
  lazy = false,
  config = function(_, opts)
    local fmt = require "formatter"
    local fmts = require "formatter.defaults"
    local fs = require "formatter.filetypes"

    opts = {
      logging = true,

      filetype = {
        typescriptreact = { fmts.prettier },
        javascriptreact = { fmts.prettier },
        javascript = { fmts.prettier },
        typescript = { fmts.prettier },
        json = { fmts.prettier },
        jsonc = { fmts.prettier },
        html = { fmts.prettier },
        css = { fmts.prettier },
        scss = { fmts.prettier },
        graphql = { fmts.prettier },
        markdown = { fmts.prettier },
        vue = { fmts.prettier },
        astro = { fmts.prettier },
        yaml = { fmts.prettier },
        go = { fs.go.gofmt, fs.go.goimports, fs.go.ogolines },
        python = { fs.python.black, fs.python.isort },
        cpp = { fs.cpp.clangformat },
        sh = { fs.sh.shfmt },
        lua = { fs.lua.stylua },
        nix = { fs.nix.alejandra },
        rust = {
          function()
            return {
              exe = "rustup",
              args = { "run", "nightly", "rustfmt" },
              stdin = true,
            }
          end,
        },
        ["*"] = {
          -- "formatter.filetypes.any" defines default configurations for any
          -- filetype
          fs.any.remove_trailing_whitespace
        }
      }
    }

    fmt.setup(opts)

    -- Runs Formatter on save
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = {
        "*",
      },
      command = "FormatWrite",
    })
  end,
}
