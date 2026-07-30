return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = {
          c = true,
          cpp = true,
          javascript = true,
          typescript = true,
          typescriptreact = true,
          javapscriptreact = true,
        }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        zig = { 'zigfmt' },
        cucumber = { 'reformat-gherkin' },
      },
    },
  },

  {
    'folke/trouble.nvim',
    opts = {
      focus = true,
      warn_no_results = false,
      modes = {
        cascade = {
          mode = 'diagnostics', -- inherit from diagnostics mode
          filter = function(items)
            local severity = vim.diagnostic.severity.HINT
            for _, item in ipairs(items) do
              severity = math.min(severity, item.severity)
            end
            return vim.tbl_filter(function(item)
              return item.severity == severity
            end, items)
          end,
        },
      },
    },
    keys = {
      {
        '<leader>q',
        function()
          require('trouble').toggle 'cascade'
        end,
        desc = 'Diagnostics (Trouble cascade mode)',
      },
    },
  },

  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'folke/lazydev.nvim',
      -- 'fang2hou/blink-copilot',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      appearance = {
        nerd_font_variant = 'mono',
      },
      sources = {
        default = {
          'lsp',
          'path',
          'snippets',
          -- 'copilot',
        },
        per_filetype = {
          lua = { inherit_defaults = true, 'lazydev' },
        },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          -- copilot = {
          --   name = 'copilot',
          --   module = 'blink-copilot',
          --   score_offset = 100,
          --   async = true,
          -- },
        },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = { enabled = true },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 1000,
        },
      },
    },
  },

  {
    'brenoprata10/nvim-highlight-colors',
    event = 'BufReadPre',
    opts = {
      render = 'background',
      enable_hex = true,
      enable_short_hex = true,
      enable_rgb = true,
      enable_hsl = true,
      enable_hsl_without_function = true,
      enable_ansi = true,
      enable_var_usage = true,
      enable_tailwind = true,
    },
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  {
    'windwp/nvim-ts-autotag',
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
      }
    end,
  },

  'pteroctopus/faster.nvim',
  {
    'kevinhwang91/nvim-bqf',
    dependencies = {
      'junegunn/fzf',
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
