local M = {}

M.opts = {
  background_colour = "#000000",
  fps = 1,
  render = "compact",
}

M.keys = {
  {
    "<leader>nd",
    function()
      require("notify").dismiss()
    end,
    desc = "[N]otifications [D]ismiss",
  },
}

return M
