local setting = {}

setting.g = {
    mapleader = " ",
}

setting.opt = {
    cmdheight = 0,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    autoindent = true,
    copyindent = true,
    ruler = false,
    showmode = false,
    swapfile = false,
    signcolumn = "yes:1",
    --[[ signcolumn = "number", ]]
    completeopt = "menuone,noselect",
    pumheight = 10,
    updatetime = 500,
    timeoutlen = 500,
    termguicolors = true,
    cursorline = true,
    numberwidth = 2,
    number = true,
    relativenumber = true,
    scrolloff = 21,
    mouse = "a",
    list = true,
    spell = true,
    spelllang = "en_us,cjk",
    ignorecase = false,
    smartcase = true,
    filetype = "plugin",
    foldmethod = "indent",
    foldlevel = 100,
    foldcolumn = "0",
    clipboard = "unnamedplus",
    undofile = true,
    smartindent = true,
    iskeyword = "@,48-57,_,192-255",
    laststatus = 3,
    linebreak = true,
    fillchars = "eob: ",
    fileencodings = "ucs-bom,utf-8,gbk,big5,gb18030,latin1",
    sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,globals",
}

-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:append("tab:↹ ")

vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<>[]hl")
-- vim.g.loaded_python3_provider=1
vim.g.python3_host_prog="/usr/local/bin/python3.10"
-- vim.g.nvim_tree_respect_buf_cwd = 1
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.relativenumber = true
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.cmd [[colorscheme koehler]]

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>]e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '<leader>]q', vim.diagnostic.setloclist)

for prefix, tbl in pairs(setting) do
    for key, value in pairs(tbl) do
        vim[prefix][key] = value
    end
end

local disable_builtin_plugins = {
    -- "netrw",
    -- "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, builtin_plugin in ipairs(disable_builtin_plugins) do
    vim.g["loaded_" .. builtin_plugin] = 1
end

return setting
