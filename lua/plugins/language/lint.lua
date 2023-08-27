local M = {}

M.config = function(_, opts)
  require("lint").linters_by_ft = opts
end

M.opts = {
  c = { "cppcheck" },
  cpp = { "cppcheck" },
  css = { "stylelint" },
  fennel = { "fennel" },
  gh_workflows = { "actionlint" },
  go = { "revive" },
  javascript = { "eslint" },
  json = { "jsonlint" },
  lua = { "selene" },
  markdown = { "vale" },
  nix = { "nix" },
  python = { "pydocstyle" },
  rst = { "vale" },
  sql = { "sqlfluff" },
  tex = { "lacheck" },
  text = { "vale" },
  verilog = { "verilator" },
  yaml = { "yamllint" },
}

M.init = function()
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      require("lint").try_lint()
    end,
  })
end

M.event = "BufWritePost"

return M
