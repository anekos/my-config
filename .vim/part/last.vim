"===================
" |\  |\   |    /|\
" | \ |\ \ | /|  |
" |   |  \ |/ |  |
" |   |       |  |
"===================

scriptencoding utf-8

let $PATH = $HOME . '/bin:' . $HOME . '/.cabal/bin:' . $PATH

if filereadable(expand('~/.vimrc.local')) | source ~/.vimrc.local | endif

if has('termguicolors')
  set termguicolors
endif

set background=dark
 " iceberg anekos japanesque tender solarized8_light_low gruvbox lucius sprint-night
colorscheme spring-night
let g:lightline.colorscheme = 'solarized'

" あぱ
filetype plugin indent on
syntax enable
