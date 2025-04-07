if vim.env.NIXED_NVIM ~= nil then
  vim.g.nixed = 'ziomale ponad lale'
end

require('core')

if vim.g.nixed ~= nil then -- needs to be loaded after treesitter
  package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '-treesitter-parsers/?.lua'
  require('nvim-treesitter-parsers')
end
