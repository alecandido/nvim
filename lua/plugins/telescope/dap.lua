local M = {}

M.opts = {}

M.config = function(_, _)
  require("telescope").load_extension("dap")
end

M.keys = {
  {
    "<leader>dc",
    function() require("telescope").extensions.dap.commands({}) end,
    desc = "[D]ebug [C]ommands"
  },
  {
    "<leader>db",
    function() require("telescope").extensions.dap.list_breakpoints({}) end,
    desc = "[D]ebug [B]reakpoints"
  },
  {
    "<leader>dv",
    function() require("telescope").extensions.dap.variables({}) end,
    desc = "[D]ebug [V]ariables"
  },
}

return M
