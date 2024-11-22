package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '-treesitter-parsers/?.lua'
require("core")
require("nvim-treesitter-parsers")
