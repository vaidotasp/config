
local lspconfig = require('lspconfig')

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }

  -- keybindings
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K',     '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gD',    '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr',    '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'g0',    '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', 'gW',    '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  buf_set_keymap('n', 'ga',    '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gR',    '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<space>r', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

  -- have a fixed column for the diagnostics to appear in
  -- this removes the jitter when warnings/errors flow in
  vim.cmd [[set signcolumn=yes]]
end

local util = require "lspconfig/util"

-- TS/JS
lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 200,
  },
  root_dir = util.root_pattern("package.json"),
}

lspconfig.denols.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = util.root_pattern("deno.json", "deno.jsonc"),
}

-- RUST OR BUST
require("rust-tools").setup {
  tools = {
    autoSetHints = true,
    runnables = { use_telescope = true },
    inlay_hints = {
      show_parameter_hints = true,
      highlight = "Whitespace",
    },
    hover_actions = { auto_focus = true },
    executor = {
      execute_command = function(command, args)
        vim.cmd("T " .. require("rust-tools.utils.utils").make_command_from_args(command, args))
      end,
    },
  },
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 200,
    },
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
        completion = {
          autoimport = {
            enable = true,
          },
        },
      },
    },
  },
}


-- ESLINT
lspconfig.eslint.setup {}

-- ELIXIR -> not sure if this even works :(
local path_to_elixirls = vim.fn.expand("~/code/projects/elixir-ls/release/language_server.sh")
lspconfig.elixirls.setup({
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = false,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false
    }
  }
})
