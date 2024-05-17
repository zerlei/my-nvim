if not vim.g.vscode then
  require "nvchad.mappings"
else
end
local map = vim.keymap.set
-- move
map("n", "J", "3j", { desc = "Jump down 3 lines", nowait = true })
map("n", "K", "3k", { desc = "Jump up 3 lines", nowait = true })
map("n", "L", "$", { desc = "Move to the line's end", nowait = true })
map("n", "H", "^", { desc = "Move to the line's begin", nowait = true })
map("n", "<leader>", "<Nop>", { desc = "Nop space " })

map("v", "J", "3j", { desc = "Jump down 3 lines", nowait = true })
map("v", "K", "3k", { desc = "Jump up 3 lines", nowait = true })
map("v", "L", "$", { desc = "Move to the line's end", nowait = true })
map("v", "H", "^", { desc = "Move to the line's begin", nowait = true })
map("x", "y", "y`>", { desc = "When yanked, move the cursor to the end of the selected text", nowait = true })
-- edit

map("n", "<C-u>", "<C-r>", { desc = "undo undo", nowait = true, silent = true })
map("n", "p", "p`]", { desc = "When pasted,move cursor to end of the yanked text", nowait = true })
map("n", "<C-v>", '"*p`]', { desc = "ctrl+v,pasted from system", nowait = true })
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })

if not vim.g.vscode then
  map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle {
      pos = "float",
      id = "floatTerm",
      float_opts = {
        relative = "editor",
        row = 0.15,
        col = 0.15,
        width = 0.7,
        height = 0.7,
      },
    }
  end, { desc = "Terminal Toggle Floating term" })

  map("n", "<leader>se", function()
    require("auto-session.session-lens").search_session()
  end, {
    noremap = true,
    nowait = true,
  })

  map("n", "<leader>sb", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
else
  local vscode = require "vscode-neovim"

  map("n", "<leader>fm", function()
    vscode.call "editor.action.formatDocument"
  end, { desc = "vscode fm", nowait = true })
  map("n", "<leader>e", function()
    vscode.call "workbench.explorer.fileView.focus"
  end, { nowait = true })
  map("n", "<leader>x", function()
    vscode.call "workbench.action.closeActiveEditor"
  end, { nowait = true })

  map("n", "<leader>/", function()
    vscode.call "editor.action.commentLine"
  end, { nowait = true })
   -- vscode left bar show or hide 
  map("n", "<leader>ab", function()
    vscode.call "workbench.action.toggleActivityBarVisibility"
  end, { nowait = true })
   -- vscode primary bar show or hide 
  map("n", "<leader>sb", function()
    vscode.call "workbench.action.toggleSidebarVisibility"
  end, { nowait = true })
  -- map("n", "<leader>x", function()
  --   vscode.call "workbench.action.closeActiveEditor"
  -- end, { nowait = true })
  -- map("n", "<leader>x", function()
  --   vscode.call "workbench.action.closeActiveEditor"
  -- end, { nowait = true })
  -- map("n", "<leader>x", function()
  --   vscode.call "workbench.action.closeActiveEditor"
  -- end, { nowait = true })
  -- map("n", "<leader>x", function()
  --   vscode.call "workbench.action.closeActiveEditor"
  -- end, { nowait = true })
  -- map("n", "<leader>x", function()
  --   vscode.call "workbench.action.closeActiveEditor"
  -- end, { nowait = true })
end
