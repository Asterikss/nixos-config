return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
  opts = {
    render_modes = true,
    anti_conceal = {
      enabled = false,
    },
    link = {
      enabled = false,
    },
    inline_highlight = {
      enabled = false,
    },
    html = {
      enabled = false,
    },
    heading = {
      setext = false,
    },
    sign = {
      enabled = false,
    },
    checkbox = {
      unchecked = {
        icon = '',
        highlight = 'TodoUnchecked',
        scope_highlight = 'TodoUnchecked',
      },
      checked = {
        icon = '',
        -- icon = '',
        highlight = 'TodoChecked',
        scope_highlight = 'TodoChecked',
      },
      custom = {
        todo = {
          raw = '[>]',
          rendered = '󱢍',
          -- rendered = '󱢎',
          highlight = 'TodoDoLater',
          scope_highlight = 'TodoDoLater',
        },
        in_progress = {
          raw = '[-]',
          rendered = '󰿦',
          highlight = 'TodoInProgress',
          scope_highlight = 'TodoInProgress',
        },
        on_hold = {
          raw = '[=]',
          rendered = '󰿋',
          -- rendered = '󰿺',
          highlight = 'TodoOnHold',
          scope_highlight = 'TodoOnHold',
        },
        canceled = {
          raw = '[_]',
          rendered = '󱓇',
          -- rendered = '󰅘',
          -- rendered = '󰅗',
          highlight = 'TodoCanceled',
          scope_highlight = 'TodoCanceled',
        },
        urgent = {
          raw = '[!]',
          rendered = '󰀧',
          -- rendered = '󰳤',
          -- rendered = '󱌗',
          highlight = 'TodoUrgent',
          scope_highlight = 'TodoUrgent',
        },
        important = {
          raw = '[*]',
          rendered = '󰩳',
          highlight = 'TodoImportant',
          scope_highlight = 'TodoImportant',
        },
        uncertain = {
          raw = '[?]',
          rendered = '󱜻',
          highlight = 'TodoUncertain',
          scope_highlight = 'TodoUncertain',
        },
        kind_of_done = {
          raw = '[~]',
          rendered = '',
          highlight = 'TodoKindOfDone',
          scope_highlight = 'TodoKindOfDone',
        },
      },
    },
    code = {
      conceal_delimiters = false,
      border = 'thin',
      width = 'block',
      highlight_border = 'CustomRenderMarkdownCodeBorder',
    },
    bullet = {
      icons = { '󰴈', '', '', '', '󰧱' },
      highlight = { 'CustomBullet1', 'CustomBullet2', 'CustomBullet3', 'CustomBullet4' },
      scope_highlight = { 'CustomBullet1', 'CustomBullet2', 'CustomBullet3', 'CustomBullet4' },
    },
    win_options = {
      concealcursor = { rendered = 'n' },
    },
  },
}
