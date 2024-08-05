local lualine = require('lualine')

-- Function to hide lualine
local function hide_lualine()
  lualine.setup({
    options = {
      theme = 'tokyonight',
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      disabled_filetypes = { 'dashboard' },
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {},
    inactive_sections = {},
    tabline = {},
    extensions = {},
  })
end

-- Function to show lualine
local function show_lualine()
  lualine.setup({
    options = {
      theme = 'tokyonight',
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      disabled_filetypes = { 'neo-tree', 'dashboard', 'packer' },
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        { 
          'mode', 
          fmt = function(mode)
            local modes = {
              ['n'] = 'NORMAL',
              ['i'] = 'INSERT',
              ['v'] = 'VISUAL',
              ['V'] = 'V-LINE',
              [''] = 'V-BLOCK',
              ['c'] = 'COMMAND',
              ['R'] = 'REPLACE',
              ['Rv'] = 'V-REPLACE',
              ['s'] = 'SELECT',
              ['S'] = 'S-LINE',
              [''] = 'S-BLOCK',
              ['t'] = 'TERMINAL',
            }
            return modes[mode] or mode
          end,
          icon = '',
        },
      },
      lualine_b = {
        'branch',
        { 'diff', symbols = { added = ' ', modified = '柳 ', removed = ' ' } },
        { 'diagnostics', sources = { 'nvim_lsp', 'nvim_diagnostic' }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
      },
      lualine_c = {
        { 'filename', file_status = true, path = 1 },
        { 'filesize', icon = ' ' },
        { 'fileformat', icons_enabled = true },
        { 'encoding', icons_enabled = true },
        'filetype',
      },
      lualine_x = {
        { 'progress', color = { fg = '#9ece6a', gui = 'bold' } },
        { 'location', color = { fg = '#9ece6a', gui = 'bold' } },
        { 'location', fmt = function(str) return 'Ln ' .. str end },
        { 'searchcount', fmt = function(str) return 'SC: ' .. str end },
      },
      lualine_y = {
        { 'filetype', colored = true },
        'fileformat',
        'encoding',
        { 'progress', fmt = function(str) return 'Progress: ' .. str end },
      },
      lualine_z = {
        'branch',
        { 'hostname', fmt = function(host) return 'Host: ' .. host end },
        { 'time', fmt = function() return os.date('%H:%M:%S') end },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'filetype' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {
      lualine_a = {
        {
          'buffers',
          show_filename_only = true,
          hide_filename_extension = false,
          show_modified_status = true,
          mode = 0,
          max_length = vim.o.columns * 2 / 3,
          filetype_names = {
            TelescopePrompt = 'Telescope',
            dashboard = 'Dashboard',
            packer = 'Packer',
            fzf = 'FZF',
            alpha = 'Alpha'
          },
          use_mode_colors = false,
          buffers_color = {
            active = 'lualine_a_normal',
            inactive = 'lualine_a_inactive',
          },
          symbols = {
            modified = ' ●',
            alternate_file = '',
            directory = '',
          },
        }
      },
      lualine_b = { 'tabs' },
      lualine_c = { 'filename' },
      lualine_x = { 'filesize', 'fileformat' },
      lualine_y = { 'encoding' },
      lualine_z = { 'progress' },
    },
    extensions = {
      'fugitive',
      'nvim-tree',
      'quickfix',
      'lazy',
      'nerdtree',
      'neo-tree',
    },
  })
end

-- Set up autocmd for dashboard and lualine
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dashboard',
  callback = hide_lualine,
})

vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    local buf_name = vim.api.nvim_buf_get_name(0)
    if buf_name ~= '' and vim.bo.filetype ~= 'dashboard' then
      show_lualine()
    end
  end,
})

