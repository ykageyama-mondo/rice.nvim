return {
  {
    'catppuccin/nvim',
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = true,
        float = {
          transparent = true,
          solid = false,
        },
        auto_integrations = true,
      }
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
