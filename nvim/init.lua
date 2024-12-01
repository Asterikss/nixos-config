-- Get system information
local system_name = vim.loop.os_uname().sysname
print(system_name)

if system_name == 'Linux' then
  local file = io.open('/etc/os-release', 'r')
  if file then
    local content = file:read '*all'
    file:close()
    if string.find(content, 'ID=nixos') then
      vim.g.system_id = 'nixos'
    end
  end
end
print(vim.g.system_id)
package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '-treesitter-parsers/?.lua'
require("core")
require("nvim-treesitter-parsers")
