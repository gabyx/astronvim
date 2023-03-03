local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "cpp",
    "rust",
    "go",
    "markdown",
    "markdown_inline",
    "python",
  },
  indent = {
    enable = true,
    disable = {
      "python",
    },
  },
}

M.mason = {
  ensure_installed = {

    "editorconfig-checker",

    "json-lsp",
    "prettier",
    "prettierd",


    "lua-language-server",
    "stylua",

    "groovy-language-server",

    "bash-language-server",
    "shellcheck",
    "shfmt",

    "docker-compose-language-service",
    "dockerfile-language-server",

    "rustfmt",
    "rust-analyzer",

    "goimports",
    "golangci-lint",
    "golangci-lint-langserver",
    "delve",

    "pyright",
    "python-lsp-server",
    "mypy",
    "autoflake",
    "flake8",
    "black",
    "isort",

    "cpptools",

    "gradle-language-server",

    "codespell",

    -- web dev stuff
    -- "css-lsp",
    -- "html-lsp",
    -- "typescript-language-server",
    -- "deno",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
