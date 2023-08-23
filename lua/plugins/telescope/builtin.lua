local M = {}

M.keys = {
  {
    "<leader>ff",
    function() require('telescope.builtin').find_files() end,
    desc = "[F]ind [F]iles"
  },
  {
    "<leader>fg",
    function() require('telescope.builtin').live_grep() end,
    desc = "[F]ind [G]rep results"
  },
  {
    "<leader>fb",
    function() require('telescope.builtin').buffers() end,
    desc = "[F]ind open [B]uffer"
  },
  {
    "<leader>fh",
    function() require('telescope.builtin').help_tags() end,
    desc = "[F]ind [H]elp tags"
  },
  {
    "<leader>fs",
    function() require('telescope.builtin').git_status() end,
    desc = "[F]ind git [S]tatus"
  },
}

return M
