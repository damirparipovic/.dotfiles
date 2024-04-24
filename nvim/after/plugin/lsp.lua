local lsp = require('lsp-zero')

-- lsp.preset({
--     name = 'minimal',
--     set_lsp_kepmaps = true,
--     manage_nvim_cmp = true,
--     suggest_lsp_servesr = false,
-- })

-- lsp.ensure_installed({
-- 	'pyright',
-- 	'clangd',
-- 	'hls',
-- 	'tsserver',
--     'eslint',
--     'cssls',
--     'html',
-- 	'emmet_ls',
-- 	'rust_analyzer',
-- })

-- lsp.set_preferences({
-- 	sign_icons = { }
-- })

vim.keymap.set('n', '<leader>vd', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>') 

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', '<C-t>', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<leader>vrn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

    -- vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
	-- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
	-- vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
	-- vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
	-- vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
	-- vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
	vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)


-- autocomplete
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    mapping = cmp.mapping.preset.insert({
        -- Enter key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select=true}),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippets
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
    snippet = {
        expand = function(args)
            requires('luasnip').lsp_expand(args.body)
        end,
    },
})

local default_setup = function(server)
    require('lspconfig')[server].setup({
        capabilities = lsp_capabilities,
    })
end

-- mason
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        default_setup,
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                capabilities = lsp_capabilities,
            })
        end,
        -- Below is where other function() for server setups go (like above one for lua)
    },
})


-- use below for configuring language servers
--local lspconfig = require("lspconfig")
--lspconfig.tsserver.setup({
--    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "html" }
--})
-- require('lspconfig').pyright.setup({
--     settings={
--         pyright={autoImportCompletion=true,},
--         python={
--             analysis={
--                 autoSearchPaths=true,
--                 diagnosticMode='openFilesOnly',
--                 useLibraryCodeForTypes=true,
--                 typeCheckingMode='off'
--             }
--         }
--     }
-- })

-- lsp.setup()
