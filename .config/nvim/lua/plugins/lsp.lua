return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "eslint", "lua_ls" },
      })

      -- Keymaps on LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gr", vim.lsp.buf.references, "References")
          map("K", vim.lsp.buf.hover, "Hover docs")
          map("<Leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<Leader>rn", vim.lsp.buf.rename, "Rename symbol")
        end,
      })

      -- LSP server configs (nvim 0.11+ built-in API)
      vim.lsp.config("ts_ls", {})
      vim.lsp.config("eslint", {})
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })
      vim.lsp.enable({ "ts_ls", "eslint", "lua_ls" })
    end,
  },
}
