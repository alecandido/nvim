return {
  -- Keybindings
  "tpope/vim-repeat",
  "tpope/vim-rsi",
  "tpope/vim-surround",
  -- Control case
  "tpope/vim-abolish",

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- Unix
  "tpope/vim-eunuch",

  -- Git
  "tpope/vim-fugitive",
  "tpope/vim-git",

  -- Copy, cut, and paste
  "svermeulen/vim-subversive",
  "svermeulen/vim-cutlass",
  "svermeulen/vim-yoink",

  -- Comments
  {
    "numToStr/Comment.nvim",
    lazy = false,
    init = function()
      require("Comment").setup()
    end
  },
}
