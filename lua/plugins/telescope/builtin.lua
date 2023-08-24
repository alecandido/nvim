local M = {}

M.opts = {}

M.merge = function(opts, ...)
  opts.extensions = { ... }
  return opts
end

M.config = function(_, opts)
  require("telescope").setup(opts)
end

M.cmd = "Telescope"

M.keys = {
  {
    "<leader>f<space>",
    function()
      require("telescope.builtin").builtin()
    end,
    desc = "[F]ind[ ]a telescope",
  },
  {
    "<leader>ff",
    function()
      require("telescope.builtin").find_files()
    end,
    desc = "[F]ind [F]iles",
  },
  {
    "<leader>fr",
    function()
      require("telescope.builtin").buffers()
    end,
    desc = "[F]ind open buffe[R]",
  },
  {
    "<leader>gs",
    function()
      require("telescope.builtin").git_status()
    end,
    desc = "Find [G]it [S]tatus",
  },
  {
    "<leader>gf",
    function()
      require("telescope.builtin").git_files()
    end,
    desc = "Find [G}it [F]iles",
  },
  {
    "<leader>fg",
    function()
      require("telescope.builtin").live_grep()
    end,
    desc = "[F]ind [G]rep results",
  },
  {
    "<leader>fw",
    function()
      require("telescope.builtin").grep_string()
    end,
    desc = "[F]ind current [W]ord",
  },
  {
    "<leader>fd",
    function()
      require("telescope.builtin").diagnostics()
    end,
    desc = "[F]ind [D]iagnostics",
  },
  {
    "<leader>fh",
    function()
      require("telescope.builtin").help_tags()
    end,
    desc = "[F]ind [H]elp tags",
  },
}

return M
