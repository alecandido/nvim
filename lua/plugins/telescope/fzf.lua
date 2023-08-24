local M = {}

M.build = "make"

M.cond = function()
  return vim.fn.executable "make" == 1
end

M.opts = {}

M.config = function(_, _)
  require("telescope").load_extension("fzf")
end

return M
