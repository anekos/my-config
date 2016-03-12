"======================================================================================
"
"       ___           ___           ___           ___           ___           ___
"      /\  \         /\  \         /\__\         /|  |         /\  \         /\__\
"     /::\  \        \:\  \       /:/ _/_       |:|  |        /::\  \       /:/ _/_
"    /:/\:\  \        \:\  \     /:/ /\__\      |:|  |       /:/\:\  \     /:/ /\  \
"   /:/ /::\  \   _____\:\  \   /:/ /:/ _/_   __|:|  |      /:/  \:\  \   /:/ /::\  \
"  /:/_/:/\:\__\ /::::::::\__\ /:/_/:/ /\__\ /\ |:|__|____ /:/__/ \:\__\ /:/_/:/\:\__\
"  \:\/:/  \/__/ \:\~~\~~\/__/ \:\/:/ /:/  / \:\/:::::/__/ \:\  \ /:/  / \:\/:/ /:/  /
"   \::/__/       \:\  \        \::/_/:/  /   \::/~~/~      \:\  /:/  /   \::/ /:/  /
"    \:\  \        \:\  \        \:\/:/  /     \:\~~\        \:\/:/  /     \/_/:/  /
"     \:\__\        \:\__\        \::/  /       \:\__\        \::/  /        /:/  /
"      \/__/         \/__/         \/__/         \/__/         \/__/         \/__/
"
"                                                               vim: set ts=2 sw=2 et :
"======================================================================================


" Reloadablerrr
augroup Meowrc
  autocmd!
augroup END
command! -bang -nargs=* MeowtoCmd autocmd<bang> Meowrc <args>

" Encoding
set encoding=utf8
let &termencoding = &encoding
scriptencoding utf8
set fileencodings=utf8

" 起動時間を計測
" via .thincarc
if has('vim_starting') && has('reltime')
  let g:startuptime = reltime()
  MeowtoCmd VimEnter * let g:startuptime = reltime(g:startuptime)
  \                  | redraw
  \                  | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

" Parted (ワイルドカードでまとめて読むのは多分だめー)
runtime part/bundles.vim
runtime part/utils.vim
runtime part/options.vim
runtime part/mappings.vim
runtime part/commands.vim
runtime part/autocommands.vim
runtime part/term.vim
runtime part/plugins.vim
runtime part/after.vim
