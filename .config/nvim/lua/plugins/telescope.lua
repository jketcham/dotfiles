return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
      },
    })
    telescope.load_extension("fzf")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "Live grep (project search)" })
    vim.keymap.set("n", "<Leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<Leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
    vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "Help tags" })
  end,
}
