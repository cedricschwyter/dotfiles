require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'jdtls', 'rust_analyzer', 'clangd', 'cmake', 'ansiblels', 'asm_lsp', 'bashls',
        'cssls', 'dockerls', 'docker_compose_language_service', 'gopls', 'gradle_ls', 'graphql', 'groovyls', 'html',
        'hls', 'jsonls', 'kotlin_language_server', 'marksman', 'opencl_ls', 'spectral', 'perlnavigator', 'pylsp',
        'svelte', 'taplo', 'tailwindcss', 'terraformls', 'vuels', 'lemminx', 'yamlls', 'zls' },
    automatic_enable = true
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
