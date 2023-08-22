local M = {}

M.keys = {
  {"<leader>xx", function() require("trouble").open() end },
  {"<leader>xw", function() require("trouble").open("workspace_diagnostics") end },
  {"<leader>xd", function() require("trouble").open("document_diagnostics") end },
  {"<leader>xq", function() require("trouble").open("quickfix") end },
  {"<leader>xl", function() require("trouble").open("loclist") end },
  {"gR", function() require("trouble").open("lsp_references") end },
}

return M
