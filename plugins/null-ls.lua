return {
  -- https://github.com/craftzdog/dotfiles-public/issues/132
  -- Null-ls is archieved, replace with something else.
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, config)
      -- config variable is the default configuration table for the setup function call
      local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set formatter.
        null_ls.builtins.formatting.trim_whitespace,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.markdown_toc,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.npm_groovy_lint,
        -- Set diagnostics.
        null_ls.builtins.diagnostics.codespell,
      }
      return config -- return final config table
    end,
  },
}
