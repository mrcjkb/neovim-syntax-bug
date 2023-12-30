if exists("g:init_vim_loaded")
  echo "init.vim sourced before ftplugin on packpath/start"
  finish
end
echoerr "init.vim sourced after ftplugin on packpath/start"
