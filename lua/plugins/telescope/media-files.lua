local M = {}

M.opts = {}

M.init = function()
  require('telescope').load_extension('media_files')
end

return M
