require "custom.cmd.autocmd"
require "custom.cmd.usercmd"
require "custom.setting"
require "custom.mapping"

-- local opt = vim.opt
-- opt.cmdheight = 0
-- require "custom.configs.format_onsave"

local lpath = vim.fn.stdpath "config" .. "/lua/custom/my-snippets"
vim.g.vscode_snippets_path = lpath
vim.g.snipmate_snippets_path = lpath

vim.g.VM_Extend_hl = "VM_Extend_hl"
vim.g.VM_Cursor_hl = "VM_Cursor_hl"
vim.g.VM_Mono_hl = "VM_Mono_hl"
vim.g.VM_Insert_hl = "VM_Insert_hl"

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
