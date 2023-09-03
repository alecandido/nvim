local M = {}

local function get_cur_file_extension(bufnr)
  bufnr = bufnr or 0
  return "." .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":e")
end

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
  python = { "ruff", "pydocstyle" },
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

  local vale = require("lint.linters.vale")
  vale.args = {
    "--no-exit",
    "--output",
    "JSON",
    "--ext",
    get_cur_file_extension,
    "--config",
    os.getenv("XDG_CONFIG_HOME") .. "/vale/vale.ini",
  }
end

M.event = "BufWritePost"

return M
