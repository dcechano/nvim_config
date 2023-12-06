local lsp_zero = require('lsp-zero')

lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

--require('mason').setup({})
--require('mason-lspconfig').setup()

--require('mason-lspconfig').setup({
--    ensure_installed = {'rust_analyzer', 'clangd'},

--    function(server_name)
--        require("lspconfig")[server_name].setup{}
--       handlers = {
--            lsp_zero.default_setup,
--        }
--})

--============================

local handlers = {
    function(server_name)
        require("lspconfig")[server_name].setup{}
    end,
    ["rust_analyzer"] = function()
        require("rust-tools").setup {    
            server = { 
                on_attach = function(_, bufnr) -- Hover actions
                    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
                    vim.keymap.set("n", "<leader><leader>", rt.code_action_group.code_action_group, { buffer = bufnr })
                     end,
            },
        }
    end,
    ["clangd"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.clangd.setup{}
    end
}
    require('mason-lspconfig').setup({ handlers = handlers })

--==============================

-- rust-tools
--local rt = require("rust-tools")

--rt.setup({
--  server = { on_attach = function(_, bufnr) -- Hover actions
---      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
--      vim.keymap.set("n", "<leader><leader>", rt.code_action_group.code_action_group, { buffer = bufnr })
--    end,
--  },
--})

-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = '💀'})
sign({name = 'DiagnosticSignWarn', text = '►'})
sign({name = 'DiagnosticSignHint', text = '◘'})
sign({name = 'DiagnosticSignInfo', text = '♥'})
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
