require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'jdtls' }
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require('lspconfig').lua_ls.setup({
  on_attach = on_attach
})

local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
require('lspconfig').jdtls.setup({
  on_attach = on_attach,

  init_options = {
    jvm_args = '-javaagent:' .. install_path .. '/lombok.jar'
  }
})

