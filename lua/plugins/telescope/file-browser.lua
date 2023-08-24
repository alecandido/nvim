local M = {}

M.opts = {}

M.config = function(_, _)
  require("telescope").load_extension("file_browser")
end

M.keys = {
  {
    "<leader>fb",
    function()
      require("telescope").extensions.file_browser.file_browser()
    end,
    desc = "[F]ile [B]rowser",
  },
}

return M
