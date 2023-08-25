local parent = ...

require(parent .. ".edit")
require(parent .. ".map")
require(parent .. ".highlight")

vim.cmd.colorscheme("nord")
