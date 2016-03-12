"================================================================================
" anekos gvim rc
"                                                         vim: set ts=2 sw=2 et :
"================================================================================

" GUI Options {{{

" i = アイコンを使用, g = メニューの灰色表示, t = メニューの切り離し機能
set guioptions=git

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
