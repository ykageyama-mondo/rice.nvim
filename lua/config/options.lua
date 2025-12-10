-- Globals
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Gutter
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = false
vim.o.signcolumn = 'yes'

-- UI
vim.opt.termguicolors = true
vim.o.showmode = false

-- Behaviour
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.undofile = true
vim.o.backup = false
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.mouse = 'a'
vim.o.confirm = true

-- Identation
vim.o.breakindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = 'split'

-- Window
vim.o.splitright = true
vim.o.splitbelow = true

-- Editor
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.cursorline = true
vim.o.cursorlineopt = 'both'
vim.o.scrolloff = 15
vim.opt.whichwrap:append '<>[]hl'
