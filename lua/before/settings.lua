local opts = {
  number = true,
  relativenumber = true,
  splitbelow = true,
  splitright = true,
  termguicolors = true,
  list = true,
  listchars = "tab:-->,trail:·",
  clipboard = "unnamed",
  undofile = true,
  ignorecase = true,
  smartcase = true,
  breakindent = true,
  completeopt = "menuone,noselect",
  textwidth = 88,
  spell = true,
}

for name, value in pairs(opts) do
  vim.o[name] = value
end
