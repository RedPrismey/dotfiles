local default_capabilities = {
  textDocument = {
    completion = {
      editsNearCursor = true,
    },
  },
  offsetEncoding = { "utf-8", "utf-16" },
}

vim.filetype.add({
  pattern = {
    [".*%.typ"] = "typst",
  },
})

return {
  {
    "stevearc/conform.nvim",
    optional = true,

    opts = {
      formatters_by_ft = {
        typst = { "typstyle" },
      },
      formatters = {
        typstyle = { command = "typstyle" },
        -- typstfmt = { command = "typstfmt" },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        tinymist = {
          -- Fix semantic highlighting stuff when using non-ascii characters
          offset_encoding = "utf-32",
          single_file_support = true,
          root_dir = function()
            return vim.fn.getcwd()
          end,
          settings = {
            -- formatterMode = "typstyle",
          },
          -- capabilities = default_capabilities,
        },
      },
    },
  },

  {
    "chomosuke/typst-preview.nvim",
    -- lazy = false,
    ft = "typst",
    -- version = "0.1.*",
    build = function()
      require("typst-preview").update()
    end,
    keys = {
      {
        "<leader>tp",
        ":TypstPreview<CR>",
        desc = "Start Typst preview",
        mode = { "n" },
      },
      {
        "<leader>ts",
        ":TypstPreviewStop<CR>",
        desc = "Stop Typst preview",
        mode = { "n" },
      },
      {
        "<leader>tt",
        ":TypstPreviewToggle<CR>",
        desc = "Toggle Typst preview",
        mode = { "n" },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "tinymist",
      },
    },
  },
}
