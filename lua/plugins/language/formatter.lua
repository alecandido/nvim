local M = {}

M.init = function()
  local gid = vim.api.nvim_create_augroup("FormatAutogroup", {})
  vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
      group = gid,
      pattern = "*",
      command = "FormatWrite",
      desc = "Format on save, using 'formatter.nvim'"
    }
  )
end

M.opts = {
  filetype = {
    lua = {
      function()
        return require("formatter.filetypes.lua").stylua()
      end,
    },

    ["*"] = {
      function()
        return require("formatter.filetypes.any").remove_trailing_whitespace()
      end,
    },
  },
}

M.event = "BufWritePost"

return M
