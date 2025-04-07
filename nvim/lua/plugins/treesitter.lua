return {
  'nvim-treesitter/nvim-treesitter',
  dev = vim.g.nixed ~= nil,
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    local ensure_installed_tree = {}
    if vim.g.nixed == nil then
      vim.list_extend(ensure_installed_tree, {
        'python',
        'rust',
        'c',
        'cpp',
        'lua',
        'typescript',
        'tsx',
        'markdown',
        'markdown_inline',
        'vim',
        'vimdoc',
        'regex',
        'bash',
        'yaml',
        'sql',
      })
    end
    require('nvim-treesitter.configs').setup({
      auto_install = false,
      ensure_installed = ensure_installed_tree,
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
          init_selection = 'gnn',
          node_decremental = 'grm',
          node_incremental = 'grn',
          scope_incremental = 'grc',
        },
      },
      indent = {
        enable = true,
        disable = { 'markdown', 'python' },
      },
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    })
  end,
}
