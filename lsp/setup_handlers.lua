return { -- add custom handler
  clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end,
},
