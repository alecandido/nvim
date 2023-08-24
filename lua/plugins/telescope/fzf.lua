local M = {}

M.build = "make"

M.cond = function()
  return vim.fn.executable "make" == 1
end

M.opts = {}

M.init = function()
  require("telescope").load_extension("fzf")
end

return M
