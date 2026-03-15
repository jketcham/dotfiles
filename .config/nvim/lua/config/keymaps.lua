local map = vim.keymap.set

-- Buffer navigation
map("n", "<Leader>n", ":bn<CR>", { desc = "Next buffer" })
map("n", "<Leader>p", ":bp<CR>", { desc = "Previous buffer" })
map("n", "<Leader>d", ":bd!<CR>", { desc = "Delete buffer" })

-- Save with Ctrl+S (normal, visual, insert)
map("n", "<C-s>", ":wa<CR>", { desc = "Save all" })
map("v", "<C-s>", "<Esc><C-s>gv", { desc = "Save all" })
map("i", "<C-s>", "<Esc>:wa<CR>", { desc = "Save all" })

-- Center screen on search navigation
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Resize panes
map("n", "-", ":resize -5<CR>", { desc = "Decrease height" })
map("n", "+", ":resize +5<CR>", { desc = "Increase height" })

-- Diagnostic navigation (replaces ALE [a / ]a)
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<Leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
