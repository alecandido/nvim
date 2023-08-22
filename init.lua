-- leader and local leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- increase memory for patter matching
vim.opt.maxmempattern = 10000

-- shada:
--   * increase file tracked for markers
--   * enable file marks
--   * increase line saved per register
vim.opt.shada = "'1000,f1,<500"

-- load plugins, and options before plugins
require("before")
require("lazy-configs")
require("after")
