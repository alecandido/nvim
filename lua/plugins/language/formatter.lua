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

M.config = function(_, opts)
  opts.filetype = {
    lua = { require("formatter.filetypes.lua").stylua },
    nix = { require("formatter.filetypes.nix").alejandra },

    ["*"] = require("formatter.filetypes.any"),
  }

  require("formatter").setup(opts)
end

M.opts = {}

M.event = "BufWritePost"

return M
