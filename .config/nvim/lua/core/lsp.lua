require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'jdtls' }
})

local lsp_defaults = require('lspconfig').util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = on_attach
})

require('lspconfig').lua_ls.setup({
    single_file_support = true
})

local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
require('lspconfig').jdtls.setup({
    init_options = {
        jvm_args = '-javaagent:' .. install_path .. '/lombok.jar'
    }
})
