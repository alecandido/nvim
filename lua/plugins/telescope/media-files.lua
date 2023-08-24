local M = {}

M.opts = {}

M.config = function(_, _)
  require("telescope").load_extension("media_files")
end

M.event = "User TelescopeFindPre"

return M
