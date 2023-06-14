local api = require "custom.utils.api"

local mapping = {}

api.map.bulk_register {
    {
        mode = { "n" },
        lhs = "<c-q>",
        rhs = ":bd<cr>",
        options = { silent = true },
        description = "Close current buffer",
    },
    {
        mode = { "n" },
        lhs = "<leader><esc>",
        rhs = ":qa!<cr>",
        options = { silent = true },
        description = "Escape Neovim",
    },
    {
        mode = { "i" },
        lhs = "jj",
        rhs = "<esc>",
        options = { silent = true },
        description = "Escape editor insert mode",
    },
    {
        mode = { "t" },
        lhs = "<esc>",
        rhs = "<c-\\><c-n>",
        options = { silent = true },
        description = "Escape terminal insert mode",
    },
    {
        mode = { "n" },
        lhs = "<esc>",
        rhs = ":noh<cr>",
        options = { silent = true },
        description = "Clear search highlight",
    },
    {
        mode = { "n" },
        lhs = "<c-u>",
        rhs = function()
            vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "k")
        end,
        options = { silent = true },
        description = "Move 1/4 screen up",
    },
    {
        mode = { "n" },
        lhs = "<c-d>",
        rhs = function()
            vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "j")
        end,
        options = { silent = true },
        description = "Move 1/4 screen down",
    },
    {
        mode = { "n" },
        lhs = "<m-k>",
        rhs = "<c-w>-",
        options = { silent = true },
        description = "Reduce horizontal split screen size",
    },
    {
        mode = { "n" },
        lhs = "<m-j>",
        rhs = "<c-w>+",
        options = { silent = true },
        description = "Increase horizontal split screen size",
    },
    {
        mode = { "n" },
        lhs = "<m-h>",
        rhs = "<c-w><",
        options = { silent = true },
        description = "Reduce vertical split screen size",
    },
    {
        mode = { "n" },
        lhs = "<m-l>",
        rhs = "<c-w>>",
        options = { silent = true },
        description = "Increase vertical split screen size",
    },
    {
        mode = { "n" },
        lhs = "<leader>cs",
        rhs = "<cmd>set spell!<cr>",
        options = { silent = true },
        description = "Enable or disable spell checking",
    },
    {
        mode = { "i" },
        lhs = "<A-k>",
        rhs = "<up>",
        options = {},
        description = "Move cursor up",
    },
    {
        mode = { "i" },
        lhs = "<A-j>",
        rhs = "<down>",
        options = {},
        description = "Move cursor down",
    },
    {
        mode = { "i" },
        lhs = "<A-h>",
        rhs = "<left>",
        options = {},
        description = "Move cursor left",
    },
    {
        mode = { "i" },
        lhs = "<A-l>",
        rhs = "<right>",
        options = {},
        description = "Move cursor right",
    },
    {
        mode = { "c" },
        lhs = "<m-p>",
        rhs = "<up>",
        options = {},
        description = "Look up history",
    },
    {
        mode = { "c" },
        lhs = "<m-n>",
        rhs = "<down>",
        options = {},
        description = "Look down history",
    },
    {
        mode = { "n", "x" },
        lhs = "k",
        rhs = function()
            return vim.v.count > 0 and "k" or "gk"
        end,
        options = { silent = true, expr = true },
        description = "Move up one line",
    },
    {
        mode = { "n", "x" },
        lhs = "j",
        rhs = function()
            return vim.v.count > 0 and "j" or "gj"
        end,
        options = { silent = true, expr = true },
        description = "Move down one line",
    },
    {
        mode = { "n", "x" },
        lhs = "H",
        rhs = function()
            return vim.v.count > 0 and "^" or "g^"
        end,
        options = { silent = true, expr = true },
        description = "Move to the first character at the beginning of the line",
    },
    {
        mode = { "n", "x" },
        lhs = "L",
        rhs = function()
            return vim.v.count > 0 and "$" or "g$"
        end,
        options = { silent = true, expr = true },
        description = "Move to the last character at the end of the line",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-w>",
        rhs = "<c-right>",
        options = {},
        description = "Jump to next word in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-b>",
        rhs = "<c-left>",
        options = {},
        description = "Jump to previous word in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-k>",
        rhs = "<up>",
        options = {},
        description = "Move cursor up in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-j>",
        rhs = "<down>",
        options = {},
        description = "Move cursor down in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-h>",
        rhs = "<left>",
        options = {},
        description = "Move cursor left in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-l>",
        rhs = "<right>",
        options = {},
        description = "Move cursor right in insert mode",
    },
    {
        mode = { "n","i" },
        lhs = "<C-e>",
        rhs = "<cmd>lua require('telescope.builtin').find_files({cwd = vim.fn.expand('%:p:h')})<cr>",
        options = { silent = true },
        description = "Find Files Here",
    },
    {
        mode = { "n" },
        lhs = "<leader>.",
        rhs = "<cmd>lua require('telescope.builtin').find_files({cwd = vim.fn.expand('%:p:h')})<cr>",
        options = { silent = true },
        description = "Find Files Here",
    },
    -- {
    --     mode = { "n" },
    --     lhs = "<leader>q",
    --     rhs = "<cmd>wqall<CR>",
    --     options = { silent = true },
    --     description = "Quit Neovim",
    -- },
    {
        mode = { "n", "i" },
        lhs = "<C-s>",
        rhs = "<cmd>wall!<CR>",
        options = { silent = true },
        description = "Save",
    },
    -- {
    --     mode = { "n" },
    --     lhs = "<leader>ws",
    --     rhs = "<cmd>wall!<CR>",
    --     options = { silent = true },
    --     description = "Save All",
    -- },
    -- {
    --     mode = { "n" },
    --     lhs = "<leader>df",
    --     rhs = "<cmd>lua vim.lsp.buf.format { async=true }<cr>",
    --     options = { silent = true },
    --     description = "Format Document",
    -- },
    -- {
    --     mode = { "n" },
    --     lhs = "<leader>ls",
    --     rhs = "<cmd>Telescope lsp_document_symbols<cr>",
    --     options = { silent = true },
    --     description = "Find Document Symbol",
    -- },
    {
        mode = { "n" },
        lhs = "<leader>/",
        rhs = function()
            require("Comment.api").toggle.linewise.current()
        end,
        options = { silent = true },
        description = "Toggle Comment",
    },
    {
        mode = { "v" },
        lhs = "<leader>/",
        rhs = "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        options = { silent = true },
        description = "Toggle Comment",
    },
    -- {
    --     mode = { "n" },
    --     lhs = "<leader>fw",
    --     rhs = "<cmd>lua require('telescope.builtin').grep_string()<CR>",
    --     options = { silent = true },
    --     description = "Find Current Word",
    -- },
    {
        mode = { "n" },
        lhs = "<leader>fr",
        rhs = "<cmd>lua require('telescope.builtin').resume()<CR>",
        -- rhs = function()
        --     require("telescope.builtin").oldfiles()
        -- end,
        options = { silent = true },
        description = "Resume Last Find",
    },
    -- {
    --     mode = { "n" },
    --     lhs = "<leader>e",
    --     rhs = "<cmd>lua require('telescope.builtin').buffers()<CR>",
    --     -- rhs = function()
    --     --     require("telescope.builtin").oldfiles()
    --     -- end,
    --     options = { silent = true },
    --     description = "Find files history",
    -- },
    {
        mode = { "n" },
        lhs = "<leader>fu",
        rhs = "<cmd>lua require('telescope.builtin').find_files({find_command={'fd', vim.fn.expand('<cword>')}})<CR>",
        options = { silent = true },
        description = "Find files under cursor",
    },
    {
        mode = { "n" },
        lhs = "ff",
        rhs = "<cmd>lua require('telescope.builtin').find_files()<CR>",
        options = { silent = true },
        description = "Find files",
    },
    {
        mode = { "v" },
        lhs = "<tab>",
        rhs = ">gv",
        options = { silent = true },
        description = "block indent left",
    },
    {
        mode = { "v" },
        lhs = "<s-tab>",
        rhs = "<gv",
        options = { silent = true },
        description = "block indent right",
    },
    {
        mode = { "v" },
        lhs = "<leader>y1",
        rhs = '"ay',
        options = { silent = true },
        description = "copy to register a",
    },
    {
        mode = { "v" },
        lhs = "<leader>y2",
        rhs = '"by',
        options = { silent = true },
        description = "copy to register b",
    },
    {
        mode = { "v" },
        lhs = "<leader>y3",
        rhs = '"cy',
        options = { silent = true },
        description = "copy to register c",
    },
    {
        mode = { "v" },
        lhs = "<leader>y4",
        rhs = '"dy',
        options = { silent = true },
        description = "copy to register d",
    },
    {
        mode = { "v" },
        lhs = "<leader>y5",
        rhs = '"ey',
        options = { silent = true },
        description = "copy to register e",
    },
    {
        mode = { "v" },
        lhs = "<leader>y6",
        rhs = '"fy',
        options = { silent = true },
        description = "copy to register f",
    },
    {
        mode = { "v" },
        lhs = "<c-y>",
        rhs = '"ay',
        options = { silent = true },
        description = "copy to register a",
    },
    {
        mode = { "n", "i" },
        lhs = "<C-c>",
        rhs = 'yy',
        options = { silent = true },
        description = "copy a line",
    },
    {
        mode = { "n", "v" },
        lhs = "<leader>v",
        rhs = '"0p',
        options = { silent = true },
        description = "paste from register",
    },
    {
        mode = { "n", "v" },
        lhs = "<leader>p1",
        rhs = '"ap',
        options = { silent = true },
        description = "paste from register a",
    },
    {
        mode = { "n", "v" },
        lhs = "<leader>p2",
        rhs = '"bp',
        options = { silent = true },
        description = "paste from register b",
    },
    {
        mode = { "n", "v" },
        lhs = "<leader>p3",
        rhs = '"cp',
        options = { silent = true },
        description = "paste from register c",
    },
    {
        mode = { "n", "v" },
        lhs = "<leader>p4",
        rhs = '"dp',
        options = { silent = true },
        description = "paste from register d",
    },
    {
        mode = { "n", "v" },
        lhs = "<leader>p5",
        rhs = '"ep',
        options = { silent = true },
        description = "paste from register e",
    },
    {
        mode = { "n", "v" },
        lhs = "<leader>p6",
        rhs = '"fp',
        options = { silent = true },
        description = "paste from register f",
    },
    -- {
    --     mode = { "n" },
    --     lhs = "<tab>",
    --     rhs = "v>",
    --     options = { silent = true },
    --     description = "line indent left",
    -- },
    -- {
    --     mode = { "n" },
    --     lhs = "<s-tab>",
    --     rhs = "v<",
    --     options = { silent = true },
    --     description = "line indent right",
    -- },
    -- {
    --     mode = { "n" },
    --     lhs = "<c-p>",
    --     rhs = "<cmd>bprevious<CR>",
    --     options = { silent = true },
    --     description = "goto previous buffer",
    -- },
    -- {
    --     mode = { "n" },
    --     lhs = "<c-m>",
    --     rhs = "<cmd>bnext<CR>",
    --     options = { silent = true },
    --     description = "goto next buffer",
    -- },
    {
        mode = { "n" },
        lhs = "<c-x>",
        rhs = "dd",
        options = { silent = true },
        description = "Delete line",
    },
    {
        mode = { "n" },
        lhs = "<leader>m",
        rhs = "<cmd>lua require('grapple').toggle()<cr>",
        options = { silent = true },
        description = "Toggle Mark file",
    },
    {
        mode = { "n" },
        lhs = "<leader>j",
        -- rhs = "<cmd>lua require('grapple').cycle_forward()<cr>",
        rhs = "<cmd>lua require('grapple').select({ key = 1 })<cr>",
        options = { silent = true },
        description = "Goto File Mark 1",
    },
    {
        mode = { "n" },
        lhs = "<leader>J",
        rhs = "<cmd>lua require('grapple').popup_tags()<cr>",
        options = { silent = true },
        description = "Show popup tags",
    },
    {
        mode = { "n" },
        lhs = "<leader>K",
        rhs = "<cmd>lua require('grapple').reset()<cr>",
        options = { silent = true },
        description = "Reset file tags",
    },
    {
        mode = { "n" },
        lhs = "<leader>k",
        -- rhs = "<cmd>lua require('grapple').cycle_backward()<cr>",
        rhs = "<cmd>lua require('grapple').cycle_forward()<cr>",
        options = { silent = true },
        description = "Previous Toggle Mark",
    },
    -- {
    --     mode = { "n", "v" },
    --     lhs = "ss",
    --     rhs = "<cmd>HopWord<cr>",
    --     options = { silent = true },
    --     description = "Jump to word head",
    -- },
    -- {
    --     mode = { "n", "v" },
    --     lhs = "sl",
    --     rhs = "<cmd>HopLine<cr>",
    --     options = { silent = true },
    --     description = "Jump to line",
    -- },
    -- {
    --     mode = { "n", "v" },
    --     lhs = "sf",
    --     rhs = "<cmd>HopChar1<cr>",
    --     options = { silent = true },
    --     description = "Jump to search char on buffer",
    -- },
    -- {
    --     mode = { "n", "v" },
    --     lhs = "sc",
    --     rhs = "<cmd>HopChar1CurrentLine<cr>",
    --     options = { silent = true },
    --     description = "Jump to search char on current line",
    -- },
    {

        mode = { "n" },
        lhs = "<leader>bq",
        rhs = function()
            local buf = vim.api.nvim_get_current_buf()
            vim.cmd("bd " .. buf)
        end,
        options = { silent = true },
        description = "Close current buffer",
    },
    {
        mode = { "n" },
        lhs = "<leader>bn",
        rhs = "<cmd>tabnew<cr>",
        options = { silent = true },
        description = "Create new buffer",
    },
    -- {
    --     mode = { "n" },
    --     lhs = "<leader>bh",
    --     rhs = "<cmd>BufferLineCloseLeft<cr>",
    --     options = { silent = true },
    --     description = "Close all left buffers",
    -- },
    -- {
    --     mode = { "n" },
    --     lhs = "<leader>bl",
    --     rhs = "<cmd>BufferLineCloseRight<cr>",
    --     options = { silent = true },
    --     description = "Close all right buffers",
    -- },
    {
        mode = { "n" },
        lhs = "<leader>bo",
        rhs = function()
            for _, buf in ipairs(vim.t.bufs) do
                if buf ~= vim.api.nvim_get_current_buf() then
                    vim.cmd("bd " .. buf)
                end
            end
            -- require('nvchad_ui.tabufline').closeOtherBufs("")
        end,
        options = { silent = true },
        description = "Close all other buffers",
    },
    {
        mode = { "n" },
        lhs = "<leader>ba",
        rhs = function()
            require("nvchad_ui.tabufline").closeAllBufs ""
        end,
        options = { silent = true },
        description = "Close all buffers",
    },
    -- {
    --     mode = { "n" },
    --     lhs = "<leader>bt",
    --     rhs = function()
    --         vim.g.tbufpick_showNums = true
    --         vim.cmd "redrawtabline"
    --
    --         vim.api.nvim_echo({ { "Enter Num ", "Question" } }, false, {})
    --
    --         local key = tonumber(vim.fn.nr2char(vim.fn.getchar()))
    --         local bufid = vim.t.bufs[(key and key or 0) + vim.g.bufirst]
    --         if key and bufid then
    --             vim.cmd("b" .. bufid)
    --             vim.api.nvim_echo({ { "" } }, false, {})
    --             vim.cmd "redraw"
    --         else
    --             vim.cmd "redraw"
    --             print "bufpick cancelled, press a number key!"
    --         end
    --
    --         vim.g.tbufpick_showNums = false
    --         vim.cmd "redrawtabline"
    --     end,
    --     options = { silent = true },
    --     description = "Go to buffer *",
    -- },
}

return mapping
