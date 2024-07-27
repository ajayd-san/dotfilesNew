local servers = {
    "lua_ls",
    "docker_compose_language_service",
    "dockerls",
    "jedi_language_server",
    "tsserver"
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end


local on_attach = require("default.lsp.handlers").on_attach
local capabilities = require("default.lsp.handlers").capabilities

-- lua
lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {version = 'LuaJIT'},
            workspace = {
                checkThirdParty = false,
                library = {
                    '${3rd}/luv/library',
                    unpack(vim.api.nvim_get_runtime_file('', true))
                },
            },
            diagnostics = {
                globals = { 'vim' },
                disable = {'missing-fields'}
            },
        },
    },
}

-- python
lspconfig.jedi_language_server.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- rust
local rt = require("rust-tools")
rt.setup({
    server = {
        on_attach = function(_, bufnr)
            on_attach()
        end,
        capabilities = capabilities
    },
})

-- docker
lspconfig.docker_compose_language_service.setup {}
lspconfig.dockerls.setup {}


-- typescript, js
-- lspconfig.tsserver.setup {
--     on_attach = function(client)
--         client.resolved_capabilities.document_formatting = false
--     end,
--     capabilities = capabilities
-- }

lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
lspconfig.eslint.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.fsautocomplete.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

--cpp
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- go
lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            ["ui.inlayhint.hints"] = {
                compositeLiteralFields = true,
                constantValues = true,
                parameterNames = true
            },
        },
    },
})

-- vim.diagnostic.config({
--     virtual_text = true,
-- })
