-- vim-cutlass
vim.keymap.set("n", "x", "d")
vim.keymap.set("n", "xx", "dd")
vim.keymap.set("n", "X", "D")

vim.keymap.set("x", "x", "d")

vim.keymap.set("", "<C-x>", "d")
vim.keymap.set("n", "<C-x>", "x")

-- vim-subversive
-- s for substitute
vim.keymap.set("n", "s", "<plug>(SubversiveSubstitute)", { remap = true })
vim.keymap.set("n", "ss", "<plug>(SubversiveSubstituteLine)", { remap = true })
vim.keymap.set("n", "S", "<plug>(SubversiveSubstituteToEndOfLine)", { remap = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
