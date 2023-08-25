local M = {}

M.init = function()
  vim.o.foldcolumn = "1"
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
end

M.opts = {
  provider_selector = function(_, _, _)
    return { "treesitter", "indent" }
  end,
}

M.keys = {
  {
    "zR",
    function()
      require("ufo").openAllFolds()
    end,
    desc = "Open all folds",
  },
  {
    "zM",
    function()
      require("ufo").openAllFolds()
    end,
    desc = "Close all folds",
  },
}

return M
