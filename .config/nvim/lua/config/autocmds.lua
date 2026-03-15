local autocmd = vim.api.nvim_create_autocmd

-- Auto-reload files changed externally (ported from .vimrc)
autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime",
})

-- Auto-resize panes on vim resize
autocmd("VimResized", {
  command = "wincmd =",
})
