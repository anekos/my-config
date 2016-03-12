"=========================
"            |\
" /|\ |\  /| |  \  |\  /|
"  |  | \/ | |  /  | /\ |
"  |  |    | |  \  |/  \|
"  |  |    | |   \ |    |
"=========================

scriptencoding utf8

if has('gui_running')
  finish
endif

" 対応端末では、左右スクロールマージンを利用する
" ref: http://slashdot.jp/journal/572013/vim%E3%81%A7%E3%81%AE%E7%B8%A6%E5%88%86%E5%89%B2%E6%99%82%E3%81%AE%E3%82%B9%E3%82%AF%E3%83%AD%E3%83%BC%E3%83%AB%E9%80%9F%E5%BA%A6%E6%94%B9%E5%96%84
if index(['xterm', 'mlterm', 'RLogin', 'tanasinn', 'pangoterm'], $TERM) >= 0
  let &t_ti .= "\e[?6;69h"
  let &t_te .= "\e7\e[?6;69l\e8"
  let &t_CV = "\e[%i%p1%d;%p2%ds"
  let &t_CS = 'y'
endif

if $TERM !=# 'linux'
  command! -bar ReloadColors set t_Co=256 t_SI=[3\ q t_EI=[1\ q
  MeowtoCmd VimEnter * ReloadColors
endif
