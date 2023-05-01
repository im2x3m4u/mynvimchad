local overrides = require "custom.configs.overrides"
-- initial active plugins optional
local active_debug = true
local active_toggleterm = true
local active_visualmulti = true
local active_lspinstaller = false
local active_smartsplit = true
local active_liveserver = false
local active_dressing = false
local active_cmdline = true
local active_coderunner = true
local active_winbar = true
-- default variable
local debug = {}
local liveserver = {}
local visualmulti = {}
local coderunner = {}
local lspinstaller = {}
local smartsplit = {}
local dressing = {}
local winbar = {}
local cmdline = {}
local toggleterm = {}
-- activation
if active_toggleterm then
  toggleterm = {
    {
      "akinsho/toggleterm.nvim",
      cmd = "ToggleTerm",
      event = "BufRead",
      config = function()
        require "custom.configs.toggleterm"
      end,
    },
  }
end
if active_cmdline then
  cmdline = {
    {
      "folke/noice.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
      event = "BufWinEnter",
      opts = {
        messages = {
          enabled = false,
        },
        notify = {
          enabled = true,
        },
        lsp = {
          progress = {
            enabled = true,
          },
          hover = {
            enabled = false,
          },
          signature = {
            enabled = false,
          },
        },
      },
      keys = {
        {
          "<S-Enter>",
          function()
            require("noice").redirect(vim.fn.getcmdline())
          end,
          mode = "c",
          desc = "Redirect Cmdline",
        },
        {
          "<leader>snl",
          function()
            require("noice").cmd "last"
          end,
          desc = "Noice Last Message",
        },
        {
          "<leader>snh",
          function()
            require("noice").cmd "history"
          end,
          desc = "Noice History",
        },
        {
          "<leader>sna",
          function()
            require("noice").cmd "all"
          end,
          desc = "Noice All",
        },
        -- {
        --     "<c-f>",
        --     function()
        --         if not require("noice.lsp").scroll(4) then
        --             return "<c-f>"
        --         end
        --     end,
        --     silent = true,
        --     expr = true,
        --     desc = "Scroll forward",
        --     mode = { "i", "n", "s" },
        -- },
        -- {
        --     "<c-b>",
        --     function()
        --         if not require("noice.lsp").scroll( -4) then
        --             return "<c-b>"
        --         end
        --     end,
        --     silent = true,
        --     expr = true,
        --     desc = "Scroll backward",
        --     mode = { "i", "n", "s" },
        -- },
      },
    },
    {
      "hrsh7th/cmp-cmdline",
      event = "VeryLazy",
      config = function()
        local cmp = require "cmp"
        local mapping = {
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
          ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
          ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
          ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        }

        -- Use buffer source for `/`.
        cmp.setup.cmdline("/", {
          preselect = "none",
          completion = {
            completeopt = "menu,preview,menuone,noselect",
          },
          mapping = mapping,
          sources = {
            { name = "buffer" },
          },
          experimental = {
            ghost_text = true,
            native_menu = false,
          },
        })

        -- Use cmdline & path source for ':'.
        cmp.setup.cmdline(":", {
          preselect = "none",
          completion = {
            completeopt = "menu,preview,menuone,noselect",
          },
          mapping = mapping,
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            { name = "cmdline" },
          }),
          experimental = {
            ghost_text = true,
            native_menu = false,
          },
        })
      end,
    },
  }
end
-- for winbar
if active_winbar then
  winbar = {
    {
      "SmiteshP/nvim-navic",
      dependencies = "neovim/nvim-lspconfig",
      event = "BufRead",
      config = function()
        require "custom.configs.breadcrumb"
        require "custom.configs.winbar"
      end,
    },
  }
end
-- for dressing
if active_dressing then
  dressing = {
    {
      "stevearc/dressing.nvim",
      lazy = true,
      init = function()
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.select = function(...)
          require("lazy").load { plugins = { "dressing.nvim" } }
          return vim.ui.select(...)
        end
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.input = function(...)
          require("lazy").load { plugins = { "dressing.nvim" } }
          return vim.ui.input(...)
        end
      end,
    },
  }
