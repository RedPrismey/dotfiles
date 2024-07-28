return {
  "epwalsh/obsidian.nvim",
  version = "*",   -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown", -- Pour n'interagir qu'avec les fichiers du vault obsidian, voir la doc

  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- Optional.
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter",
  },

  opts = {
    workspaces = {
      {
        name = "main",
        path = "~/documents/obsidian/",
      },
    },

    new_notes_location = "current_dir",

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    attachments = {
      -- The default folder to place images in via `:ObsidianPasteImg`.
      -- If this is a relative path it will be interpreted as relative to the vault root.
      -- You can always override this per image by passing a full path to the command instead of just a filename.
      img_folder = "~ appendix", -- This is the default
    },
  },
}
