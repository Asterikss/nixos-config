if vim.loop.os_uname().sysname == 'Linux' then
  local file = io.open('/etc/os-release', 'r')
  if file then
    local content = file:read '*all'
    file:close()
    if string.find(content, 'ID=nixos') then
      vim.g.system_id = 'nixos'
    end
  end
end

require('core')

if vim.g.system_id == 'nixos' then -- needs to be loaded after treesitter
  package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '-treesitter-parsers/?.lua'
  require('nvim-treesitter-parsers')
end
