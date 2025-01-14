return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    local git_blame = require 'gitblame'

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
          {
            function()
              local dir = vim.fn.fnamemodify(vim.fn.expand '%:p:h', ':t')
              local file = vim.fn.expand '%:t'
              return dir .. '/' .. file
            end,
            -- icon = '', -- Ícone opcional para representar o diretório/arquivo
          },
        },
        lualine_x = {
          { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    }
  end,
}
