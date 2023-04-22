local present, null_ls = pcall(require, "null-ls")

if not present then
    return
end

local b = null_ls.builtins

local sources = {

    -- webdev stuff
    b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
    -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
    b.formatting.prettierd.with {
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
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
    b.formatting.stylua,

    -- cpp
    b.formatting.clang_format,
    b.formatting.blade_formatter,
    b.formatting.phpcsfixer,
    b.formatting.autopep8,
    b.formatting.djlint,
    b.formatting.sql_formatter,
}

null_ls.setup {
    debug = true,
    sources = sources,
}
