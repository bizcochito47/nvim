return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme tokyonight-night")
    
    -- Function to enable transparency
    local function set_transparency()
      vim.cmd [[
        highlight Normal guibg=NONE ctermbg=NONE
        highlight NonText guibg=NONE ctermbg=NONE
        highlight NeoTreeNormal guibg=NONE ctermbg=NONE
        highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
      ]]
    end

    -- Enable transparency on startup
    set_transparency()

    -- Reapply transparency when neo-tree is focused
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = function()
        set_transparency()
      end,
    })
    
    -- Reapply transparency on window enter
    vim.api.nvim_create_autocmd("WinEnter", {
      pattern = "*",
      callback = function()
        vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
        vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
        vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
      end,
    })
  end,
}

