local action_state = require('telescope.actions.state')
local actions = {}
actions.save_colorscheme = function(prompt_bufnr)
  local entry = action_state.get_selected_entry(prompt_bufnr)

  vim.loop.fs_open('~/.config/nvim/lua/core/setting.lua', "w", 432, function(err, fd)
    vim.loop.fs_write(fd, "vim.opt.colorscheme = " .. entry.value, nil, function()
      vim.loop.fs_close(fd)
    end)
  end)
end

return actions
