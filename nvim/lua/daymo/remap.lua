-- source neovim
vim.keymap.set("n", "<leader>SO", ":so ~/.config/nvim/init.lua<CR>")

-- copy pasta
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>pp", "\"+p")

-- window commands
--vim.keymap.set("n", "<leader>h", "<C-w>h")
--vim.keymap.set("n", "<leader>j", "<C-w>j")
--vim.keymap.set("n", "<leader>k", "<C-w>k")
--vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>x", ":close<CR>")
-- buffer commands
vim.keymap.set("n", "<leader>R", ":bn<CR>")
vim.keymap.set("n", "<leader>E", ":bp<CR>")

-- movements following
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- insert mode next line
vim.keymap.set("i", "<M-j>", "<Esc>o")
vim.keymap.set("i", "<M-k>", "<Esc>O")
vim.keymap.set("i", "<M-h>", "<Esc>I")
vim.keymap.set("i", "<M-l>", "<Esc>A")

-- for quickfix list

-- hacks (search and replace)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move highlighted line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
