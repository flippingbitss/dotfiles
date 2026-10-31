vim.g.have_nerd_font = false
vim.o.mouse = "a"

-- Shared clipboard with OS
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.confirm = true

-- Visuals
vim.o.showmode = false
-- vim.opt.guicursor = ""
-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20"
vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.title = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
-- Whitespace characters
-- vim.o.list = true
-- vim.opt.listchars = { tab = "› ", trail = "·", nbsp = "␣" }
-- vim.opt.listchars = { trail = "·", nbsp = "␣" }
-- Show which line your cursor is on
vim.o.cursorline = true

-- Update time
vim.opt.updatetime = 300
vim.o.timeoutlen = 800

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.o.breakindent = true

-- Undo
vim.opt.swapfile = true
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.colorcolumn = "80"
-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- vim.cmd("filetype plugin indent on")
