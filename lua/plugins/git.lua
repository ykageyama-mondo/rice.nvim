return {
  {
    'kdheepak/lazygit.nvim',
    lazy = false,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').load_extension 'lazygit'
      vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = 'Open Lazy Git' })
      vim.keymap.set('n', '<leader>lh', '<cmd>LazyGitFilterCurrentFile<cr>', { desc = 'Open Git history current file' })
    end,
  },
  {
    'lionyxml/gitlineage.nvim',
    dependencies = {
      'sindrets/diffview.nvim', -- optional, for open_diff feature
    },
    config = function()
      require('gitlineage').setup()
    end,
  },
}
