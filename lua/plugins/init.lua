return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
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
      ensure_installed = {
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "prettier",
        "vue-language-server", -- c/cpp stuff
        "clangd",
        "clang-format",
        "cmake-language-server",

        "omnisharp",
      },
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
