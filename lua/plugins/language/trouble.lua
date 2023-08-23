local M = {}

M.keys = {
  {
    "<leader>xx",
    function() require("trouble").toggle() end,
    desc = "Toggle troubles :[x] window :[x]"
  },
  {
    "<leader>xw",
    function() require("trouble").open("workspace_diagnostics") end,
    desc = "Open troubles :[x] with [W]orkspace diagnostics"
  },
  {
    "<leader>xd",
    function() require("trouble").open("document_diagnostics") end,
    desc = "Open troubles :[x] with [D]ocument diagnostics"
  },
  {
    "<leader>xq",
    function() require("trouble").open("quickfix") end,
    desc = "Open troubles :[x] with [Q]uickfix"
  },
  {
    "<leader>xl",
    function() require("trouble").open("loclist") end,
    desc = "Open troubles :[x] with [L]oclist"
  },
  {
    "gR",
    function() require("trouble").open("lsp_references") end,
    desc = "Open troubles lsp references"
  },
}

return M
