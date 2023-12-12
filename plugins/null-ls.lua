return {
  -- https://github.com/craftzdog/dotfiles-public/issues/132
  -- Null-ls is archived, replace with something else.
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, config)
      -- config variable is the default configuration table for the setup function call
      local null_ls = require("null-ls")

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set diagnostics.
        -- null_ls.builtins.diagnostics.codespell,
      }
      return config -- return final config table
    end,
  },
}
