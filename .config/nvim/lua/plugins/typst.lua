return {
  "kaarmu/typst.vim",
  ft = "typst",

  "chomosuke/typst-preview.nvim",
  version = "*",

  build = function()
    require("typst-preview").update()
  end,

  opts = {
    open_cmd = "firefox %s -P typst-preview --class typst-preview",
  },
}
