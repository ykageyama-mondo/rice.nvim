return {
  -- {
  --   'catppuccin/nvim',
  --   config = function()
  --     require('catppuccin').setup {
  --       flavour = 'mocha',
  --       transparent_background = true,
  --       float = {
  --         transparent = true,
  --         solid = false,
  --       },
  --       auto_integrations = true,
  --     }
  --     vim.cmd.colorscheme 'catppuccin'
  --   end,
  -- },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        variant = 'main',
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
        highlight_groups = {
          CurSearch = { fg = 'base', bg = 'leaf', inherit = false },
          Search = { fg = 'text', bg = 'leaf', blend = 20, inherit = false },
        },
      }

      vim.cmd.colorscheme 'rose-pine'
    end,
  },
}
