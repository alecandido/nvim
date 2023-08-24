-- Fuzzy Finder (files, lsp, etc)

local parent = ...

local telescope = require(parent .. ".builtin")
local fzf = require(parent .. ".fzf")
local undo = require(parent .. ".undo")
local media_files = require(parent .. ".media-files")

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = telescope.keys,
    config = telescope.config,
    opts = telescope.merge(telescope.opts, {
      fzf = fzf.opts,
      undo = undo.opts,
      media_files = media_files.opts,
    }),
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = fzf.build,
    cond = fzf.cond,
    init = fzf.init,
  },

  {
    "debugloop/telescope-undo.nvim",
    init = undo.init,
  },

  {
    "nvim-telescope/telescope-media-files.nvim",
    init = media_files.init,
  }
}
