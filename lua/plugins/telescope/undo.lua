local M = {}

M.opts = {
  side_by_side = true,
  layout_config = {
    preview_width = 0.7,
  },
}

M.init = function()
  require("telescope").load_extension("undo")
end

return M
