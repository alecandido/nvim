local M = {}

function M.detect(pattern, type)
  local opts = {
    pattern = pattern,
    callback = function()
      vim.bo.filetype = type
    end,
  }
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, opts)
end

return M
