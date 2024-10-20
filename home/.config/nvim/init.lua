-- Automatic closing pairs ", ), ], }, ...

vim.g.mapleader = " "
vim.keymap.set('n', '<Leader>y', '"+y')
vim.keymap.set('n', '<Leader>p', '"+p')

vim.cmd('colorscheme slate')
vim.cmd('filetype plugin on')
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.colorcolumn = "80"
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg=233, bg="#222222" })

-- Complete first useful PHP LSP or other integration
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'php',
    callback = function(ev)
        vim.lsp.start({
            name = 'phpactor',
            cmd = {'phpactor', 'language-server'},
            root_dir = vim.fs.root(ev.buf, {'.env', '.env.local.php', '.env.local', '.env.test'}),
        })
    end,
})
