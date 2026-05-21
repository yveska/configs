require("mason").setup()

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, { desc = "Format Local buffer" })
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

vim.diagnostic.config({
    virutal_text = true,
    underline = true,
    -- update_in_insert = false,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.config("pyright", {})
-- vim.lsp.config("bashls", {})
-- vim.lsp.config("ts_ls", {})
-- vim.lsp.config("gopls", {})
-- vim.lsp.config("clangd", {})

vim.lsp.enable({
    "lua_ls",
	"pyright",
	-- "bashls",
	-- "ts_ls",
	-- "gopls",
	-- "clangd",
	-- "efm",
})
