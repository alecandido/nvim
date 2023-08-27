local M = {}

M.init = function()
  local gid = vim.api.nvim_create_augroup("FormatAutogroup", {})
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = gid,
    pattern = "*",
    command = "FormatWrite",
    desc = "Format on save, using 'formatter.nvim'",
  })
end

local function fnlfmt()
  return {
    exe = "fnlfmt",
    stdin = true,
    args = {},
  }
end

M.config = function(_, opts)
  opts.filetype = {
    c = { require("formatter.filetypes.c").uncrustify },
    cpp = { require("formatter.filetypes.cpp").uncrustify },
    css = { require("formatter.filetypes.css").prettier },
    fennel = { fnlfmt },
    go = {
      require("formatter.filetypes.go").gofmt,
      require("formatter.filetypes.go").goimports,
    },
    graphql = { require("formatter.filetypes.graphql").prettier },
    haskell = { require("formatter.filetypes.haskell").stylish_haskell },
    html = { require("formatter.filetypes.html").prettier },
    javascript = { require("formatter.filetypes.javascript").prettier },
    javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
    json = { require("formatter.filetypes.json").prettier },
    kotlin = { require("formatter.filetypes.kotlin").ktlint },
    lua = { require("formatter.filetypes.lua").stylua },
    markdown = { require("formatter.filetypes.markdown").prettier },
    nix = { require("formatter.filetypes.nix").alejandra },
    python = {
      require("formatter.filetypes.python").black,
      require("formatter.filetypes.python").isort,
      require("formatter.filetypes.python").docformatter,
    },
    rust = { require("formatter.filetypes.rust").rustfmt },
    sh = { require("formatter.filetypes.sh").shfmt },
    sql = { require("formatter.filetypes.sql").pgformat },
    svelte = { require("formatter.filetypes.svelte").prettier },
    toml = { require("formatter.filetypes.toml").taplo },
    typescript = { require("formatter.filetypes.typescript").prettier },
    typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
    vue = { require("formatter.filetypes.vue").prettier },
    yaml = { require("formatter.filetypes.yaml").prettier },

    ["*"] = require("formatter.filetypes.any"),
  }

  require("formatter").setup(opts)
end

M.opts = {}

M.cmd = { "Format", "FormatWrite" }

M.event = "BufWritePost"

return M
