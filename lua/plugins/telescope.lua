return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require("telescope.actions")

    require('telescope').setup {
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          vertical = { 
            width = 0.5,
            height = 0.8
          },
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
        -- Highlight configuration to set background to none
        -- Use "NONE" to effectively make the background transparent
        -- You might need to adjust these settings according to your colorscheme
        colors = {
          normal = {
            background = "NONE",
            foreground = "NONE",
          },
          preview = {
            background = "NONE",
          },
          selection = {
            background = "NONE",
            foreground = "NONE",
          },
        },
        -- You might need to customize highlights further if necessary
        -- e.g., for border or specific components
        -- Refer to Telescope's documentation or your colorscheme for details
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = {
            'fd',
            '--type', 'f',
            '--hidden',
            '--exclude', 'Music',
            '--exclude', '.local',
            '--exclude', '.nv',
            '--exclude', '.npm',
            '--exclude', '.nix-defexpr',
            '--exclude', '.mozilla',
            '--exclude', '.cache',
            '--exclude', 'Downloads'
          },
        }
      }
    }

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-f>', builtin.oldfiles, {})

    -- Additional highlight customizations (if needed)
    -- For example, setting specific highlight groups to NONE
    vim.cmd [[
      highlight TelescopePromptNormal guibg=NONE guifg=NONE
      highlight TelescopePromptBorder guibg=NONE guifg=NONE
      highlight TelescopeResultsNormal guibg=NONE guifg=NONE
      highlight TelescopeResultsBorder guibg=NONE guifg=NONE
      highlight TelescopePreviewNormal guibg=NONE guifg=NONE
      highlight TelescopePreviewBorder guibg=NONE guifg=NONE
      highlight TelescopePromptTitle guibg=NONE guifg=NONE
      highlight TelescopeResultsTitle guibg=NONE guifg=NONE
      highlight TelescopePreviewTitle guibg=NONE guifg=NONE
    ]]
  end
}

