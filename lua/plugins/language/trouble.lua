local M = {}

M.keys = {
  {
    "<leader>xx",
    function() require("trouble").toggle() end,
    desc = "Open troubles :[x] with troubles :[x]"
  },
  {
    "<leader>xw",
    function() require("trouble").toggle("workspace_diagnostics") end,
    desc = "Open troubles :[x] with [W]orkspace diagnostics"
  },
  {
    "<leader>xd",
    function() require("trouble").toggle("document_diagnostics") end,
    desc = "Open troubles :[x] with [D]ocument diagnostics"
  },
  {
    "<leader>xq",
    function() require("trouble").toggle("quickfix") end,
    desc = "Open troubles :[x] with [Q]uickfix"
  },
  {
    "<leader>xl",
    function() require("trouble").toggle("loclist") end,
    desc = "Open troubles :[x] with [L]oclist"
  },
  {
    "gR",
    function() require("trouble").toggle("lsp_references") end,
    desc = "Open troubles lsp references"
  },
}

return M
