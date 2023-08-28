local M = {}

M.config = function(_, _)
  local dap = require("dap")
  local dapui = require("dapui")

  -- ensure dapui is set up at this point
  dapui.setup({})

  dap.listeners.after.event_initialized["dapui_config"] = dapui.open
  dap.listeners.before.event_terminated["dapui_config"] = dapui.close
  dap.listeners.before.event_exited["dapui_config"] = dapui.close
end

M.keys = {
  {
    "<leader>dc",
    function()
      require("dap").continue()
    end,
    desc = "Debug: Start/Continue",
  },
  {
    "<F1>",
    function()
      require("dap").step_into()
    end,
    desc = "Debug: Step Into",
  },
  {
    "<F2>",
    function()
      require("dap").step_over()
    end,
    desc = "Debug: Step Over",
  },
  {
    "<F3>",
    function()
      require("dap").step_out()
    end,
    desc = "Debug: Step Out",
  },
  {
    "<leader>db",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "Debug: Toggle Breakpoint",
  },
  {
    "<leader>ds",
    function()
      require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end,
    desc = "Debug: Set Breakpoint",
  },
}

return M
