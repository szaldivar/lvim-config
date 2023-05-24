-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.format_on_save = false
lvim.colorscheme = "tokyonight"

-- Leader remaps
-- lvim.builtin.which_key.mappings[""]
lvim.builtin.which_key.mappings["f"] = {
  vim.lsp.buf.format, "Format buffer"
}
lvim.builtin.which_key.vmappings["p"] = {
  '"_dp', "Paste without yanking"
}
lvim.builtin.which_key.vmappings["d"] = {
  '"_d', "Delete without yanking"
}

lvim.keys.normal_mode["gt"] = ":lua vim.lsp.buf.type_definition()<CR>"

-- Non leader remaps
lvim.builtin.terminal.open_mapping = "<c-`>"

-- Plugins
lvim.plugins = {
  -- Motion
  { "tpope/vim-repeat" },
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },
  { "tpope/vim-surround" },
  { "nvim-tree/nvim-web-devicons" },
  { "wellle/targets.vim" },
  -- Git
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- Visual
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
  },
  { 'folke/tokyonight.nvim' }
}

-- Rainbow
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.extended_mode = true
lvim.builtin.treesitter.rainbow.max_file_lines = nil

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
  },
}
