local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
    return
end
spectre.setup()

local api = require("custom.utils.api")
local public = require("custom.utils.public")

api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>rp",
            rhs = function()
                public.toggle_sidebar("spectre_panel")
                require("spectre").open()
            end,
            options = { silent = true },
            description = "Replace characters in all files in the current workspace",
        },
        {
            mode = { "n" },
            lhs = "<leader>rf",
            rhs = function()
                public.toggle_sidebar("spectre_panel")
                require("spectre").open_file_search()
            end,
            options = { silent = true },
            description = "Replace all characters in the current file",
        },
        {
            mode = { "n" },
            lhs = "<leader>rwf",
            rhs = function()
                public.toggle_sidebar("spectre_panel")
                require("spectre").open_visual({
                    select_word = true,
                    ---@diagnostic disable-next-line: missing-parameter
                    path = vim.fn.fnameescape(vim.fn.expand("%:p:.")),
                })
            end,
            options = { silent = true },
            description = "Replace the character under the cursor in the current file",
        },
        {
            mode = { "n" },
            lhs = "<leader>rwp",
            rhs = function()
                public.toggle_sidebar("spectre_panel")
                require("spectre").open_visual({ select_word = true })
            end,
            options = { silent = true },
            description = "Replace the character under the cursor in all files under the current workspace",
        },
    })

