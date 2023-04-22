local status_ok, notify = pcall(require, "notify")
if not status_ok then
    return
end
notify.setup {
    stages = "fade",
    timeout = 3000,
    fps = 120,
    icons = {
        ERROR = icons.Error,
        WARN = icons.Warn,
        INFO = icons.Hint,
    },
    background_colour = "#1E1E2E",
}
