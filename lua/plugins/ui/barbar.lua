local M = {}

M.keys = {
  { '<A-,>', '<Cmd>BufferPrevious<CR>' },
  { '<A-.>', '<Cmd>BufferNext<CR>' },
  { '<A-<>', '<Cmd>BufferMovePrevious<CR>' },
  { '<A->>', '<Cmd>BufferMoveNext<CR>' },
  { '<A-1>', '<Cmd>BufferGoto 1<CR>' },
  { '<A-2>', '<Cmd>BufferGoto 2<CR>' },
  { '<A-3>', '<Cmd>BufferGoto 3<CR>' },
  { '<A-4>', '<Cmd>BufferGoto 4<CR>' },
  { '<A-0>', '<Cmd>BufferLast<CR>' },
  { '<A-w>', '<Cmd>BufferClose<CR>' },
  { '<A-p>', '<Cmd>BufferPick<CR>' },
}

M.event = { "BufAdd" }

return M
