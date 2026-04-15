return {
  {
    'sindrets/diffview.nvim',
    config = function()
      vim.keymap.set('n', '<leader>gg', function()
        diffviewlib = require 'diffview.lib'
        view = diffviewlib.get_current_view()

        if view == null then
          vim.cmd 'DiffviewOpen'
        else
          vim.cmd 'DiffviewClose'
        end
      end, { desc = 'Toggle git diff view' })
    end,
  },
}
