"================================================================================
" anekos gvim rc
"                                                         vim: set ts=2 sw=2 et :
"================================================================================

" GUI Options {{{

" ツールバー削除
set guioptions-=T

" GUIタブを使わない
set guioptions-=e

" メニュー削除
set guioptions-=m

" ラベル
set guitablabel=%N:\ %f

" }}}

" set {{{

" コマンドライン行数
set cmdheight=1

" }}}

if has('win32')
  source ~/.gvimrc_win32
endif

if has('unix')
  source ~/.gvimrc_linux
endif

