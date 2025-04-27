return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require "configs.cmp"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      -- available_servers = {
      --   "clangd",
      --   "clang-format",
      --   "cmake-language-server",
      --   "cmakelang",
      --   "css-lsp",
      --   "html-lsp",
      --   "lua-language-server",
      --   "vue-language-server",
      --   "stylua",
      --   "prettier",
      --   "shfmt",
      --   "typescript-language-server",
      --   "stylua",
      -- }
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "cpp",
        "markdown",
        "markdown_inline",
        "cmake",
        "vue",
        "c_sharp",
        "doxygen",
        "nix",
      },
    },
  },

  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  --   config = function() end,
  --   opts = {},
  -- },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    -- enabled = false,
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        --
        panel = {
          enabled = false,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right | horizontal | vertical
            ratio = 0.4,
          },
        },
        suggestion = { -- Completion options for copilot
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<A-Tab>",
            accept_word = "<S-Tab>",
            --  --I dot't kown why <C-Tab> not work --> see your blog on zerlei.cn
            accept_line = "<Right>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        logger = {
          file = vim.fn.stdpath "log" .. "/copilot-lua.log",
          file_log_level = vim.log.levels.OFF,
          print_log_level = vim.log.levels.WARN,
          trace_lsp = "off", -- "off" | "messages" | "verbose"
          trace_lsp_progress = false,
          log_lsp_messages = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 18.x
        workspace_folders = {},
        copilot_model = "", -- Current LSP default is gpt-35-turbo, supports gpt-4o-copilot
        server_opts_overrides = {},
      }
    end,
  },
  -- for auto comment
  {
    "danymat/neogen",
    config = true,
    keys = {

      {
        "<c-_>",
        function()
          require("neogen").generate()
        end,
        mode = { "n", "i" },
        desc = "neogen comments ",
      },
      {
        "<c-/>",
        function()
          require("neogen").generate()
        end,
        mode = { "n", "i" },
        desc = "neogen comments ",
      },
    },
    -- lazy = false,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  { "nvim-tree/nvim-web-devicons", opts = {} },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>tt",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>tl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "nvim-pack/nvim-spectre",
    keys = {
      {
        "<leader>ss",
        '<cmd>lua require("spectre").toggle()<CR>',
        mode = { "n", "v" },
        desc = "Toggle spectre",
      },
      {
        "<leader>ws",
        function()
          require("spectre").open_visual { select_word = true }
        end,
        mode = { "n", "v" },
        desc = "Search current word on all files",
      },
      {
        "<leader>cs",
        function()
          require("spectre").open_visual { select_word = true }
        end,
        mode = { "n", "v" },
        desc = "Search current word on current files",
      },
    },
    config = function()
      require("spectre").setup {
        mapping = {
          ["run_replace"] = {
            map = "<leader>rr",
            cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
            desc = "replace all",
          },
        },
      }
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local o = require "nvchad.configs.nvimtree"
      o.filters = { enable = false }
      return o
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    keys = {
      {
        "<leader>mm",
        "<cmd>Telescope marks<cr>",
        desc = "Telescope marks",
      },
    },
    opts = function()
      return require "nvchad.configs.telescope"
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {}
    end,
    event = "LspAttach",
    keys = {
      {
        "gr",
        "<cmd>Lspsaga finder<cr>",
        desc = "LSP References (LspSaga)",
      },
      {
        "<leader>ra",
        "<cmd>Lspsaga rename<cr>",
        desc = "LSP Rename(LspSaga)",
      },
      {
        "<leader>ca",
        "<cmd>Lspsaga code_action<cr>",
        desc = "LSP code_action(LspSaga)",
      },
      {
        "<leader>ci",
        "<cmd>Lspsaga incoming_calls<cr>",
        desc = "LSP callhierarchy in(LspSaga)",
      },
      {
        "<leader>co",
        "<cmd>Lspsaga outgoing_calls<cr>",
        desc = "LSP callhierarchy out(LspSaga)",
      },
      {
        "<leader>ou",
        "<cmd>Lspsaga outline<cr>",
        desc = "LSP outline(LspSaga)",
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "Wansmer/symbol-usage.nvim",
    event = "BufReadPre",
    config = function()
      require "configs.symbolusage"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        mode = { "n", "v" },
        desc = "Continue Debugging",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        mode = { "n", "v" },
        desc = "Step Over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        mode = { "n", "v" },
        desc = "Step Into",
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
        mode = { "n", "v" },
        desc = "Step Out",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        mode = { "n", "v" },
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").clear_breakpoints()
        end,
        mode = { "n", "v" },
        desc = "Clear Breakpoints",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.open()
        end,
        mode = { "n", "v" },
        desc = "Open REPL",
      },
    },
    config = function()
      local dap = require "dap"
      -- set dap sign_define
      vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    event = "VeryLazy",
    config = function()
      require("dapui").setup()
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.before.attach.dapui_config = function()
        print "attach"
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        print "attach"
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
