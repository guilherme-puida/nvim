local methods = vim.lsp.protocol.Methods

local M = {}

---@param client vim.lsp.Client
local function on_attach(client, bufnr)
    ---@param lhs string
    ---@param rhs string|function
    ---@param opts string|table
    ---@param mode? string|string[]
    local function keymap(lhs, rhs, opts, mode)
        opts = type(opts) == "string" and { desc = opts }
            or vim.tbl_extend("error", opts --[[@as table]], { buffer = bufnr })
        mode = mode or "n"
        vim.keymap.set(mode, lhs, rhs, opts)
    end

    keymap("grr", "<cmd>FzfLua lsp_references<cr>", "references")
    keymap("gy", "<cmd>FzfLua lsp_typedefs<cr>", "type definition")

    if client.supports_method(methods.textDocument_signatureHelp) then
        keymap("<C-k>", function()
            local cmp = require "cmp"
            if cmp.visible() then
                cmp.close()
            end
            vim.lsp.buf.signature_help()
        end, "signature help", "i")
    end

    if client.supports_method(methods.textDocument_definition) then
        keymap("gD", "<cmd>FzfLua lsp_definitions<cr>", "peek definition")
        keymap("gd", function()
            require("fzf-lua").lsp_definitions { jump_to_single_result = true }
        end, "goto definition")
    end

    if client.supports_method(methods.TextDocument_inlayHint) then
        keymap("<leader>ci", function()
            local enabled = vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }
            vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })

            if not enabled then
                vim.api.nvim_create_autocmd("InsertEnter", {
                    buffer = bufnr,
                    once = true,
                    callback = function()
                        vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
                    end,
                })
            end
        end, "toggle inlay hints")
    end
end

local register_capability = vim.lsp.handlers[methods.client_registerCapability]
vim.lsp.handlers[methods.client_registerCapability] = function(err, res, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if not client then
        return
    end

    on_attach(client, vim.api.nvim_get_current_buf())

    return register_capability(err, res, ctx)
end

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "configure LSP keymaps",
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then
            return
        end

        on_attach(client, args.buf)
    end,
})

function M.configure_server(server, settings)
    local function capabilities()
        return vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )
    end

    require("lspconfig")[server].setup(vim.tbl_deep_extend("error", {
        capabilities = capabilities(),
    }, settings or {}))
end

return M
