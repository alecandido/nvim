local M = {}

M.opts = {}

M.config = function(_, _)
  require("telescope").load_extension("dap")
end

M.keys = {
  {
    "<leader>dC",
    function()
      require("telescope").extensions.dap.commands({})
    end,
    desc = "View [d]ebug [c]ommands",
  },
  {
    "<leader>dB",
    function()
      require("telescope").extensions.dap.list_breakpoints({})
    end,
    desc = "View [d]ebug [b]reakpoints",
  },
  {
    "<leader>dV",
    function()
      require("telescope").extensions.dap.variables({})
    end,
    desc = "View [d]ebug [v]ariables",
  },
}

return M
