require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'jdtls', 'rust_analyzer', 'clangd', 'cmake', 'ansiblels', 'asm_lsp', 'bashls',
        'cssls', 'dockerls', 'docker_compose_language_service', 'gopls', 'gradle_ls', 'graphql', 'groovyls', 'html',
        'hls', 'jsonls', 'kotlin_language_server', 'ltex', 'marksman', 'opencl_ls',
        'perlnavigator', 'pylsp', 'sqlls', 'svelte', 'taplo', 'tailwindcss', 'tsserver', 'terraformls', 'vuels',
        'lemminx', 'yamlls', 'zls' }
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

require('lspconfig').rust_analyzer.setup({})

require('lspconfig').clangd.setup({})

require('lspconfig').cmake.setup({})

require('lspconfig').ansiblels.setup({})

require('lspconfig').asm_lsp.setup({})

require('lspconfig').bashls.setup({})

require('lspconfig').cssls.setup({})

require('lspconfig').dockerls.setup({})

require('lspconfig').docker_compose_language_service.setup({})

require('lspconfig').gopls.setup({})

require('lspconfig').gradle_ls.setup({})

require('lspconfig').graphql.setup({})

require('lspconfig').groovyls.setup({})

require('lspconfig').html.setup({})

require('lspconfig').hls.setup({})

require('lspconfig').jsonls.setup({})

require('lspconfig').kotlin_language_server.setup({})

require('lspconfig').ltex.setup({})

require('lspconfig').marksman.setup({})

require('lspconfig').opencl_ls.setup({})

require('lspconfig').perlnavigator.setup({})

require('lspconfig').pylsp.setup({})

require('lspconfig').sqlls.setup({})

require('lspconfig').svelte.setup({})

require('lspconfig').taplo.setup({})

require('lspconfig').tailwindcss.setup({})

require('lspconfig').tsserver.setup({})

require('lspconfig').terraformls.setup({})

require('lspconfig').vuels.setup({})

require('lspconfig').lemminx.setup({})

require('lspconfig').yamlls.setup({})

require('lspconfig').zls.setup({})
