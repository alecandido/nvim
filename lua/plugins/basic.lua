return {
	-- Keybindings
	"tpope/vim-repeat",
	"tpope/vim-rsi",
	"tpope/vim-surround",
	-- Control case
	"tpope/vim-abolish",

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

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

	-- Unix
	"tpope/vim-eunuch",

	-- Git
	"tpope/vim-fugitive",
	"tpope/vim-git",

	-- GitHub
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		cmd = "Octo",
	}
}
