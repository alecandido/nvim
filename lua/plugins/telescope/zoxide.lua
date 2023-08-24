local M = {}

M.opts = {}

M.config = function(_, _)
  require("telescope").load_extension("zoxide")
end

M.keys = {
  {
    "<leader>cd",
    function()
      require("telescope").extensions.zoxide.list()
    end,
    desc = "[C]hange [D]irectory",
  },
}

return M
