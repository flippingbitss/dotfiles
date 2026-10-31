-- require("bitsnflips")
require("editor")
require("keys")
require("lazyy")
require("helpers")

----
---
---
local config = require("nvim-treesitter.configs")
config.setup({
	ignore_install = {},
	ensure_installed = {
		"c",
		"css",
		"go",
		"html",
		"javascript",
		"java",
		"lua",
		"markdown",
		"python",
		"rust",
		"typescript",
		"vimdoc",
		"zig",
	},
	highlight = {
		enable = true,
	},
	indent = { enable = false },
	modules = {},
	sync_install = true,
	auto_install = true,
})
