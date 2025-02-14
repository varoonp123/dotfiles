local nvim_lsp = require('lspconfig')

local on_attach = function(client)
        require 'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({
        on_attach = on_attach,
        settings = {
                ["rust-analyzer"] = {
                        imports = {
                                granularity = {
                                        group = "module",
                                },
                                prefix = "self",
                        },
                        cargo = {
                                buildScripts = {
                                        enable = true,
                                },
                        },
                        procMacro = {
                                enable = true
                        },
                }
        }
})
nvim_lsp.html.setup{}
nvim_lsp.yamlls.setup({
        settings = {
                yaml = {
                        schemas = {
                                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker*.y*l" } } } })
nvim_lsp.pyright.setup({ on_attach = on_attach })
nvim_lsp.jsonls.setup({
        settings = {
                json = { validate = { enable = true },
                        schemas = { ["https://json.schemastore.org/package.json"] = "package.json" } } } })
nvim_lsp.jdtls.setup({})
nvim_lsp.sqlls.setup({})
nvim_lsp.clangd.setup({})
nvim_lsp.eslint.setup({
  --- ...
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})
nvim_lsp.tsserver.setup({})
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                end, opts)
        end,
})
