local status_ok, starlight = pcall(require, "starlight")
if not status_ok then
    return
end

local options = require "custom.options"

starlight.setup {
    preset = true,
    transparent = options.transparent,
    style = {
        comments = { italic = true },
        functions = { italic = false },
        keywords = { italic = false },
        strings = { italic = false },
        variables = { italic = false },
    },
    extend = {
        hop = true,
        lazy = true,
        aerial = true,
        fidget = true,
        nvim_cmp = true,
        gitsigns = true,
        markdown = true,
        which_key = true,
        nvim_tree = true,
        lspconfig = true,
        telescope = true,
        bufferline = true,
        nvim_navic = true,
        nvim_notify = true,
        vim_illuminate = true,
        nvim_scrollview = true,
        nvim_treesitter = true,
        nvim_ts_rainbow = true,
        indent_blankline = true,
        vim_visual_multi = true,
    },
    hooks = {
        before = function(utils, colors)
        end,
        after = function(utils, colors)
            if not options.float_border then
                utils.hl.bulk_set_highlight {
                    Pmenu = { bg = colors.black1 },
                    NormalFloat = { fg = colors.white, bg = colors.black1 },
                    DiagnosticFloatingError = { fg = colors.red, bg = colors.black1 },
                    DiagnosticFloatingWarn = { fg = colors.yellow, bg = colors.black1 },
                    DiagnosticFloatingInfo = { fg = colors.blue, bg = colors.black1 },
                    DiagnosticFloatingHint = { fg = colors.blue, bg = colors.black1 },
                }
            end
        end,
    },
}

vim.cmd("colorscheme starlight")
