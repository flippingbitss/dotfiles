require("mason").setup({})
local mason_registry = require("mason-registry")

local jdtls_root = mason_registry.get_package("jdtls"):get_install_path()
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local function get_package_root(package)
	return mason_registry.get_package(package):get_install_path()
end

local java_debug_adapter_root = get_package_root("java-debug-adapter") .. "/extension/server"
local vscode_java_test_root = get_package_root("java-test") .. "/extension/server"

-- needed for debugging unit tests
-- vscode-java-test
-- java-debug extension
local bundles = {
	vim.fn.glob(java_debug_adapter_root .. "/com.microsoft.java.debug.plugin-*.jar", false),
}

vim.list_extend(bundles, vim.split(vim.fn.glob(vscode_java_test_root .. "/*.jar", false), "\n"))

local config = {
	cmd = {
		"/usr/lib/jvm/java-21-openjdk/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		jdtls_root .. "/plugins/" .. "org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",
		"-configuration",
		jdtls_root .. "/config_linux",
		"-data",
		vim.fn.expand("~/.cache/jdtls-workspace/") .. workspace_dir,
	},

	root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml" }),

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {},
	},

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = bundles,
	},
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
local jdtls = require("jdtls")

jdtls.start_or_attach(config)

-- run test
vim.keymap.set("n", "<leader>rt", function()
	jdtls.test_nearest_method()
end)

vim.keymap.set("n", "<leader>gt", function()
	require("jdtls.tests").generate()
end)

vim.keymap.set("n", "<leader>gd", function()
	require("jdtls.tests").goto_subjects()
end)

-- run tests in class
vim.keymap.set("n", "<leader>rc", function()
	jdtls.test_class()
end)
