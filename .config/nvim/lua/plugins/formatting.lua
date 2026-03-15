return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        svelte = { "prettier" },
        lua = { "stylua" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_format = "fallback",
      },
    })
  end,
}
