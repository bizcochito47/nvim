vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.cmd("set shortmess+=I")
vim.opt.cursorline = true
vim.opt.scrolloff = 999
vim.opt.signcolumn = 'yes'
vim.cmd('highlight CursorLineNr guifg=#c0caf5 gui=bold')
vim.opt.filetype = 'indent'
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.swapfile = false

-- Create an autocommand group
vim.api.nvim_create_augroup("OverrideCursorLineNr", { clear = true })

-- Define an autocommand to override the CursorLineNr highlight
vim.api.nvim_create_autocmd("VimEnter", {
    group = "OverrideCursorLineNr",
    callback = function()
        vim.cmd('highlight CursorLineNr guifg=NONE guibg=NONE gui=NONE')
    end,
})

