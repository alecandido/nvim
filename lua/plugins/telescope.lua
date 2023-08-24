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

      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = fzf.build,
        cond = fzf.cond,
        config = fzf.config,
      },
    },
    config = telescope.config,
    opts = telescope.merge(telescope.opts, {
      fzf = fzf.opts,
      undo = undo.opts,
      media_files = media_files.opts,
    }),
    cmd = telescope.cmd,
    keys = telescope.keys,
  },

  {
    "debugloop/telescope-undo.nvim",
    config = undo.config,
    keys = undo.keys,
  },

  {
    "nvim-telescope/telescope-media-files.nvim",
    config = media_files.config,
    event = media_files.event,
  }
}
