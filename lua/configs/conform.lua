local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    typescript = { "prettier" },
    javascript = { "prettier" },
    css = { "prettier" },
    vue = { "prettier" },
    html = { "prettier" },
    sh = { "shfmt" },
    cpp = { "clang_format" },
    cmake = { "cmake_format" },
    nix = {"nixfmt"},
    -- css = { "prettier" },
    -- html = { "prettier" },
  },
  -- formatters = {
  --   csharp = {
  --     command = "dotnet csharpier"
  --   }
  -- }

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
