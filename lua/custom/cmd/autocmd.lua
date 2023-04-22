local options = require "custom.options"

local autocmd = vim.api.nvim_create_autocmd

-- autocmd("VimEnter",{
--   pattern="*",
--   command="Nvdash",
-- })

-- autocmd("WinEnter", {
--    pattern = "*",
--    callback = function()
--       if vim.bo.buftype ~= "terminal" then
--          vim.opt.statusline = "%!v:lua.require'ui.statusline'.run()"
--       else
--          vim.opt.statusline = "%#normal# "
--       end
--    end,
-- })

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.opt.statusline = "%#normal# "
  end,
})
-- auto save buffer
if options.auto_save then
  autocmd({ "InsertLeave", "TextChanged" }, {
    pattern = { "*" },
    command = "silent! wall",
    nested = true,
  })
end

-- auto reload log file
if options.auto_reload then
  autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = { "*" },
    callback = function()
      if vim.fn.mode() ~= "c" then
        vim.cmd [[checktime]]
      end
    end,
  })
end

-- switch input method
if options.auto_switch_input then
  autocmd({ "InsertLeave" }, {
    pattern = { "*" },
    callback = function()
      local input_status = tonumber(vim.fn.system "fcitx5-remote")
      if input_status == 2 then
        vim.fn.system "fcitx5-remote -c"
      end
    end,
  })
end

-- auto restore cursor position
if options.auto_restore_cursor_position then
  autocmd("BufReadPost", {
    pattern = { "*" },
    callback = function()
      if vim.fn.line "'\"" > 0 and vim.fn.line "'\"" <= vim.fn.line "$" then
        vim.fn.setpos(".", vim.fn.getpos "'\"")
        -- how do I center the buffer in a sane way??
        -- vim.cmd('normal zz')
        vim.cmd "silent! foldopen"
      end
    end,
  })
end

-- remove auto-comments
if options.auto_remove_new_lines_comment then
  autocmd({ "BufEnter" }, {
    pattern = { "*" },
    callback = function()
      vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
    end,
  })
end

-- save session every time a buffer is written
-- if options.auto_save_session then
--   autocmd({ "BufWritePost" }, {
--     pattern = { "*" },
--     callback = function()
--       if vim.bo.filetype ~= "git" and not vim.bo.filetype ~= "gitcommit" then
--         require("session_manager").autosave_session()
--       end
--     end,
--   })
-- end
