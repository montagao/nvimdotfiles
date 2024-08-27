-- Function to copy the current file path and line number
--

vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>v', ':lua copy_file_path_and_line_number()<CR>', { noremap = true, silent = true })

-- copy the file ath and line number

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>")

-- map github copilot accept suggestion to ctrl-j
vim.api.nvim_set_keymap('i', '<C-/>', 'copilot#Accept("<CR>")', { expr = true, silent = true })



-- live grep with r
vim.keymap.set("n", "<leader>r", "<cmd>Telescope live_grep<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- LSP Restart remap
vim.keymap.set("n", "<leader>l", ":LspRestart<CR>", { silent = true })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Navbuddy remaps
vim.keymap.set("n", "<leader>n", ":Navbuddy<CR>", { silent = true })

-- zenmode remapmap
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { silent = true })

-- -copy entire file
--
vim.api.nvim_set_keymap('n', '<Leader>c', ':%yank +<CR>', { noremap = true, silent = true })

-- todomon map
vim.api.nvim_set_keymap('n', '<C-Space>', ':Todomon<CR>', { noremap = true, silent = true })


-- levelsio eat ur heart out
vim.keymap.set("n", '<Leader>p', ':!git commit -am "x"<CR>', { silent = true })
