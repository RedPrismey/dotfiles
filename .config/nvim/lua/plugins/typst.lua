vim.filetype.add({
  pattern = {
    [".*%.typ"] = "typst",
  },
})

local function typst_pin()
  local tinymist_id = nil
  for _, client in pairs(vim.lsp.get_clients()) do
    if client.name == "tinymist" then
      tinymist_id = client.id
      break
    end
  end

  if not tinymist_id then
    vim.notify("tinymist not running!", vim.log.levels.ERROR)
    return
  end

  local client = vim.lsp.get_client_by_id(tinymist_id)
  if client then
    client.request("workspace/executeCommand", {
      command = "tinymist.pinMain",
      arguments = { vim.api.nvim_buf_get_name(0) },
    }, function(err)
      if err then
        vim.notify("error pinning: " .. err, vim.log.levels.ERROR)
      else
        vim.notify("succesfully pinned", vim.log.levels.INFO)
      end
    end, 0)
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {
          settings = {
            formatterMode = "typstyle",
            exportPdf = "onSave",
          },
        },
      },
    },
  },
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    build = function()
      require("typst-preview").update()
    end,
    keys = {
      {
        "<leader>tp",
        function()
          vim.cmd("TypstPreview")
          typst_pin()
        end,
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
        function()
          vim.cmd("TypstPreviewToggle")
          typst_pin()
        end,
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
        "typstyle",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "typst" },
    },
  },
}
