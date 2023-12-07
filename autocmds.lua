-- Source: https://code.mehalter.com/AstroNvim_user/~files/master/autocmds.lua
-- text like documents enable wrap and spell
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text", "plaintex" },
  group = vim.api.nvim_create_augroup("auto_spell", { clear = true }),
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- Filetype mappings which are not autodetected.
vim.filetype.add {
  extension = {},
  filename = {
    ["Tiltfile"] = "starlark",
    ["justfile"] = "make",
  },
}