end
-- for smart split
if active_smartsplit then
  smartsplit = {
    {
      "mrjones2014/smart-splits.nvim",
      event = "BufRead",
      config = function()
        require "custom.configs.smartsplit"
      end,
    },
  }
end
-- for lspinstaller
if active_lspinstaller then
  lspinstaller = {
    { "williamboman/nvim-lsp-installer", event = "VeryLazy", lazy = true },
  }
end
-- for coderunner
if active_coderunner then
  coderunner = {
    {
      "CRAG666/code_runner.nvim",
      event = "BufRead",
      -- dependencies = "nvim-lua/plenary.nvim",
      cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
      config = function()
        require "custom.configs.coderunner"
      end,
    },
  }
end
-- for visualmulti
if active_visualmulti then
  visualmulti = {
    {
      "mg979/vim-visual-multi",
      lazy = false,
      -- event = "BufRead",
      -- fn = { "vm#commands#add_cursor_up", "vm#commands#add_cursor_down" },
      keys = { "<c-n>" },
      config = function()
        vim.g.VM_Extend_hl = "VM_Extend_hl"
        vim.g.VM_Cursor_hl = "VM_Cursor_hl"
        vim.g.VM_Mono_hl = "VM_Mono_hl"
        vim.g.VM_Insert_hl = "VM_Insert_hl"

        vim.g.VM_default_mappings = 0
        vim.g.VM_mouse_mappings = 0
        vim.g.VM_maps = {
          ["I BS"] = "", -- disable backspace mapping
          ["Find Under"] = "<c-n>",
          ["Find Subword Under"] = "<C-n>",
          ["Find Prev"] = "<c-p>",
          ["Skip Region"] = "<c-s>",
          ["Select Cursor Down"] = "<M-C-Down>",
          ["Select Cursor Up"] = "<M-C-Up>",
        }
      end,
    },
  }
end
-- for liveserver
if active_liveserver then
  liveserver = {
    {
      "manzeloth/live-server",
      cmd = { "LiveServer" },
      event = "BufRead",
      build = "npm install -g live-server",
    },
  }
end
-- for debuging
if active_debug then
  debug = {
    {
      "rcarriga/nvim-dap-ui",
      event = "BufRead",
      dependencies = "mfussenegger/nvim-dap",
      enabled = vim.fn.has "win32" == 0,
      config = function()
        require "custom.configs.dapui"
      end,
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      event = "BufRead",
      dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
      enabled = vim.fn.has "win32" == 0,
      config = function()
        require "custom.configs.mason_dap"
      end,
    },
  }
