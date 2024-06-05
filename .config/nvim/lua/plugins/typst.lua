return {
  "kaarmu/typst.vim",
  ft = "typst",

  "chomosuke/typst-preview.nvim",
  version = "*",

  build = function()
    require("typst-preview").update()
  end,

  opts = {
    open_cmd = "librewolf %s -P typst-preview --class typst-preview",
  },
}
