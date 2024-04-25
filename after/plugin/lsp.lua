local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp_zero.preset("recommended")
lsp_zero.extend_lspconfig()

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "lua_ls" },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			lspconfig.lua_ls.setup(lua_opts)
		end,
	},
})

-- Fix Undefined global 'vim'
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

local mason_registry = require("mason-registry")
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
	.. "/node_modules/@vue/language-server"

lspconfig.tsserver.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
			},
		},
	},
})
-- No need to set `hybridMode` to `true` as it's the default value
lspconfig.volar.setup({
	init_options = {
		vue = {
			hybridMode = false,
		},
	},
})

local css_containing_filetypes = {
	"css",
	"scss",
	"less",
	"vue",
}

lspconfig.css_variables.setup({
	filetypes = css_containing_filetypes,
})

lspconfig.stylelint_lsp.setup({
	filetypes = css_containing_filetypes,
	autoFixOnFormat = true,
})

lspconfig.eslint_lsp.setup({
	filetypes = { "javascript", "typescript", "vue" },
})

lsp_zero.set_preferences({
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	if client.name == "eslint" then
		vim.cmd.LspStop("eslint")
		return
	end

	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp_zero.setup()

vim.diagnostic.config({
	virtual_text = true,
})

require("nvim-ts-autotag").setup()
