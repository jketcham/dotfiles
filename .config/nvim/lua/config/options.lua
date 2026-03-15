-- Options ported from .vimrc + modern additions

vim.opt.cursorline = true
vim.opt.modeline = false

-- Persistent undo
vim.opt.undofile = true

-- No backup/swap (same as .vimrc)
vim.opt.backup = false
vim.opt.swapfile = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- File handling
vim.opt.autowrite = true
vim.opt.wildignore:append({ "*.pyc", "*.dat", "*.DS_Store" })

-- Performance
vim.opt.updatetime = 250

-- UI
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100"
vim.opt.scrolloff = 8
vim.opt.wrap = true
vim.opt.laststatus = 3

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Clipboard (system clipboard for all yank/paste)
vim.opt.clipboard = "unnamedplus"

-- Shell
if vim.fn.executable("zsh") == 1 then
  vim.opt.shell = "zsh"
end
