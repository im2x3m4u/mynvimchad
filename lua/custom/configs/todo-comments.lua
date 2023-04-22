local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
    return
end

local public = require "custom.utils.public"
local icons = public.get_icons("tag_level", true)

todo_comments.setup {
    keywords = {
        -- alt = alias
        NOTE = { icon = icons.Note, color = "#96CDFB" },
        TODO = { icon = icons.Todo, color = "#B5E8E0" },
        PERF = { icon = icons.Pref, color = "#F8BD96" },
        WARN = { icon = icons.Warn, color = "#FAE3B0" },
        HACK = {
            icon = icons.Hack,
            color = "#DDB6F2",
            alt = { "DEP" },
        },
        FIX = {
            icon = icons.Fixme,
            color = "#DDB6F2",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
    },
}
