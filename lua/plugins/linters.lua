return {
  "mfussenegger/nvim-lint",
  lazy = false,
  event = "BufReadPre",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      docker = { "codespell", "typos" },
      go = { "codespell", "typos" },
      json = { "codespell", "typos", "jsonlint" },
      lua = { "codespell", "typos" },
      markdown = { "codespell", "typos", "markdownlint" },
      python = { "codespell", "typos" },
      rst = { "codespell", "typos" },
      rust = { "codespell", "typos" },
      sh = { "codespell", "typos" },
      text = { "codespell", "typos" },
      yaml = { "codespell", "typos", "yamllint" },
    }

    -- Codespell Settings
    local codespell_args =
      { "--builtin", "clear,rare,informal,usage,names,code" }
    local found =
      vim.fs.find(".codespell", { upward = true, path = vim.fn.getcwd() })[1]
    if found then
      vim.list_extend(codespell_args, { "-I", found })
    end
    -- Extend with default args.
    lint.linters.codespell.args =
      vim.list_extend(codespell_args, lint.linters.codespell.args)

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
      group = vim.api.nvim_create_augroup("NvimLintPluginEvents", {}),
    })
  end,
}
