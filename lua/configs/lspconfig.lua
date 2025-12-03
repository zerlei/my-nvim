require("nvchad.configs.lspconfig").defaults()

local servers = { "lua_ls", "html", "cssls", "clangd", "cmake","csharp_ls","nil_ls" }
vim.lsp.enable(servers)
