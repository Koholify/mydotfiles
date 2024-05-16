require("mason").setup()
require("mason-lspconfig").setup()

-- *:h mason-lspconfig-automatic-server-setup*
require("mason-lspconfig").setup_handlers {
  function (server)
    local settings = {}
    if server == "lua_ls" then
      settings.Lua = require("lsp.settings.luals").settings.Lua
    end

    local handler = require("lsp.handlers");
    require("lspconfig")[server].setup {
      capabilities = handler.capabilities,
      on_attach = handler.on_attach,
      settings = settings,
    }
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
}
