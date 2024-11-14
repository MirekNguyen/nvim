return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  ft = { 'sql', 'dbout' },
  opts = {
    sections = {
    lualine_c = {
      {
        function()
          return vim.fn['db_ui#statusline']({
            prefix = "DB: ",
            separator = " - ",
            show = {"db_name", "table", "schema"}
          })
        end,
        cond = function()
          return vim.bo.filetype == 'sql' or vim.bo.filetype == 'dbout'
        end
      }
    }
  }
  },
}
