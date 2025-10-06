-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {
  base46 = {
    theme = 'tomorrow_night',
    -- transparency = true,
    -- theme = 'ayu_light'
  },

  mason = {
    pkgs= {
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
      "csharp-language-server"
    },
  },
}
-- M.ui = {
--     theme = "doomchad"
--
--     -- hl_override = {
--     -- 	Comment = { italic = true },
--     -- 	["@comment"] = { italic = true },
--     -- },
-- }

return M
