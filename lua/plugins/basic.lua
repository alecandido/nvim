return {
	-- Keybindings
	"tpope/vim-repeat",
	"tpope/vim-rsi",

	-- Substitute
	"tpope/vim-surround",
	"svermeulen/vim-subversive",
	-- Control case
	"tpope/vim-abolish",
	-- Copy, cut, and paste
	"svermeulen/vim-cutlass",

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

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
		config = true,
		cmd = "Octo",
	}
}
