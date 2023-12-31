vim.g.mapleader = " "

local keymap = vim.keymap
-- keymap.set("i", "jk", "<ESC>") not gonna use this, but it just means that in insert mode, pressing jk will act as pressing the escape key 

keymap.set('n', 'x', '"_x', { noremap = true, silent = true }) -- in normal mode, deleting character won't copy to register

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window


-- probably just gonna use tmux in the future, for now just do this
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- NvimTreeToggle
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Plugin keymaps
keymap.set("n", "<leader>i", ":PackerInstall<CR>")

-- fuzzy finder - telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
  

