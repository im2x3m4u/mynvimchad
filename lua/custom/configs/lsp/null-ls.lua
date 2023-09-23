local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {

    -- webdev stuff
    formatting.deno_fmt.with { filetypes = { "javascript", "typescript" } },
    formatting.prettierd.with {
        filetypes = {
            -- "javascript",
            -- "javascriptreact",
            -- "typescript",
            -- "typescriptreact",
            "vue",
            "css",
            "scss",
            "less",
            "html",
            "json",
            "jsonc",
            "yaml",
            "markdown",
            "markdown.mdx",
            "graphql",
            "handlebars",
        },
    },

    -- Lua
    formatting.stylua,

    -- cpp
    formatting.clang_format,
    
    formatting.blade_formatter,
    formatting.phpcsfixer,
    formatting.autopep8,
    formatting.djlint,
    formatting.sql_formatter,
    require("typescript.extensions.null-ls.code-actions"),
}
local ensure_installed = {}

local data_ok, data_sources = pcall(require, "custom.null-ls")
if data_ok then
	for _, cfg in pairs(data_sources.sources) do
		table.insert(sources, cfg)
	end
end

local data_exists, data = pcall(require, "core.config")
if data_exists then
	-- load data null-ls
	for _, nullls in pairs(data.null_ls_ensure_installed) do
		table.insert(ensure_installed, nullls)
	end
end

local mason_ok, mason_null_ls = pcall(require, "mason-null-ls")
if mason_ok then
	mason_null_ls.setup({
		ensure_installed = ensure_installed,
	})
end

local run = 0
local ok, frmt = pcall(require, "custom.chadrc")
if not ok then
	run = 1
end
if frmt.format_on_save == 1 then
	run = 1
end

if run == 1 then
	null_ls.setup({
		debug = false,
		ensure_installed = ensure_installed,
		sources = sources,

		on_attach = function(client, bufnr)
			--if client.resolved_capabilities.document_formatting then
			--vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format{async=true}")
			--end
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
						-- vim.lsp.buf.formatting_sync()
					end,
				})
			end
		end,
	})
else
	null_ls.setup({
		debug = false,
		ensure_installed = ensure_installed,
		sources = sources,
	})
end
