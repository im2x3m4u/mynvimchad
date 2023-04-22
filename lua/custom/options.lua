local options = {}

options.transparent = true
options.float_border = true
options.show_winbar = true

-- auto command manager
options.auto_save = false
options.auto_reload = false
options.auto_switch_input = true
options.auto_restore_cursor_position = true
options.auto_remove_new_lines_comment = true
options.auto_save_session = true

options.database_connect = {
  {
    name = "HAINING-AGV",
    url = "postgres://postgres:123456@localhost:5430/HAINING-AGV",
  },
  {
    name = "JG037",
    url = "postgres://postgres:123456@localhost:5430/jg037",
  },
  {
    name = "HN3C",
    url = "postgres://postgres:123456@172.16.6.90:5432/HN3C",
  },
  {
    name = "HN3C-ANTS",
    url = "postgres://postgres:123456@172.16.6.91:5432/HN3C15.6_01",
  },
  {
    name = "dev",
    url = "mysql://askfiy@192.168.0.120/db1",
  },
  {
    name = "local",
    url = "mysql://root@localhost:3306/test",
  },
}

return options
