local gid = vim.api.nvim_create_augroup("nord-theme-overrides", {})

local polar_night = { "#2e3440", "#3b4252", "#434c5e", "#4c566a" }
local aurora = { "#bf616a", "#d08770", "#ebcb8b", "#a3be8c", "#b48ead" }

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "nord",
  group = gid,
  callback = function(_)
    vim.api.nvim_set_hl(0, "Normal", {})
    -- Swap foreground and background color
    vim.api.nvim_set_hl(0, "Visual", { reverse = true })
    vim.api.nvim_set_hl(0, "Folded", { italic = true })
    -- Low contrast for auxiliar elements
    vim.api.nvim_set_hl(0, "NonText", { fg = polar_night[3] })
    vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = polar_night[4] })
    vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = aurora[2] })
    -- Set various backgrounds to default
    vim.api.nvim_set_hl(0, "FoldColumn", {})
    vim.api.nvim_set_hl(0, "VertColumn", {})
    vim.api.nvim_set_hl(0, "SignColumn", {})
  end,
})

-- configure: https://www.nordtheme.com/docs/ports/vim/configuration
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_uniform_diff_background = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1
