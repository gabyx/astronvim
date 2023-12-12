-- Filetype mappings which are not autodetected.
vim.filetype.add({
  extension = {},
  filename = {
    ["Tiltfile"] = "tiltfile",
    ["justfile"] = "make",
  },
  pattern = {},
})

-- Load autocmds
require("user.autocmds")

require("config-local").source()
