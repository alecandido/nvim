local function nmap(...)
  vim.keymap.set("n", ...)
end

-- Broader movements
local big_steps = {
  { 'H', '^' },
  { 'L', '$' },
  { 'K', 'H' },
  { 'J', 'L' },
  { '^', 'K' },
  { '$', 'J' },
}

for _, map in ipairs(big_steps) do
  vim.keymap.set('', map[1], map[2])
end

-- Insert new lines
nmap('o', 'o<Esc>')
nmap('O', 'O<Esc>')
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Jump in windows
for _, c in ipairs({ 'h', 'j', 'k', 'l' }) do
  nmap(string.format('<C-%s>', c), string.format('<C-w>%s', c))
end

-- Increment & decrement
nmap('<A-a>', '<C-a>')
nmap('<A-x>', '<C-x>')

-- Escape in terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Disable space, keep for leader
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Diagnostic keymaps
nmap('[d', vim.diagnostic.goto_next, { desc = 'Previous [D]iagnostic' })
nmap(']d', vim.diagnostic.goto_prev, { desc = 'Next [D]iagnostic' })
