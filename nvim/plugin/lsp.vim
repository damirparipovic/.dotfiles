" the one remap
set completeopt=menuone,noinsert,noselect

" remaps for lspconfig
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>

" LSP setup
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48:2:%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require('lspconfig').pyright.setup{}
lua require('lspconfig').clangd.setup{}
lua require('lspconfig').hls.setup{}
lua require('lspconfig').racket_langserver.setup{}
