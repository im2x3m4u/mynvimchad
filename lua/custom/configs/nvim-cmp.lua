local cmp = require "cmp"
local luasnip = require "luasnip"
local aux_cmp = require "custom.utils.aux.nvim-cmp"
local types = require "cmp.types"

local icons = require "custom.icons"

local function deprioritize_emmet(entry, _)
  local kinds = types.lsp.CompletionItemKind
  if kinds[entry:get_kind()] == "Snippet" then
    local name = vim.split(entry.source:get_debug_name(), ":")[2]
    if name == "emmet_ls" then
      return false
    end
    return true
  end
end
local function deprioritize_snippet(entry1, entry2)
  if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
    return false
  end
  if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
    return true
  end
end

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

return {
  completion = {
    completeopt = "menu,menuone",
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  -- define sorting rules
  sorting = {
    priority_weight = 2,
    comparators = {
      -- deprioritize_emmet,
      -- deprioritize_snippet,
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      -- cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      -- aux_cmp.kind_compare,
      aux_cmp.source_compare,
      -- cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      aux_cmp.under_compare,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  sources = cmp.config.sources {
    {
      name = "nvim_lsp",
      priority = 200,
      filter = deprioritize_emmet,
    },
    { name = "luasnip", priority = 750, filter = deprioritize_snippet },
    {
      name = "buffer",
      priority = 500,
      get_bufnrs = function()
        return vim.api.nvim_list_bufs()
      end,
    },
    { name = "path", priority = 300 },
    { name = "nvim_lua", priority = 100 },
    { name = "cmp_tabnine", priority = 400 },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", icons.kind[vim_item.kind])
      if entry.source.name == "cmp_tabnine" then
        vim_item.kind = icons.misc.Robot
        vim_item.kind_hl_group = "CmpItemKindTabnine"
      end
      if entry.source.name == "copilot" then
        vim_item.kind = icons.git.Octoface
        vim_item.kind_hl_group = "CmpItemKindCopilot"
      end

      vim_item.menu = ({
        nvim_lsp = "(LSP)",
        luasnip = "(Snippet)",
        buffer = "(Buffer)",
        path = "(Path)",
        cmp_tabnine = "(ai)",
      })[entry.source.name]
      return vim_item
    end,
  },
  window = {
    documentation = cmp.config.window.bordered(),
    -- completion = cmp.config.window.bordered(),
    completion = {
      side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
      scrollbar = false,
    },
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
}
