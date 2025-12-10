local map = vim.keymap.set

map('n', '<Esc>', function()
  vim.cmd 'nohlsearch'
  local inactive_floating_wins = vim.fn.filter(vim.api.nvim_list_wins(), function(_, v)
    return vim.api.nvim_win_get_config(v).relative ~= '' and v ~= vim.api.nvim_get_current_win()
  end)
  for _, w in ipairs(inactive_floating_wins) do
    pcall(vim.api.nvim_win_close, w, false)
  end
end)
map('n', '<leader>tr', '<cmd>set rnu!<CR>', { desc = 'Toggle relative line number' })

-- Exec lua
map('v', '<leader>x', ':lua<CR>', { desc = 'Execute selected lua' })
map('n', '<leader>xx', ':luafile %<CR>', { desc = 'Execute current luafile' })

-- nvim-tree
map('n', '\\', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })
map('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'nvimtree focus window' })

-- Terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
