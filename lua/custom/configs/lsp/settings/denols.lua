local util = require "lspconfig.util"

return {
  cmd = { "deno", "lsp" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_dir = util.root_pattern("deno.json", "deno.jsonc", "import_map.json"),
  init_options = { enable = true, lint = true, unstable = true },
}
