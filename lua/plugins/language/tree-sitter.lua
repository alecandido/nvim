local M = {}

local parser_path = vim.fn.stdpath("cache") .. "/tree-sitter"

M.config = function(_, opts)
  vim.opt.runtimepath:prepend(parser_path)
  require("nvim-treesitter.configs").setup(opts)
end

M.opts = {
  parser_install_dir = parser_path,

  ensure_installed = {
    "c",
    "cpp",
    "go",
    "haskell",
    "lua",
    "python",
    "rust",
    "tsx",
    "typescript",
    "vimdoc",
    "vim",
    "regex",
    "bash",
    "markdown",
    "markdown_inline",
  },

  auto_install = true,

  ignore_install = {},

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = "<C-s>",
      node_decremental = "<M-space>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["aa"] = { query = "@parameter.outer", desc = "[a]round p[a]rameter" },
        ["ia"] = { query = "@parameter.inner", desc = "[i]nnner p[a]rameter" },
        ["af"] = { query = "@function.outer", desc = "[a]round [f]unction" },
        ["if"] = { query = "@function.inner", desc = "[i]nnner [f]unction" },
        ["ac"] = { query = "@class.outer", desc = "[a]round [c]lass" },
        ["ic"] = { query = "@class.inner", desc = "[i]nnner [c]lass" },
        ["aq"] = { query = "@comment.outer", desc = "Comment (or [q]omment)" },
        ["as"] = { query = "@scope", query_group = "locals", desc = "[a]round language [s]cope" },
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
        ["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope" },
        ["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>sn"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>sp"] = "@parameter.inner",
      },
    },
  },
}

return M
