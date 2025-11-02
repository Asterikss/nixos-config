return {
  'neovim/nvim-lspconfig',
  dependencies = { -- TODO?
    { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
    -- and elegantly composed help section, `:help lsp-vs-treesitter`

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        --  For example, in C this would take you to the header.
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        -- :hi LspInlayHint
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    local diagnostic_signs = {}
    for type, icon in pairs({ ERROR = '󰻲', WARN = '󰯪', INFO = '', HINT = '󰝩' }) do
      diagnostic_signs[vim.diagnostic.severity[type]] = icon
    end

    vim.diagnostic.config({
      virtual_text = {
        current_line = true,
      },
      underline = true,
      update_in_insert = false,
      severity_sort = false,
      signs = { text = diagnostic_signs },
      float = {
        style = 'minimal',
        border = 'rounded',
        header = '',
        prefix = '',
      },
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      pyright = {},
      clangd = {},
      ts_ls = {},
    }

    -- require('mason').setup()

    local setup_server = function(server_name)
      local server = servers[server_name] or {}
      -- This handles overriding only values explicitly passed
      -- by the server configuration above. Useful when disabling
      -- certain features of an LSP (for example, turning off formatting for ts_ls)
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      -- require('lspconfig')[server_name].setup(server)
      -- vim.lsp.config['server_name'] = server
      vim.lsp.enable(server_name)
    end
    vim.lsp.enable('lua_ls')

    local ensure_installed = vim.tbl_keys(servers or {})
    local extra_tools = {
      -- 'stylua',
      -- 'clang-format',
    }

    if vim.g.nixed ~= nil then
      -- vim.notify('In nixified setup', vim.log.levels.INFO)
      for _, server_name in pairs(ensure_installed) do
        setup_server(server_name)
      end
    else
      -- vim.notify('Notnixos setup', vim.log.levels.INFO)
      vim.list_extend(ensure_installed, extra_tools)
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
      require('mason-lspconfig').setup { handlers = { setup_server } }
    end
    -- require('mason-tool-installer').setup {
    --   run_on_start = false,
    --   ensure_installed = ensure_installed,
    -- }
    --
    -- require('mason-lspconfig').setup {
    --   automatic_installation = false,
    --   handlers = {
    --     function(server_name)
    --       local server = servers[server_name] or {}
    --       -- This handles overriding only values explicitly passed
    --       -- by the server configuration above. Useful when disabling
    --       -- certain features of an LSP (for example, turning off formatting for ts_ls)
    --       server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
    --       require('lspconfig')[server_name].setup(server)
    --     end,
    --   },
    -- }
  end,
}
