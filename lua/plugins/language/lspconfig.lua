local M = {}

M.opts = {
  servers = {
    bashls = {},
    cssls = {},
    fortls = {},
    golangci_lint_ls = {},
    gopls = {},
    hls = { filetypes = { "haskell", "lhaskell", "cabal" } },
    ltex = { settings = { ltex = { language = "en-US" } } },
    lua_ls = {},
    metals = {},
    nil_ls = {},
    pyright = {},
    rome = {},
    ruff_lsp = {},
    rust_analyzer = {},
    sqls = {},
    svelte = {},
    taplo = {},
    texlab = {},
    tsserver = {},
    verible = {},
    vhdl_ls = {},
    yamlls = {
      settings = {
        yaml = {
          schemas = {
            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          },
        },
      },
    },
  },
}
local noformat = { "lua_ls" }

--  This function gets run when an LSP connects to a particular buffer.
local function on_attach(client, bufnr)
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
  if
    not vim.tbl_contains(noformat, client.name)
    and client.supports_method("textDocument/formatting")
  then
    require("lsp-format").on_attach(client)
  end
end

function M.config(_, opts)
  -- ensure neodev is set up before
  require("neodev").setup({})

  local lspconfig = require("lspconfig")
  local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

  for server_name, configs in pairs(opts.servers) do
    lspconfig[server_name].setup(vim.tbl_deep_extend("keep", configs, {
      capabilities = lsp_capabilities,
      on_attach = on_attach,
    }))
  end
end

return M
