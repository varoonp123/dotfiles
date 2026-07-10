local on_attach = function(client)
        print("Attaching LSP: " .. client.name)
end

vim.lsp.config('rust_analyzer', {
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
vim.lsp.config('html', {})
vim.lsp.config('yamlls', {
        settings = {
                yaml = {
                        schemas = {
                                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                                ["https://taskfile.dev/schema.json"] = "Taskfile*.y*l",
                                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker*.y*l" } } } })
local function resolve_pyright_cmd()
        if vim.fn.executable('pyright-langserver') == 1 then
                return { 'pyright-langserver', '--stdio' }
        elseif vim.fn.executable("uv") == 1 then
                return { 'uv', 'tool', 'run', '--from', 'pyright', 'pyright-langserver', '--stdio' }
        elseif vim.fn.executable("pipx") == 1 then
                return { 'pipx', 'run', '--spec', 'pyright', 'pyright-langserver', '--stdio' }

        end
        return nil
end
local pyright_cmd = resolve_pyright_cmd()
if pyright_cmd then
        vim.lsp.config('pyright', { cmd=pyright_cmd, on_attach = on_attach })
        vim.lsp.enable("pyright")
else
        vim.api.nvim_create_autocmd("FileType", {pattern="python", once=true, callback=function() vim.notify(
                "pyright not found in PATH (checked pyright-langserver, uv, and pipx).\nOne of uv, pipx, or pyright MUST be installed to use the language server. Skipping and running without pyright", vim.log.levels.WARN, {title="lspconfig"}
        )end})
end
vim.lsp.config('jsonls', {
        settings = {
                json = { validate = { enable = true },
                        schemas = { ["https://json.schemastore.org/package.json"] = "package.json" } } } })
vim.lsp.config('jdtls', {})
vim.lsp.config('sqlls', {})
vim.lsp.config('clangd', {})
vim.lsp.config('eslint', {
  --- ...
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})
vim.lsp.config('ts_ls', {})
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
-- Automatically set filetype and start LSP for systemd and Podman Quadlet unit files
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {
        -- systemd unit files
        "*.service", "*.socket", "*.timer", "*.mount", "*.automount",
        "*.swap", "*.target", "*.path", "*.slice", "*.scope", "*.device",
        -- Podman Quadlet files
        "*.container", "*.volume", "*.network", "*.kube", "*.pod", "*.build", "*.image"
    },
    callback = function()
        vim.bo.filetype = "systemd"
        vim.lsp.start({
            name = 'systemd_ls',
            cmd = { 'systemd-lsp' }, -- Update this path to your systemd-lsp binary
            root_dir = vim.fn.getcwd(),
        })
    end,
})
vim.lsp.enable({"rust_analyzer", "html", "yamlls", "jsonls", "sqlls", "clangd", "eslint", "ts_ls"})
