require('null-ls')

local lsp_ok, nvim_lsp = pcall(require, "lspconfig")
if (not lsp_ok) then return end

local typescript_ok, typescript = pcall(require, 'typescript')
if (not typescript_ok) then return end


local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end


local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  buf_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<cr>', opts)
  buf_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<cr>', opts)
  buf_set_keymap("n", "<leader>ds", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
  buf_set_keymap("n", "<leader>dl", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
  -- buf_set_keymap("n", "<leader>di", "<cmd>lua vim.diagnostic.show_line_diagnostics()<cr>", opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.tsserver.setup {
  on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    local opts = { noremap = true, silent = true, nowait = true }
    buf_set_keymap("n", "<leader>tr", "<cmd>TypescriptRemoveUnused<CR>", opts)
    buf_set_keymap("n", "<leader>to", ":TypescriptOrganizeImports<CR>", opts)
    buf_set_keymap("n", "<leader>ta", ":TypescriptAddMissingImports<CR>", opts)
    buf_set_keymap("n", "<leader>tx", ":TypescriptFixAll<CR>", opts)
    buf_set_keymap("n", "<leader>tr", ":TypescriptRenameFile<CR>", opts)

    on_attach(client, bufnr)
  end,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  signs = true,
  virtual_text = false,
  update_in_insert = true,
  float = {
    show_header = true,
    source = "always",
    border = 'rounded',
  },
})
