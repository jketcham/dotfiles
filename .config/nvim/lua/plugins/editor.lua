return {
  -- Tmux + neovim pane navigation (C-h/j/k/l)
  { "christoomey/vim-tmux-navigator" },

  -- Git commands (:Git, :Gblame, etc.)
  { "tpope/vim-fugitive" },

  -- File browser (press - to open, like vim-vinegar)
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        keymaps = {
          ["<C-p>"] = false,
        },
      })
      vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open file browser" })
      vim.api.nvim_create_user_command("Ex", "Oil", {})
    end,
  },
}
