local M = {}

M.opts = {
  servers = { "nil_ls", "lua_ls", "tsserver", "eslint", "pyright" },
}

--  This function gets run when an LSP connects to a particular buffer.
local function on_attach(_, bufnr)
  local maplib = require("lib.map")

  local function nmap(keys, func, desc)
    maplib.nmap(keys, func, { buffer = bufnr, desc = desc, prefix = "LSP: " })
  end

  -- See `:help K` for why this keymap
  nmap("<A-k>", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<A-K>", vim.lsp.buf.signature_help, "Signature Documentation")

  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  nmap("<leader>td", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap(
    "<leader>ws",
    require("telescope.builtin").lsp_dynamic_workspace_symbols,
    "[W]orkspace [S]ymbols"
  )

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")

  -- Format on save
  -- if client.supports_method("textDocument/formatting") then
  --   -- TODO: it might get in conflict with other formatters, which are usually
  --   -- better, for the time being let's avoid
  --   -- for debugging: it happened with lua, stylua + lua-language-server, that they
  --   -- were going in loop on save
  --
  --   require("lsp-format").on_attach(client)
  -- end
end

local function nvim_lua_config()
  local lspconfig = require("lspconfig")

  local runtime_path = vim.split(package.path, ";")
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        -- Disable telemetry
        telemetry = { enable = false },
        runtime = {
          -- Tell the language server which version of Lua you're using
          -- (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            -- Make the server aware of Neovim runtime files
            vim.fn.expand("$VIMRUNTIME/lua"),
            vim.fn.stdpath("config") .. "/lua",
          },
        },
      },
    },
  })
end

function M.config(_, opts)
  local lspconfig = require("lspconfig")
  local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- lsp.setup_servers(opts.servers)
  -- lsp.on_attach(on_attach)
  for _, server_name in ipairs(opts.servers) do
    lspconfig[server_name].setup({
      capabilities = lsp_capabilities,
      on_attach = on_attach,
    })
  end

  -- Configure language servers
  nvim_lua_config()
end

return M
