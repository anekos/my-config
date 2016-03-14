"============================
"                      |\
" |\   |\_/ /|\ |\  /| |  \
" |\ \ |\_/  |  | \/ | |  /
" |  \ |     |  |    | |  \
" |    |     |  |    | |   \
"============================


" ENV
let $PATH = $HOME . '/bin:' . $HOME . '/.cabal/bin:' . $PATH

" Set filetype
MeowtoCmd BufNewFile,BufRead buildfile setlocal filetype=ruby

colorscheme iceberg " anekos

if filereadable(expand('~/.vimrc.local')) | source ~/.vimrc.local | endif

filetype plugin indent on
syntax enable
