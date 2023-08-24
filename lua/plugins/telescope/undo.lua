local M = {}

M.opts = {
  side_by_side = true,
  layout_config = {
    preview_width = 0.7,
  },
}

M.config = function(_, _)
  require("telescope").load_extension("undo")
end

M.keys = {
  {
    "<leader>fu",
    function() require("telescope").extensions.undo.undo() end,
    desc = "[F]ind [U]ndo"
  },
}

return M
