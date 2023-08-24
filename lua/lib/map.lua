local M = {}

function M.map(mode, keys, func, opts)
  if opts.desc and opts.prefix then
    opts.desc = opts.prefix .. opts.desc
    opts.prefix = nil
  end

  vim.keymap.set(mode, keys, func, opts)
end

function M.nmap(...)
  M.map("n", ...)
end

return M
