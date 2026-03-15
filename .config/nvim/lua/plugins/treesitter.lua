return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "lua",
        "markdown",
        "bash",
        "vim",
        "vimdoc",
        "yaml",
        "svelte",
        "python",
        "terraform",
      },
    })
  end,
}
