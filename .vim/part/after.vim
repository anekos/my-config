"============================
"                      |\
" |\   |\_/ /|\ |\  /| |  \
" |\ \ |\_/  |  | \/ | |  /
" |  \ |     |  |    | |  \
" |    |     |  |    | |   \
"============================


" ENV
let $PATH = $HOME . '/bin:' . $HOME . '/.cabal/bin:' . $PATH

if filereadable(expand('~/.vimrc.local')) | source ~/.vimrc.local | endif

set background=dark
colorscheme iceberg " iceberg anekos japanesque

filetype plugin indent on
syntax enable
