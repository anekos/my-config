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

if $TERM !=# 'linux'
  command! -bar ReloadColors set t_Co=256 t_SI=[3\ q t_EI=[1\ q
  MeowtoCmd VimEnter * ReloadColors
endif

" 20行でできる、端末版vimの縦分割スクロール高速化設定 - http://qiita.com/kefir_/items/c725731d33de4d8fb096
if has('vim_starting') && !has('gui_running') && has('vertsplit')
  function! s:enable_vsplit_mode()
    " enable origin mode and left/right margins
    let &t_CS = 'y'
    let &t_ti = &t_ti . "\e[?6;69h"
    let &t_te = "\e[?6;69l\e[999H" . &t_te
    let &t_CV = "\e[%i%p1%d;%p2%ds"
    call writefile([ "\e[?6;69h" ], '/dev/tty', 'a')
  endfunction

  " old vim does not ignore CPR
  map <special> <Esc>[3;9R <Nop>

  " new vim can't handle CPR with direct mapping
  " map <expr> ^[[3;3R g:EnableVsplitMode()
  set t_F9=[3;3R

  map <expr> <t_F9> <SID>enable_vsplit_mode()
  let &t_RV .= "\e[?6;69h\e[1;3s\e[3;9H\e[6n\e[0;0s\e[?6;69l"
endif
