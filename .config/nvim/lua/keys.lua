-- Space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Switch to normal mode easily
vim.keymap.set({ "i", "v", "c" }, "<C-o>", "<Esc>`^")

-- Clear search highlights with Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Populate Quickfix list with diagnostics
vim.keymap.set("n", "<leader>q", function()
	vim.diagnostic.setqflist({ severity = "ERROR" })
end, { desc = "Open diagnostic [Q]uickfix list" })

-- Easier split navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- Exit editor
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move lines visually selected up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Don't move the cursor during J ( J appends next line after current line)
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the middle when moving through search terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Visual select & paste keeps originally yanked text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Replace word under cursor with last yanked text without clobbering registers
vim.keymap.set("n", "<leader>rp", [["_ciw<C-r>0<Esc>]], { desc = "Replace word with yank" })

-- Yank to system clipboard as well
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Prevent accidental hits
vim.keymap.set("n", "Q", "<nop>")

-- Quick save
vim.keymap.set("n", "<leader>w", ":w<CR>")

--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix list navigation
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Substitute instances of word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current script executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
