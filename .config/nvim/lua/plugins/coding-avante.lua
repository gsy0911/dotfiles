return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  -- install stable version
  version = "*",
  opts = {
    -- add any opts here
    provider = "claude",
    -- auto_suggestions_provider = "claude",
    -- behaviour = {
    --     auto_suggestions = false,
    --     auto_set_highlight_group = false,
    --     auto_set_keymaps = false,
    --     auto_apply_diff_after_generation = false,
    --     support_paste_from_clipboard = false,
    -- },
    -- providers-setting
    claude = {
        model = "claude-3-7-sonnet-20250219",
        -- model = "claude-3-5-sonnet-20240620", -- $3/$15, maxtokens=8000
        -- model = "claude-3-opus-20240229",  -- $15/$75
        -- model = "claude-3-haiku-20240307", -- $0.25/1.25
        max_tokens = 8000,
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
