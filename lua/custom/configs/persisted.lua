local status_ok, persisted = pcall(require, "persisted")
if not status_ok then
    return
end

local api = require "custom.utils.api"
local options = require "custom.options"

persisted.setup {
    save_dir = api.path.join(vim.fn.stdpath "cache", "sessions"),
    use_git_branche = true,
    -- command = "VimLeavePre",
    -- autosave = options.auto_save_session,
    autosave = true,
    autoload = true,
    on_autoload_no_session = function()
        vim.notify "No existing session to load."
    end,
    follow_cwd = true,
    branch_separator = "_",
    after_save = function()
        vim.cmd "nohlsearch"
    end,
}

api.map.bulk_register {
    {
        mode = { "n" },
        lhs = "<leader>sl",
        rhs = "<cmd>silent! SessionLoad<cr>",
        options = { silent = true },
        description = "Load session",
    },
    {
        mode = { "n" },
        lhs = "<leader>ss",
        rhs = function()
            vim.cmd "silent! SessionSave"
            vim.api.nvim_echo({ { "Session saved success", "MoreMsg" } }, true, {})
        end,
        options = { silent = true },
        description = "Save session",
    },
    {
        mode = { "n" },
        lhs = "<leader>sd",
        rhs = function()
            local ok, _ = pcall(vim.cmd, "SessionDelete")
            if ok then
                vim.api.nvim_echo({ { "Session deleted success", "MoreMsg" } }, true, {})
            else
                vim.api.nvim_echo({ { "Session deleted failure", "ErrorMsg" } }, true, {})
            end
        end,
        options = { silent = true },
        description = "Delete session",
    },
}
