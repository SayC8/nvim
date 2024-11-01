return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v4.x",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- Add LSP
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "rust_analyzer", "html", "cssls", "ts_ls", "clangd" }
    })

    local lsp_zero = require("lsp-zero")
    local lsp_attach = function(client, bufnr)
      local opts = { buffer = bufnr }
      local map = vim.keymap.set

      map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
      map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
      map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
      map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
      map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
      map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
      map("n", "gs", "<cmd>lua vim.lsp.buf.signature()<cr>", opts)
      map("n", "<leader>R", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
      map({ "n", "x" }, "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
      map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    end

    lsp_zero.extend_lspconfig({
      sign_text = true,
      lsp_attach = lsp_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })

    -- Enable lsp features
    require("lspconfig").lua_ls.setup({})
    require("lspconfig").clangd.setup({})
    require("lspconfig").rust_analyzer.setup({})
    require("lspconfig").html.setup({})
    require("lspconfig").cssls.setup({})
    require("lspconfig").ts_ls.setup({})

    -- Completion
    local cmp = require("cmp")
    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
      },
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({})
    })
  end
}
