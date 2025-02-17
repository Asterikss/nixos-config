return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },   -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    render_modes = true,
    anti_conceal = {
      enabled = false,
    },
    checkbox = {
      unchecked = {
        icon = '󰄱',
        -- icon = '✘',
        -- icon = '×',
        -- icon = '▢',
        -- icon = '󰄱',
        -- icon = '⬚',
        -- icon = '⬜',
        -- icon = '◻',
        -- icon = '☐',
        -- icon = '☐',
        -- icon = '◯',
        highlight = 'TodoUnchecked',
        scope_highlight = 'TodoUnchecked',
      },
      checked = {
        icon = '󰱒',
        -- icon = '✘',
        -- icon = '✔',
        -- icon = '󰄬',
        -- icon = '󰱒',
        -- icon = '☒',
        -- icon = '☑',
        -- icon = '⬛',
        -- icon = '◼',
        -- icon = '▥',
        -- icon = '▤',
        highlight = 'TodoChecked',
        scope_highlight = 'TodoChecked',
        -- scope_highlight = 'RenderMarkdownChecked',
        -- scope_highlight = '@markup.strikethrough',
        -- scope_highlight = { 'RenderMarkdownChecked', '@markup.strikethrough' },
        -- https://chatgpt.com/share/6781badb-0d84-8012-8666-51565c5e8986
      },
      -- position = 'overlay',
      custom = {
        todo = { -- do later
          raw = '[>]',
          rendered = '󰥔',
          -- rendered = '◯',
          highlight = 'TodoDoLater',
          scope_highlight = 'TodoDoLater'
        },
        in_progress = {
          raw = '[-]',
          rendered = '▣',
          -- rendered = '🞛',
          -- rendered = '▩',
          -- rendered = '◧',
          -- rendered = '◨',
          -- rendered = '⬖',
          highlight = 'TodoInProgress',
          scope_highlight = 'TodoInProgress'
        },
        on_hold = {
          raw = '[=]',
          rendered = '',
          -- rendered = '⊟',
          highlight = 'TodoOnHold',
          scope_highlight = 'TodoOnHold'
        },
        canceled = {
          raw = '[_]',
          rendered = '',
          -- rendered = '⚑',
          -- rendered = '󰜺',
          highlight = 'TodoCanceled',
          scope_highlight = 'TodoCanceled'
        },
        urgent = { -- important
          raw = '[!]',
          rendered = '⚡',
          -- rendered = '⚠",
          -- rendered = '󰓎',
          -- rendered = '⊡',
          -- rendered = '☖',
          -- rendered = '⭐',
          -- rendered = '🞜',
          highlight = 'TodoUrgent',
          scope_highlight = 'TodoUrgent'
        },
        important = {
          raw = '[*]',
          -- rendered = '󰓎',
          rendered = '⊡',
          -- rendered = '☖',
          -- rendered = '⭐',
          -- rendered = '🞜',
          highlight = 'TodoImportant',
          scope_highlight = 'TodoImportant'
        },
        uncertain = {
          raw = '[?]',
          -- rendered = '',
          -- rendered = '⬚',
          -- rendered = '▩',
          -- rendered = 'ʕ•ᴥ•ʔ?',
          -- rendered = '𐄂',
          -- rendered = '∿?',
          rendered = '⍰',
          -- rendered = '¿',
          -- rendered = '⁇',
          -- rendered = '♞',
          -- rendered = '❓',
          -- rendered = 'ʔ',
          -- rendered = '⸮',
          -- rendered = '‽',
          highlight = 'TodoUncertain',
          scope_highlight = 'TodoUncertain'
        },
        kind_of_done = {
          raw = '[~]',
          rendered = '▩',
          highlight = 'TodoKindOfDone',
          scope_highlight = 'TodoKindOfDone'
        }
        -- recurring @ ↺ ∞
        -- misc 🜨 ☀ ☘
      },
    },
    bullet = {
      icons = { '✿', '♞', '✺', '❅' },
      -- icons = { '✿', '', '✺', '❅' },
      -- icons = { '❆', '✿', '❃', '❁' },
      -- icons = { '✿', '❅', '❁', '❀' },
      -- icons = { '✿', '❀', '❃', '❁', },
      -- icons = { '🌠', '🍁', '🔱', '🌸' },
      -- icons = { '✿', '♞', '〄', '✺' },
      -- icons = { '✿', '♞', '✺', '❅' },
      -- highlight = 'CustomBullet', -- Might be this terminal
      -- highlight = 'TodoDoLater', -- Might be this terminal
      highlight = 'RenderMarkdownH5',
      -- highlight = 'RenderMarkdownBullet',
      -- right_pad = 1
      -- ❀ ❁ ❅ ✺ ❆ ☾ 〄 ⊛ ✦  ⁂ ✱  ❃ ♞ ♝ ♜ ♛ ♚ ♙ ♘ 󰓎 ♣♠
      -- 🌟 💫 🔱 💨 🍁 🌸 💠 ❄  🌠 🔥 ⚡🟔
    },
    -- preset = 'obsidian',
  },
}
