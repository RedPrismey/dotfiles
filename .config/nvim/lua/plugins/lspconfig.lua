return {
   "neovim/nvim-lspconfig",
   opts = {
      servers = {
         typst_lsp = {
            settings = {
               exportPdf = "onSave",
               formatterMode = "typstyle",
            },
         },
      },
   },
}
