---@type MappingsTable
local M = {}
-- In order to disable a default keymap, use
M.disabled = {
    n = {
        ["<C-n>"] = "",
        ["<leader>th"] = "",
        ["<leader>b"] = "",
    },
}
M.general = {
    -- n = {
    --   [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- },

    i = {
        ["<C-p>"] = { "<c-r>+", " ", opts = { nowait = true } },
        ["<S-Down>"] = { "<cmd>t.<cr>", " ", opts = { nowait = true } },
        ["<M-Down>"] = { "<cmd>m+<cr>", " ", opts = { nowait = true } },
        ["<S-Up>"] = { "<cmd>t -1<cr>", " ", opts = { nowait = true } },
        ["<M-Up>"] = { "<cmd>m-2<cr>", " ", opts = { nowait = true } },
        ["<C-l>"] = { "<cmd>LiveServer start<cr><cr>", " ", opts = { nowait = true } },
        ["<C-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", " ", opts = { nowait = true } },
    },
    v = {
        -- ["<leader>v"] = { '"+p', " ", opts = { nowait = true } },
        ["<A-j>"] = { ":m .+1<CR>==", " ", opts = { nowait = true } },
        ["<A-k>"] = { ":m .-2<CR>==", " ", opts = { nowait = true } },
        ["p"] = { '"_dP', " ", opts = { nowait = true } },
        ["J"] = { ":move '>+1<CR>gv-gv", " ", opts = { nowait = true } },
        ["K"] = { ":move '<-2<CR>gv-gv", " ", opts = { nowait = true } },
        ["<A-j>"] = { ":move '>+1<CR>gv-gv", " ", opts = { nowait = true } },
        ["<A-k>"] = { ":move '<-2<CR>gv-gv", " ", opts = { nowait = true } },
    },
    n = {
        -- ["<leader>v"] = { '"+p', "paste clipboard ", opts = { nowait = true } },
        ["<S-Down>"] = { "<cmd>t.<cr>", " ", opts = { nowait = true } },
        ["<S-Up>"] = { "<cmd>t -1<cr>", " ", opts = { nowait = true } },
        ["<M-J>"] = { "<cmd>t.<cr>", " ", opts = { nowait = true } },
        ["<M-K>"] = { "<cmd>t -1<cr>", " ", opts = { nowait = true } },
        ["<M-Down>"] = { "<cmd>m+<cr>", " ", opts = { nowait = true } },
        ["<M-Up>"] = { "<cmd>m-2<cr>", " ", opts = { nowait = true } },
        ["<M-j>"] = { "<cmd>m+<cr>", " ", opts = { nowait = true } },
        ["<M-k>"] = { "<cmd>m-2<cr>", " ", opts = { nowait = true } },
        ["<C-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", " ", opts = { nowait = true } },

        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    },
}
M.tabufline = {
    plugin = true,
    n = {
        -- cycle through buffers
        -- ["<tab>"] = {
        --   function()
        --     require("nvchad_ui.tabufline").tabuflineNext()
        --   end,
        --   "goto next buffer",
        -- },
        --
        -- ["<S-tab>"] = {
        --   function()
        --     require("nvchad_ui.tabufline").tabuflinePrev()
        --   end,
        --   "goto prev buffer",
        -- },

        -- close buffer + hide terminal buffer
        ["<leader>x"] = {
            function()
                require("nvchad_ui.tabufline").close_buffer()
            end,
            "close buffer",
        },
    },
}
M.nvimtree = {
    plugin = false,
    n = {
        -- toggle
        -- ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

        -- focus
        -- ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "focus nvimtree" },
        -- ["<leader>e"] = { "<cmd> Neotree position=current dir=%:p:h:h reveal_file=%:p <CR>", "focus file tree" },
    },
}
-- custom which key disini
M.whichkey = {
    n = {
        ["<leader>o"] = { "<cmd> NvimTreeFocus <CR>", "Open File Explorer" },
        ["<leader>z"] = { "<cmd> Telescope themes <CR>", "select themes" },
    },
}

-- more keybinds!

return M
