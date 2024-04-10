if not vim.g.vscode then
  require "nvchad.options"
else
end

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
vim.opt.backupcopy = "yes"
