
set encoding=utf-8
set fileencodings=utf-8,cp950

set nocompatible

set shiftwidth=4
set softtabstop=4
set expandtab
set ai
"set smartindent

set nu
set showmatch
set ruler
"set cursorline
set laststatus=2
set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%]

syntax on
"set t_Co=256
colorscheme torte

"
" sudo write command
"
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command Wq :execute ':W' | :q

"
" set screen title
"
set titlestring=%t%(\ %M%)
if &term == "screen" || &term == "screen-bce"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "screen-bce" || &term == "xterm"
  set title
endif


