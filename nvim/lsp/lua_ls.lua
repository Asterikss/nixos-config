return {
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
      runtime = {
        version = 'LuaJIT',
      },
      hint = {
        enable = true,
      },
      diagnostics = {
        globals = { 'vim', 'describe', 'it' },
        unusedLocalExclude = { '_*' },
      },
    },
  },
}