end
---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  -- {
  --     "neovim/nvim-lspconfig",
  --     dependencies = {
  --         -- format & linting
  --         {
  --             "jose-elias-alvarez/null-ls.nvim",
  --             config = function()
  --                 require "custom.configs.null-ls"
  --             end,
  --         },
  --     },
  --     config = function()
  --         require "plugins.configs.lspconfig"
  --         require "custom.configs.lspconfig"
  --     end, -- Override to setup mason-lspconfig
  -- },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    priority = 1500,
    opts = overrides.nvimtree,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  -- Install a plugin
  { "HiPhish/nvim-ts-rainbow2", lazy = true, event = "BufRead" },
  {
    "ur4ltz/surround.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      require("surround").setup {
        mappings_style = "surround",
        space_on_closing_char = true,
      }
    end,
  },
  -- {
  --     "RRethy/vim-illuminate",
  --     disable = true,
  --     lazy = true,
  --     event = { "BufRead", "BufNewFile" },
  --     config = function()
  --         require("illuminate").configure {
  --             delay = 100,
  --             under_cursor = true,
  --             modes_denylist = { "i" },
  --             providers = {
  --                 --[[ "lsp", ]]
  --                 "regex",
  --                 "treesitter",
  --             },
  --             filetypes_denylist = {
  --                 "NvimTree",
  --                 "aerial",
  --                 "undotree",
  --                 "spectre_panel",
  --                 "dbui",
  --                 "toggleterm",
  --                 "notify",
  --                 "startuptime",
  --                 "packer",
  --                 "mason",
  --                 "help",
  --                 "terminal",
  --                 "lspinfo",
  --                 "TelescopePrompt",
  --                 "TelescopeResults",
  --                 "",
  --             },
  --         }
  --     end,
  -- },
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    config = function()
      local nvim_tmux_nav = require "nvim-tmux-navigation"

      nvim_tmux_nav.setup {
        disable_when_zoomed = true, -- defaults to false
      }
      vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      -- vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      -- vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "custom.configs.todo-comments"
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    event = "BufRead",
    config = function()
      require "custom.configs.nvim-spectre"
    end,
  },
  {
    "cbochs/grapple.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      require("grapple").setup()
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require "custom.configs.notify"
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    lazy = false,
    config = function()
      require "custom.configs.hlslens"
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
    {
    'jvaverka/pomodoro.nvim',
    lazy = false,
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
        require('pomodoro').setup({
            time_work = 25,
            time_break_short = 5,
            time_break_long = 20,
            timers_to_long_break = 4
        })
    end
},
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
  {
    "goolord/alpha-nvim",
    enabled = false,
    event = "BufWinEnter",
    config = function()
      require "custom.configs.alpha"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "BufRead",
    config = function()
      require "custom.configs.lualine-slate"
      -- require "custom.configs.lualine-bubble"
      -- require "custom.configs.lualine"
    end,
  },
  { "hrsh7th/cmp-nvim-lsp", event = "BufRead" },
  { "hrsh7th/cmp-buffer", event = "BufRead" },
  { "hrsh7th/cmp-path", event = "BufRead" },
  { "saadparwaiz1/cmp_luasnip", event = "BufRead" },
  { "hrsh7th/cmp-nvim-lua", event = "BufRead" },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {
            max_lines = 1000,
            max_num_results = 20,
            sort = true,
            run_on_every_keystroke = true,
            snippet_placeholder = "..",
            show_prediction_strength = false,
          } -- put your options here
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },

    opts = function()
      return require "custom.configs.nvim-cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
  -- for auto close tag
  {
    "windwp/nvim-ts-autotag",
    event = "BufRead",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- key mapping
  {
    "folke/which-key.nvim",
    event = "BufRead",
    config = function()
      dofile(vim.g.base46_cache .. "whichkey")
      require "custom.configs.whichkey"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "custom.configs.lsp"
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "BufRead",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("fidget").setup {
        window = {
          blend = 0,
        },
        sources = {
          pyright = {
            ignore = true,
          },
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    event = "BufRead",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  -- for formater linter
  {
    "jayp0521/mason-null-ls.nvim",
    lazy = true,
    dependencies = "jose-elias-alvarez/null-ls.nvim",
    event = "BufRead",
    config = function()
      require "custom.configs.mason-null-ls"
    end,
  },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "mason.nvim" } },
  {
    "olimorris/persisted.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require "custom.configs.persisted"
    end,
  },
  {
    "phaazon/hop.nvim",
    lazy = true,
    cmd = { "HopWord", "HopLine", "HopChar1", "HopChar1CurrentLine" },
    event = "BufRead",
    config = function()
      require("hop").setup {
        { keys = "qwertyuiopasdfghjklzxcvbnm" },
      }
    end,
  },
  -- for live server html,css,js
  liveserver,
  -- for multi cursor select
  visualmulti,
  -- for auto detection file and run code
  coderunner,
  -- override lsp
  -- for install lsp tidak support mason
  lspinstaller,
  -- for popup input
  dressing,
  -- for resize split (CTRL + arrow)
  smartsplit,
  -- for winbar icon
  winbar,
  -- for debuging
  debug,
  -- for cmd line popup
  cmdline,
  toggleterm,
}

return plugins
