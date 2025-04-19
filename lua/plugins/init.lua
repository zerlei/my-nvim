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

  {
    "rmagatti/auto-session",
    opts = {

      log_level = "error",
      auto_session_enable_last_session = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,
      session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
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
              accept = "<S-Tab>",
              accept_word = "<Tab>",
              accept_line = false,
              next = "<M-]>",
              prev = "<M-[>",
              dismiss = "<C-]>",
            },
          },
          filetypes = {
            yaml = false,
            markdown = true,
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
  },
  -- for auto comment
  {
    "danymat/neogen",
    config = true,
    lazy = false,
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
  },

  -- {
  --   "JoosepAlviste/nvim-ts-context-commentstring",
  --   lazy = false
  -- },
  -- {
  --   "numToStr/Comment.nvim",
  --   keys = {
  --     { "gcc", mode = "n", desc = "Comment toggle current line" },
  --     { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
  --     { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
  --     { "gbc", mode = "n", desc = "Comment toggle current block" },
  --     { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
  --     { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
  --   },
  --   config = function(_, _)
  --     require("Comment").setup {
  --       pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  --     }
  --   end,
  --   lazy = false
  -- },
}
