local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Source: https://code.mehalter.com/AstroNvim_user/~files/master/autocmds.lua
-- text like documents enable wrap and spell
autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text", "plaintex" },
  group = augroup("auto_spell", { clear = true }),
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

local function setup_resession()
  local notify = require("notify")
  local resession = require("resession")
  local buf_utils = require("astronvim.utils.buffer")

  -- Disable astronvim resession save autocmds
  vim.api.nvim_del_augroup_by_name("resession_auto_save")

  -- Have one session for each branch.
  local function get_session_name()
    local name = vim.fn.getcwd()
    local branch = vim.trim(vim.fn.system("git branch --show-current"))

    if vim.v.shell_error == 0 then
      name = name .. branch
    end
    return name
  end

  autocmd("VimEnter", {
    desc = "Save restore on enter",
    group = augroup("resession_auto_save_restore", { clear = true }),
    callback = function()
      -- Only load the session if nvim was started with no args
      if vim.fn.argc(-1) == 0 then
        resession.load(get_session_name(), { dir = "dirsession", silence_errors = true, notify = true })

        -- See the bug https://github.com/stevearc/resession.nvim/issues/44
        -- We retirgger all buffers here such that LSPs get attached.
        vim.cmd.doautoall("BufReadPost")
      end

      -- Delete the current autocmd.
      return true
    end,
  })

  -- Stupid workaround for https://github.com/neovim/neovim/issues/21856
  -- Which crashes vim on exit with VimLeavePre.
  vim.api.nvim_create_autocmd({ "VimLeave" }, {
    callback = function()
      vim.fn.jobstart('notify-send "hello"', { detach = true })
    end,
  })

  autocmd("VimLeavePre", {
    desc = "Save session on close",
    group = augroup("resession_auto_save_restore", { clear = false }),
    callback = function()
      if buf_utils.is_valid_session() then
        resession.save("Last Session", { notify = false })
        resession.save(get_session_name(), { dir = "dirsession", notify = false })
      end
    end,
  })
end

setup_resession()
