local M = {}

M.init = function()
  vim.o.foldcolumn = "0"
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
      require("ufo").closeAllFolds()
    end,
    desc = "Close all folds",
  },
  {
    "zr",
    function()
      require("ufo").openFoldsExceptKinds()
    end,
    desc = "Close all folds",
  },
  {
    "zm",
    function()
      require("ufo").closeFoldsWith()
    end,
    desc = "Close all folds",
  },
}

return M
