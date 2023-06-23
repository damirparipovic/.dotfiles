local lsp = require('lsp-zero')

lsp.preset({
    name = 'minimal',
    set_lsp_kepmaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servesr = false,
})

lsp.ensure_installed({
	'pyright',
	'clangd',
	'hls',
	'tsserver',
    'eslint',
    'cssls',
    'html',
	'emmet_ls',
	'rust_analyzer',
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
	vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
	vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        --['<C-y>'] = cmp.mapping.confirm({select = true}),
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<C-space>'] = cmp.mapping.complete(),
    }
})

-- use below for configuring language servers
--local lspconfig = require("lspconfig")
--lspconfig.tsserver.setup({
--    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "html" }
--})
require('lspconfig').pyright.setup({
    settings={
        pyright={autoImportCompletion=true,},
        python={
            analysis={
                autoSearchPaths=true,
                diagnosticMode='openFilesOnly',
                useLibraryCodeForTypes=true,
                typeCheckingMode='off'
            }
        }
    }
})

lsp.setup_nvim_cmp({
  preselect = 'none',
  completion = {
    completeopt = 'menuone,noinsert,noselect'
  },
})

lsp.setup()
