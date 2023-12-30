if not vim.g.init_lua_sourced then
  error('init.lua sourced after ftplugin on packpath/start')
end
print('init.lua sourced before ftplugin on packpath/start') 

