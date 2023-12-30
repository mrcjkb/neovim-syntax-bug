# neovim-syntax-bug

A repo that reproduces a potential bug in Neovim:

Calling `syntax on` or `syntax enable` causes ftplugins on the packpath (start)
to be sourced immediately, when passing a file to the CLI.

## Setup

Each directory (`startup-lua` and `startup-vimscript`) contains:

- init.lua / init.vim that calls `syntax on` and sets `g:init_lua_sourced = true`
- a `packpath/*/start/*` plugin with an `ftplugin/rust.lua` / `ftplugin/rust.vim`
  that echos an error message if `g:init_lua_sourced` is not set.

## To reproduce

Enter either:

- `startup-lua` 

and run

```sh
nvim --cmd "set packpath^=$PWD" --cmd "set rtp^=$PWD" -u init.lua main.rs`
```

or 

- `startup-vimscript` 
  
and run

```sh
nvim --cmd "set packpath^=$PWD" --cmd "set rtp^=$PWD" -u init.vim main.rs`
```


### Expected behaviour

No error messages

### Actual behaviour

An error message is printed, because the ftplugin is sourced before the init script.
