-- Options are automatically loaded before lazy.nvim startup

-- Disable netrw so Neo-tree is the sole file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- In SSH sessions LazyVim leaves clipboard empty; wire up OSC 52 so yanks
-- reach the local Windows clipboard through tmux → WezTerm.
if vim.env.SSH_TTY then
  vim.opt.clipboard = "unnamedplus"
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end
