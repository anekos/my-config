"===================
" |\  |\   |    /|\
" | \ |\ \ | /|  |
" |   |  \ |/ |  |
" |   |       |  |
"===================

scriptencoding utf-8

" カレーを零しても大丈夫
if $PWD == expand('~') && isdirectory('/tmp/xmosh')
  cd /tmp/xmosh
endif

if filereadable(expand('~/.vimrc.local')) | source ~/.vimrc.local | endif

 " iceberg anekos japanesque tender solarized8_light_low gruvbox lucius sprint-night
colorscheme spring-night
let g:lightline.colorscheme = 'solarized'

" あぱ
filetype plugin indent on
syntax enable
