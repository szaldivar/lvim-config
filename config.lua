-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.format_on_save = false
lvim.colorscheme = "tokyonight-moon"

local telescope = require('telescope.builtin');

-- Leader remaps
lvim.builtin.which_key.mappings["w"] = {
  "<c-w>v<c-w>h:BufferLineCyclePrev<CR><c-w>l", "Split buffer"
}
lvim.builtin.which_key.mappings["f"] = {
  vim.lsp.buf.format, "Format buffer"
}
lvim.builtin.which_key.mappings["x"] = lvim.builtin.which_key.mappings["d"]

lvim.builtin.which_key.mappings["d"] = {
  vim.lsp.buf.declaration, "Go to declaration"
}
lvim.builtin.which_key.mappings["D"] = {
  vim.lsp.buf.definition, "Go to definition"
}
lvim.builtin.which_key.mappings["t"] = {
  vim.lsp.buf.type_definition, "Go to type"
}
lvim.builtin.which_key.mappings["r"] = {
  telescope.lsp_references, "Go to references"
}
lvim.builtin.which_key.mappings["i"] = {
  vim.lsp.buf.implementation, "Go to implementation"
}

lvim.lsp.buffer_mappings.normal_mode["gd"] = nil
lvim.lsp.buffer_mappings.normal_mode["gD"] = nil
lvim.lsp.buffer_mappings.normal_mode["gr"] = nil
lvim.lsp.buffer_mappings.normal_mode["gI"] = nil
lvim.lsp.buffer_mappings.normal_mode["gs"] = nil
lvim.lsp.buffer_mappings.normal_mode["gl"] = nil

lvim.keys.normal_mode["<c-f>"] = { telescope.grep_string }
lvim.keys.visual_mode["<c-f>"] = "y|:Telescope live_grep default_text=<c-r>0<CR>"
lvim.keys.normal_mode["<c-p>"] = { telescope.find_files }

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
  { 'folke/tokyonight.nvim' },
  -- Sessions
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup {
        log_level = "error",
      }
    end,
  },
  -- Other
  { "vim-scripts/ReplaceWithRegister" },
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
