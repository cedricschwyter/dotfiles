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

require("mason-lspconfig").setup_handlers({
    -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
    function(server_name)
        require("lspconfig")[server_name].setup {}
    end,
    -- You can also override the default handler for specific servers by providing them as keys, like so:
    ["lua_ls"] = function()
        require('lspconfig').lua_ls.setup({
            single_file_support = true
        })
    end,
    ["jdtls"] = function()
        local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
        require("lspconfig").jdtls.setup({
            init_options = {
                jvm_args = '-javaagent:' .. install_path .. '/lombok.jar'
            }
        })
    end
})
