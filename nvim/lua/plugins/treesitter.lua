return {
  "nvim-treesitter/nvim-treesitter",
  dev = true,
  event = { "BufReadPost", "BufNewFile" },
  main = "nvim-treesitter.configs",
  opts = {
    auto_install = false,
    ensure_installed = {},
    ignore_install = {},
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      custom_captures = {},
      disable = {},
    },
    incremental_selection = {
      enable = false,
      disable = {},
      keymaps = {
        init_selection = "gnn",
        node_decremental = "grm",
        node_incremental = "grn",
        scope_incremental = "grc"
      },
    },
    indent = {
      enable = true,
      disable = { "python" },
    },
  },
  -- event = { "BufReadPost", "BufNewFile" },
  -- dependencies = {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  -- },
}
