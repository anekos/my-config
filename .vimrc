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


"  ____ ____ ____ ____
" ||i |||n |||i |||t ||
" ||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|

" pre {{{

" 起動時間を計測
" via .thincarc
if has('vim_starting') && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
    \                 | redraw
    \                 | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

set encoding=utf8
scriptencoding utf8

augroup Meowrc
  autocmd!
augroup END

command! -bang -nargs=* MeowtoCmd autocmd<bang> Meowrc <args>

" }}}

" NeoBundle {{{

set nocompatible               " be iMproved
filetype plugin indent off     " required!

if has('vim_starting')
 set runtimepath+=~/.vim-temp/bundle/neobundle.vim/
 call neobundle#rc(expand('~/.vim-temp/bundle/'))
endif

" let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'

" Color tool
NeoBundleLazy 'cocopon/colorswatch.vim', {'autoload' : {'commands' : ['ColorSwatchGenerate']}}
NeoBundle 'Rykka/colorv.vim'
NeoBundle 'Rykka/galaxy.vim'

" Color
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bluecloud'
NeoBundle 'fisadev/fisa-vim-colorscheme'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Pychimp/vim-sol'
NeoBundle 'rdark'
NeoBundle 'sjl/badwolf'
NeoBundle 'tomasr/molokai'
NeoBundle 'twilight'
NeoBundle 'vol2223/vim-colorblind-colorscheme'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'wabisabi'
NeoBundle 'Wombat'

" Completer
NeoBundle 'teramako/jscomplete-vim'

" Completion
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'

" Format
NeoBundle 'h1mesuke/vim-alignta'

" Game
NeoBundle 'mattn/habatobi-vim'
NeoBundle 'mattn/invader-vim'
NeoBundle 'rbtnn/puyo.vim'

" Haskell
NeoBundle 'bitc/lushtags'
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'ujihisa/unite-haskellimport'

" Hogeline
NeoBundle 'bling/vim-airline'

" InputMethod
NeoBundle 'anekos/felis-cat-igirisu-toast-express'

" Library
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'Shougo/vimproc', {'build' : {'windows' : 'make -f make_mingw32.mak', 'cygwin' : 'make -f make_cygwin.mak', 'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak'}}
NeoBundle 'vim-jp/vital.vim'

" Life Hack
NeoBundle 'tyru/banban.vim'

" Lisp
NeoBundle 'mopemope/unite-hyperspec'
NeoBundle 'vim-scripts/slimv.vim'

" Net
NeoBundle 'basyura/J6uil.vim'
NeoBundle 'basyura/TweetVim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'tsukkee/lingr-vim'

" Operator
NeoBundle 'kana/vim-operator-replace'

" Ref
NeoBundle 'taka84u9/vim-ref-ri'
NeoBundle 'thinca/vim-ref'
NeoBundle 'ujihisa/ref-hoogle'

" Scala
NeoBundle 'derekwyatt/vim-scala'

" Text Object
"     b   = Any brackets
"     fX  = beetween X - http://d.hatena.ne.jp/thinca/20100614/1276448745
"     i   = Indent Level
"     u   = URL
"     y   = Syntax
"     z   = Fold
NeoBundle 'kana/vim-textobj-fold'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-syntax'
NeoBundle 'mattn/vim-textobj-url'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'thinca/vim-textobj-plugins'

" Unite
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'mattn/httpstatus-vim'
NeoBundle 'mfumi/unite-mpc'
NeoBundle 'osyo-manga/unite-nyancat_anim'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'ujihisa/unite-locate'

" VCS
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'hrsh7th/vim-unite-vcs'
NeoBundle 'tpope/vim-fugitive'

" Misc
NeoBundle 'basyura/rmine.vim'
NeoBundle 'gregsexton/VimCalc'
NeoBundle 'http://conque.googlecode.com/svn/trunk/', {'directory' : 'conque'}
NeoBundle 'HybridText'
NeoBundle 'itchyny/thumbnail.vim'
NeoBundle 'kana/vim-submode'
NeoBundleLazy 'LeafCage/nebula.vim', {'autoload': {'commands': ['NebulaPutLazy', 'NebulaPutFromClipboard', 'NebulaYankOptions', 'NebulaPutConfig']}}
NeoBundleLazy 'majutsushi/tagbar', {'autoload' : {'commands' : ['Tagbar']}}
NeoBundle 'mattn/benchvimrc-vim'
NeoBundle 'mattn/mkdpreview-vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'othree/eregex.vim'
NeoBundle 'rbtnn/vimconsole.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/vimshell'
NeoBundleLazy 'Shougo/vinarise', {
  \'autoload': {
  \   'unite_sources': ['vinarise_analysis'],
  \   'commands': [
  \     {'complete': 'customlist,vinarise#complete', 'name': 'VinariseScript2Hex'},
  \     'VinarisePluginBitmapView',
  \     {'complete': 'customlist,vinarise#complete', 'name': 'Vinarise'},
  \     'VinarisePluginDump',
  \     {'complete': 'customlist,vinarise#complete', 'name': 'VinariseDump'},
  \     {'complete': 'file', 'name': 'VinariseHex2Script'}]}}
NeoBundle 'sjl/gundo.vim'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'taku-o/vim-batch-source'
NeoBundle 'tasuten/gcalc.vim'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'thinca/vim-portal'
NeoBundle 'thinca/vim-poslist'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/foldballoon.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/restart.vim'
NeoBundle 'tyru/vim-altercmd'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'vim-scripts/gtags.vim', {'autoload' : {'filetypes' : ['c', 'cpp', 'java']}}
NeoBundleLazy 'Yggdroot/indentLine', {'autoload' : {'commands' : ['IndentLinesReset', 'IndentLinesToggle']}}
NeoBundle 'yuratomo/gmail.vim'

 " }}}

" Unmanaged plugins {{{

if has('vim_starting')
  NeoBundleLocal ~/.vim/unmanaged/
endif

" }}}

" Our plugins {{{

function! s:LoadMyPlugin(name, ...)
  for l:base in ['', '~/project/', '~/repos/', '~/project/vim-plugins/']
    let l:dir = expand(l:base . a:name)
    if isdirectory(l:dir)
      let &runtimepath .= ',' . l:dir
      return
    endif
  endfor

  if a:0 > 0
    call neobundle#parser#bundle('"' . a:1 . '"')
  endif
endfunction

if has('vim_starting')
  call s:LoadMyPlugin('runes-vim', 'anekos/runes-vim')
  call s:LoadMyPlugin('manga-osort')
  call s:LoadMyPlugin('liname-hs/res/vim')
  call s:LoadMyPlugin('unite-located_session')
  call s:LoadMyPlugin('~/.xmonad/res/vim')
endif

" }}}

" Pre 2 {{{

filetype plugin indent on
filetype off
syntax enable
silent! language messages ja_JP.UTF-8

" }}}


"  ____ ____ ____ ____ ____ ____
" ||o |||p |||t |||i |||o |||n ||
" ||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|

" Options  {{{

" メニューの日本語化を抑止
set langmenu=none

" マウスのモード
behave mswin

" 改行コード
set fileformat=unix
set fileformats=dos,unix,mac

" 行数表示
set number

" 検索結果をハイライト
set hlsearch

" 括弧の対応表示
set showmatch

" バックスペース設定 (インデントやeolを消せるようにする)
set backspace=indent,eol,start

" set list 時の表示
set listchars=tab:>-

" IMをデフォでは働かせないように
set iminsert=0
set imsearch=0

" 常にステータスライン表示
set laststatus=2

" cygwin などのパーミッションを上書きするのを帽子
" http://d.hatena.ne.jp/msakamoto-sf/20071125/1195979751
set backupcopy=yes

" 選択モード
set selectmode=

" 保存していないバッファを隠せるようにする
set hidden

" バックアップする
set nobackup
set backupdir=~/.vim-temp/backup/

" スワップディレクトリ
set directory=~/.vim-temp/swap/

" View ディレクトリ
if has('win32')
  set viewdir=r:/vim
else
  set viewdir=~/.vim-temp/view
endif

" 補完設定
set complete=.,b,w,u,k

" 入力中のコマンドをステータスに表示する
set showcmd

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
set smartcase

" インクリメンタルサーチ
set incsearch

" コマンドラインの行数
set cmdheight=1

" <C-x> <C-a> で使う基数
set nrformats=

" 背景色を教える
set background=dark

" スクロール余白
set scrolloff=0

" 貼り付け時の挙動
set nopaste

" ファイルが外部から変更されたときに自動でロードしない
set noautoread

" カレント .vimrc, .exrc などを読まない
set noexrc

" 復元機能
set viewoptions=cursor,slash

" タブなどを表示する
set list

" マーカーで折りたたむ
set foldmethod=marker

" タブ＆インデント
set tabstop=2 shiftwidth=2 autoindent expandtab smarttab copyindent preserveindent

" 補完メニュー強化
set wildmenu
set wildchar=<Tab>
set wildignore=*.o,*.obj,*.la,*.a,*.exe,*.com,*.so,*.beam,*.hi,*.~*

" 折り返し検索
set wrapscan

" タブを常に表示
set showtabline=2

" for RecentFiles.vim
set viminfo& viminfo+=!

" ウィンドウサイズの自動調整
set noequalalways

" ヘルプの検索順
set helplang=ja,en

" セッションで保存する要素
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages

" カカッ!
set secure

" Don't save options.
set viewoptions-=options

" K
set keywordprg=

" }}}


"  ____ ____ ____ ____ ____ ____ ____
" ||m |||a |||p |||p |||i |||n |||g ||
" ||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|

" option {{{

" <Leader>
let mapleader = ','

" }}}

" override {{{

" コマンドモード時にカーソル移動するのに便利ー
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>

" 検索時に結果が中央に来るようにする
noremap n nzzzv
noremap N Nzzzv

" 検索のハイライト
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap * :<C-u>set hls<Bar>execute 'M/\<' . expand('<cword>') . '\>' <CR><C-o>
nnoremap # #<C-o>
nnoremap g* :<C-u>set hls<Bar>execute 'M/' . expand('<cword>') <CR><C-o>
nnoremap g# g#<C-o>

" for US KBD
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" ヘルプを引く <S-C-h>
nnoremap <C-h> :<C-u>help<Space>

" クリップボードから貼り付け
inoremap <C-r>* <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>

" kk Escape
inoremap kk <Esc>
inoremap jj <Esc>

" コメントなどが継続されるようにする
nnoremap o A<CR>

" Don't move on *
nnoremap * *<C-o>
nnoremap # #<C-o>

" Operator
vmap p <Plug>(operator-replace)

" Strong refresh
nnoremap <C-l> :<C-u>XMonadRefreshWindow<CR><C-l>

" 自然派
nnoremap Y y$

" }}}

" map {{{

" Save like Emacs
inoremap <C-x><C-s> <ESC>:<C-u>w<CR>a
inoremap <C-x>s <ESC>:<C-u>w<CR>a

" Short
noremap <Space><Space> :<C-u>noautocmd bnext<CR>
noremap <C-Space><C-Space> :<C-u>bprev<CR>
noremap <Left> :<C-u>noautocmd tabprev<CR>
noremap <Right> :<C-u>noautocmd tabnext<CR>
noremap <Up> :<C-u>noautocmd bprev<CR>
noremap <Down> :<C-u>noautocmd bnext<CR>

" 挿入モードでの移動
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-b> <Left>

" Omni Completion
inoremap <C-Space> <C-x><C-o>

" コマンドラインで履歴たぐり
cnoremap <C-k> <Up>
cnoremap <C-l> <Down>

" Ignore ex mode
nnoremap Q <Nop>

" Tab
"   ウィンドウを作成しているときに切り替えると、
"   描画がおかしい問題があるので、<C-l> で再描画する。
nnoremap <C-n> :tabnext<CR><C-l>
nnoremap <C-p> :tabprev<CR><C-l>

" window walker
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-h> <C-w>h
nnoremap <M-l> <C-w>l
inoremap <M-j> <Esc><C-w>j
inoremap <M-k> <Esc><C-w>k
inoremap <M-h> <Esc><C-w>h
inoremap <M-l> <Esc><C-w>l

" Toggle NeoCon
nnoremap <Leader>n :<C-u>NeoComplCacheToggle<CR>

" Emacs ライクなキャンセル
cnoremap <C-g> <C-c>

" like ranger
nnoremap cd :TabpageCD<Space>~/

" 改行
nnoremap <CR> A<CR><ESC>
inoremap <S-CR> <C-o>O

" }}}

" <Leader> {{{

" Leaders
nmap s <Leader>

" eregex 検索
noremap <Leader>/ :<C-u>Migemo<Space>

" buffer
nnoremap <Leader>x :<C-u>wincmd c<CR>
nnoremap <Leader><Space> :<C-u>Thumbnail<CR>

" ref.vim
nnoremap <Leader>r :<C-u>Ref<Space>

" tagbar
nnoremap <Leader>tb :<C-u>Tagbar<CR>

" tab
nnoremap <Leader>tn :<C-u>tabnew<CR>
nnoremap <Leader>te :<C-u>tabedit<Space>
nnoremap <Leader>tx :<C-u>tabclose<CR>

" Unite
nnoremap <Leader>b :<C-u>Unite -buffer-name=files buffer_tab<CR>
nnoremap <Leader>U :<C-u>Unite<Space>
nnoremap <Leader>ua :<C-u>Unite grep:.<CR>
nnoremap <Leader>ub :<C-u>Unite bookmark<CR>
nnoremap <Leader>uC :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <Leader>uc :<C-u>Unite hyperspec<CR>
nnoremap <Leader>ud :<C-u>Unite -buffer-name=files -default-action=cd<Space>directory_mru<CR>
nnoremap <Leader>uF :<C-u>Unite -buffer-name=files file<CR>
nnoremap <Leader>uf :<C-u>Unite -buffer-name=files file_rec/async<CR>
nnoremap <Leader>ug :<C-u>Unite grep:.<CR>
nnoremap <expr> <Leader>uh ':<C-u>Unite help ' . (getbufvar('%', '&filetype') == 'help' ? '' : '-tab') . '<CR>'
nnoremap <Leader>uj :<C-u>Unite jump -auto-preview<CR>
nnoremap <Leader>ul :<C-u>Unite line<CR>
nnoremap <Leader>uL :<C-u>Unite locate<CR>
nnoremap <Leader>um :<C-u>Unite -buffer-name=files file_mru<CR>
nnoremap <Leader>uM :<C-u>Unite mapping<CR>
nnoremap <Leader>uo :<C-u>Unite outline<CR>
nnoremap <Leader>ur :<C-u>Unite register<CR>
nnoremap <Leader>us :<C-u>Unite located_session<CR>
nnoremap <Leader>uT :<C-u>Unite tab:no-current<CR>
nnoremap <Leader>ut :<C-u>Unite tag<CR>
nnoremap <Leader>uu :<C-u>Unite<Space>
nnoremap <Leader>uv :<C-u>Unite vcs/status<CR>
nnoremap <Leader>uw :<C-u>Unite window:no-current<CR>

" QuickRun
nnoremap <Leader>R :<C-u>QuickRun<CR>

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <Leader>o <Plug>(openbrowser-smart-search)
vmap <Leader>o <Plug>(openbrowser-smart-search)

" IndentLine
nnoremap <Leader>i :<C-u>IndentLinesToggle<CR>
nnoremap <Leader>I :<C-u>setlocal cursorcolumn! cursorline!<CR>

" QuickHl
nmap <Leader>hh <Plug>(quickhl-toggle)
nmap <Leader>hr <Plug>(quickhl-reset)
nmap <Leader>hm <Plug>(quickhl-match)
nnoremap <Leader>hd :<C-u>QuickhlDel<CR>
nnoremap <Leader>ha :<C-u>QuickhlAdd<Space>

" }}}

" for plugin {{{

" runes
imap <C-z>z <Plug>(runes_toggle)
imap <C-z><C-z> <Plug>(runes_toggle)
imap <C-z>g <Plug>(runes_start_german)
imap <C-z>a <Plug>(runes_start_anglosaxon)
imap <C-z>d <Plug>(runes_start_denmark)
imap <C-z>s <Plug>(runes_start_sweden)

" multiblock
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

" poslist
map <Leader><C-o> <Plug>(poslist-prev-buf)
map <Leader><C-i> <Plug>(poslist-next-buf)

" }}}

" Toggle bang {{{

" http://twitter.com/tyru/status/13474491734
function! s:toggle_bang(cmdline)
    " :substituteみたいに引数とコマンドの間に
    " 空白がなくても呼ばれたりするものもあるので完璧ではない。
    " そもそも:substituteはbangとらないけど。
    let m = matchlist(a:cmdline, '^\(\s*\)\(\S\+\)\(.*\)')
    if empty(m) | return a:cmdline | endif
    let [ws, cmd, rest] = m[1:3]
    return ws . (cmd[strlen(cmd) - 1] == '!' ? cmd[:-2] : cmd . '!') . rest
endfunction
cnoremap <Plug>(cmdline-toggle-bang) <C-\>e <SID>toggle_bang(getcmdline())<CR>
cmap <C-x> <Plug>(cmdline-toggle-bang)

" }}}

" Vim の矩形選択の痒いところに手を届かせる - TIM Labs {{{

" http://labs.timedia.co.jp/2012/10/vim-more-useful-blockwise-insertion.html
vnoremap <expr> I <SID>force_blockwise_visual('I')
vnoremap <expr> A <SID>force_blockwise_visual('A')
function! s:force_blockwise_visual(next_key)
  if mode() ==# 'v'
    return "\<C-v>" . a:next_key
  elseif mode() ==# 'V'
    return "\<C-v>0o$" . a:next_key
  else  " mode() ==# "\<C-v>"
    return a:next_key
  endif
endfunction

" }}}

" ヘルプ以外の空バッファウィンドウを閉じる {{{

function! s:OnlyHelpBufferWindow ()
  let l:blanks = 0
  let l:helps = 0
  for n in tabpagebuflist()
    if getbufvar(n, '&filetype') == 'help'
      let l:helps += 1
    elseif bufname(n) == ''
      let l:blanks += 1
    endif
  endfor

  if l:blanks > 0 && l:helps > 0
    only
  endif
endfunction

MeowtoCmd BufNewFile,WinEnter,BufEnter,BufWinEnter * call s:OnlyHelpBufferWindow()

" }}}

" 全角でかかないようにする map {{{

scriptencoding utf8

inoremap 　 <Space>
inoremap 「 [
inoremap 」 ]
inoremap （ (
inoremap ） )
inoremap ｛ {
inoremap ｝ }
inoremap ； ;
inoremap ： :
inoremap ｜ \|
inoremap ＜ <
inoremap ＞ >
inoremap ＊ *
inoremap ＠ @
inoremap － -
inoremap ％ %
inoremap ＃ #
inoremap ” "
inoremap ’ '
inoremap ＋ +
inoremap ０ 0
inoremap １ 1
inoremap ２ 2
inoremap ３ 3
inoremap ４ 4
inoremap ５ 5
inoremap ６ 6
inoremap ７ 7
inoremap ８ 8
inoremap ９ 9
inoremap ～ ~

" }}}


"  ____ ____ ____ ____ ____ ____ ____
" ||a |||u |||t |||o |||c |||m |||d ||
" ||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|

" Auto Command {{{

" 自動で窓開く
MeowtoCmd QuickFixCmdPost vimgrep cwin

" 折りたたみの保存 - http://vim-users.jp/2009/10/hack84/
MeowtoCmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
MeowtoCmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif

" セッションロード後に、XMonad 的なリフレッシュ
MeowtoCmd SessionLoadPost * XMonadRefreshWindow

" }}}


"  ____ ____ ____
" ||e |||n |||v ||
" ||__|||__|||__||
" |/__\|/__\|/__\|

" PATH {{{

let $PATH = $HOME . "/bin:" . $HOME . '/.cabal/bin:' . $PATH

" }}}


"  ____ ____ ____ ____ ____ ____
" ||s |||c |||r |||i |||p |||t ||
" ||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|

" 可愛いフォーマッタ殺害 {{{

function! s:KillTheFuckingFormatters()
  setlocal textwidth=0
  " fo = formatoptions
  setlocal fo-=o fo-=t fo-=c fo+=mM
endfunction

MeowtoCmd FileType * call s:KillTheFuckingFormatters()

" }}}

" はてなパクリ {{{

" powerline is better :D
if 0
  set statusline&

  function! GetB()
    let c = matchstr(getline('.'), '.', col('.') - 1)
    let c = iconv(c, &enc, &fenc)
    return String2Hex(c)
  endfunction

  " :help eval-examples
  " The function Nr2Hex() returns the Hex string of a number.
  func! Nr2Hex(nr)
    let n = a:nr
    let r = ''
    while n
      let r = '0123456789ABCDEF'[n % 16] . r
      let n = n / 16
    endwhile
    return r
  endfunc

  " The function String2Hex() converts each character in a string to a two
  " character Hex string.
  func! String2Hex(str)
    let out = ''
    let ix = 0
    while ix < strlen(a:str)
      let out = out . Nr2Hex(char2nr(a:str[ix]))
      let ix = ix + 1
    endwhile
    return out
  endfunc

  "ステータスラインに文字コードと改行文字を表示する
  function! CharCount ()
    if exists('b:charCounterCount')
      return b:charCounterCount
    else
      return 0
    endif
  endfunc

  command! -bar InitStatusLine set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V,%{CharCount()}%8P
  MeowtoCmd VimEnter * InitStatusLine
endif

" }}}

" テンプレ自動設定 {{{

function! s:LoadTemplate()
  if &filetype == ''
    return
  endif
  " ファイルがほとんど空の時だけだよ！
  if getfsize(bufname('')) > 10
    return
  endif
  let filename = $HOME . '/.vim/template/' . &filetype . '.txt'
  if !filereadable(filename)
    return
  endif
  execute '0read ' . filename
  normal G
  setlocal fileencoding=utf8
  update
  edit
endfunction

command! -bar LoadTemplate :call s:LoadTemplate()
MeowtoCmd FileType * :call s:LoadTemplate()

" }}}

" 関数 {{{

function! Size ()
  let r = 0
  for i in range(1, line('$'))
    if match(getline(i), '^#')
      let r += len(getline(i))
    endif
  endfor
  echo r
endfunction

function! InsertText (s)
  let px = getpos('.')[2]
  let line = getline('.')
  let oline = strpart(line, 0, px)  . a:s . strpart(line, px, 1000)
  echo oline
  call setline('.', oline)
endfunction

function! InsertDate ()
  let d = system('date')
  call InsertText(strpart(d, 0, strlen(d) - 1))
endfunction

function! EatChar (pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

function! EatSpace ()
  return EatChar('\s')
endfunc

" }}}


"  ____ ____ ____ ____ ____ ____ ____ ____ ____
" ||h |||i |||g |||h |||l |||i |||g |||h |||t ||
" ||__|||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

" 行末のスペースを目立たせる {{{

set listchars+=trail:#

function! s:HighlightTrailingSpaces ()
  " 一部のバッファでは、やらない
  if &modifiable && match(bufname('%'), '_ColorV_3\.0') < 0 && match(&filetype, '^\(help\|J6uil\|vimshell\|int-.*\)$') < 0
    match WhitespaceEOL /[[:space:]　\t]\+$/
  else
    match WhitespaceEOL /\[^\s\S\]/
  endif
endfunction

MeowtoCmd ColorScheme * highlight WhitespaceEOL ctermbg=red guibg=red
MeowtoCmd BufNewFile,WinEnter,BufEnter,BufWinEnter,FileType * call s:HighlightTrailingSpaces()

" }}}

" 地蔵でディレクトリ作る {{{
" http://vim-users.jp/2011/02/hack202/

augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

" }}}


"  ____ ____ ____ ____ ____ ____ ____
" ||c |||o |||m |||m |||a |||n |||d ||
" ||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|

" *.archive に選択範囲を移動 {{{

function! Archive(comment) range
  let l:basefn = expand('%:p')
  if l:basefn == ''
    echoerr 'No filename'
    return
  endif
  execute (a:firstline . ',' . a:lastline) . 'delete'
  if a:comment != ""
    let l:prefix = a:comment . ' - '
  else
    let l:prefix = ''
  endif
  let l:content = "\n\n\n[" . l:prefix . system('date | tr --delete "\n"') . "]\n\n" . @"
  call vimproc#write(l:basefn . '.archive', l:content, 'a')
endfunction
command! -nargs=* -range Archive <line1>,<line2>call Archive(<q-args>)

" }}}

" chmod {{{
function! s:Chmod(perm)
  let res = system('chmod ' . a:perm . ' ' . shellescape(expand('%')))
  write
  edit
endfunction
command! -nargs=1 Chmod :call s:Chmod(<q-args>)
" }}}

" CSV カラムハイライト {{{
" http://vim-users.jp/2009/09/hack78/

function! CSVH(x)
    execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
    execute 'normal ^'.a:x.'f,'
endfunction

command! -nargs=1 Csvhl :call CSVH(<args>)

MeowtoCmd FileType csv nnoremap <buffer> <Leader>i :Csvhl<Space>

" }}}

" Encoding {{{

" http://www.kawaz.jp/pukiwiki/?vim

if 1

  let s:default_encoding = 'utf-8'

  " 文字コードの自動認識
  if &encoding !=# 'utf-8'
    set encoding=japan
    set fileencoding=japan
  endif

  if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    " iconvがeucJP-msに対応しているかをチェック
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
      let s:enc_euc = 'eucjp-ms'
      let s:enc_jis = 'iso-2022-jp-3'
      " iconvがJISX0213に対応しているかをチェック
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
      let s:enc_euc = 'euc-jisx0213'
      let s:enc_jis = 'iso-2022-jp-3'
    endif
    " fileencodingsを構築
    if &encoding ==# 'utf-8'
      let s:fileencodings_default = &fileencodings
      let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
      let &fileencodings = &fileencodings .','. s:fileencodings_default
      unlet s:fileencodings_default
    else
      let &fileencodings = &fileencodings .','. s:enc_jis
      set fileencodings+=utf-8,ucs-2le,ucs-2
      if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
        set fileencodings+=cp932
        set fileencodings-=euc-jp
        set fileencodings-=euc-jisx0213
        set fileencodings-=eucjp-ms
        let &encoding = s:enc_euc
        let &fileencoding = s:enc_euc
      else
        let &fileencodings = &fileencodings .','. s:enc_euc
      endif
    endif
    " 定数を処分
    unlet s:enc_euc
    unlet s:enc_jis
  endif

  " 日本語を含まない場合は fileencoding に s:default_encoding を使うようにする
  if has('autocmd')
    function! AU_ReCheck_FENC()
      if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
        let &fileencoding=s:default_encoding
      endif
    endfunction
    MeowtoCmd BufReadPost * call AU_ReCheck_FENC()
  endif

  " 改行コードの自動認識
  set fileformats=unix,dos,mac

  " □とか○の文字があってもカーソル位置がずれないようにする
  if exists('&ambiwidth')
    set ambiwidth=double
  endif

endif

set fileencoding=utf-8

" }}}

" Execlip {{{

function! s:Execlip()
  for l:cmd in split(@*, '\n')
    execute l:cmd
  endfor
endfunction
command! -bar Execlip call s:Execlip()

" }}}

" TabpageCD - wrapper of :cd to keep cwd for each tabpage {{{

" Map [n] ,cd :<C-u>TabpageCD %:p:h<CR>
" Map [n] <Space>cd :<C-u>lcd %:p:h<CR>

command!
\ -bar -complete=dir -nargs=?
\ CD
\ TabpageCD <args>
command!
\ -bar -complete=dir -nargs=?
\ TabpageCD
\ execute 'cd' fnameescape(expand(<q-args>))
\ | let t:cwd = getcwd()

MeowtoCmd TabEnter *
\ if exists('t:cwd') && !isdirectory(t:cwd)
\ | unlet t:cwd
\ | endif
\ | if !exists('t:cwd')
\ | let t:cwd = getcwd()
\ | endif
\ | execute 'cd' fnameescape(expand(t:cwd))

" }}}

" カレントファイルのパスをクリプボぅ! {{{

command! -bang -bar CopyCurrentFilepath :call s:CopyCurrentFilepath('<bang>')
function! s:CopyCurrentFilepath (bang)
  let l:path = expand('%n')
  let l:result = l:path
  if a:bang == '!'
    let l:result = printf('L%d@%s', line('.'), l:result)
  endif
  let @* = l:result
endfunction

" }}}

" スクラッチバッファ {{{

function! s:Scratch ()
  new
  setlocal buftype=nowrite
endfunction
command! -bar Scratch :call s:Scratch()

" }}}

" バージョン番号部分を置換 {{{

function! ReplaceVersions ()
  1
  M/\d+\.\d+\.\d+
  let current = matchstr(getline('.'), '\d\d*\.\d\d*\.\d\d*')
  let new = input('new version number: ', current)
  execute '%s/' . current . '/' . new . '/gc'
endfunction
command! -bar -nargs=0 ReplaceVersions call ReplaceVersions()

" }}}

" ヘルプタグ {{{

" helptag ~/.vim/doc
function! s:MakeHelpTags ()
  echomsg 'Making help tags...'
  for l:path in split(&runtimepath, ',')
    let l:docpath = path . '/doc'
    if match(l:path, '^/usr/') < 0 && isdirectory(docpath) && len(glob(docpath . '/*')) > 0
      try
        echomsg path
        execute 'helptags ' . docpath
      catch
        echohl Error
        echomsg 'Error (' . v:exception . '): ' . path
        echohl None
      endtry
    endif
  endfor
  " No plugins on ~/.vim
  " helptags ~/.vim/doc
  echomsg 'Done.'
endfunction

command! -bar MakeHelpTags :call s:MakeHelpTags()

" }}}

" 一行コマンド {{{

" vimrc編集
command! -bar Rc e ~/.vimrc
command! -bar Grc e ~/.gvimrc
command! -bar Src e ~/.bashrc | split ~/.zshrc

" 再エンコード
command! -nargs=1 Reenco e ++enc=<args>

" 日付挿入
command! -bar Date normal! o<ESC>!!date<CR>==
command! -bar Idate normal! :call InsertDate()<CR>

" Vimp のテンプレ挿入
command! -bar -nargs=0 VimpTemplate r ~/.vimperator/default/script/plugin-template.js

" 行末の空白をのぞく
command! -bar RemoveTrailingSpaces %S/[\s　]+$//c

" エンコーディング指定オープン
command! -bang -complete=file -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
command! -bang -complete=file -nargs=? Sjis edit<bang> ++enc=cp932 <args>
command! -bang -complete=file -nargs=? Euc edit<bang> ++enc=eucjp <args>
command! -bang -complete=file -nargs=? WUtf8 write<bang> ++enc=utf-8 <args>
command! -bang -complete=file -nargs=? WSjis write<bang> ++enc=cp932 <args>
command! -bang -complete=file -nargs=? WEuc write<bang> ++enc=eucjp <args>

" ファイルリネーム - http://vim-users.jp/2009/05/hack17/
command! -nargs=1 -complete=file Rename save <args>|call delete(expand('#'))

"シンタックスの再同期
command! -bar SSF syntax sync fromstart

" }}}

" 戦闘力 {{{

function! s:Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo s:Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
command! -bar -bang -nargs=? -complete=file GScouter
\        echo s:Scouter(empty(<q-args>) ? $MYGVIMRC : expand(<q-args>), <bang>0)

" }}}

" numeronym -> n7m {{{

function! Numeronym(word)
  let l:m = matchlist(a:word, '^\(.\)\(.*\)\(.\)$')
  return l:m[1] . string(len(l:m[2])) . l:m[3]
endfunction

function! ReplaceWithNumeronym()
  let l:word = Numeronym(expand('<cword>'))
  execute 'normal ' . 'caw' . l:word
endfunction

command! Numeronym call ReplaceWithNumeronym()

" }}}

" XMonad xc を使ってウィンドウをリフレッシュ {{{

let s:previous_window_refreshed_time = [0, 0]
function! s:XMonadRefreshWindow()
  let l:delta = reltime(s:previous_window_refreshed_time)
  " FIXME 短期間に連続して実行しない
  if (l:delta[1] > 400000) || (l:delta[0] > 0)
    silent call vimproc#system('~/.xmonad/bin/xc command refresh-window')
    let s:previous_window_refreshed_time = reltime()
  endif
endfunction

command! XMonadRefreshWindow call s:XMonadRefreshWindow()

" }}}

" バルーンで Syntax 情報を得てみる {{{

function! s:BallonSyntax(name)
  set ballooneval
  if a:name == 'syntax'
    set balloonexpr=synIDattr(synID(v:beval_lnum,\ v:beval_col,\ 1),\ 'name')
  elseif a:name == 'fold'
    set balloonexpr=foldballoon#balloonexpr()
  else
    echoerr 'Unknown type: ' . a:name
  endif
endfunction

function! s:BalloonCompl(...)
  return ['syntax', 'fold']
endfunction

command! -nargs=1 -complete=customlist,s:BalloonCompl BallonSyntax call s:BallonSyntax(<q-args>)

" }}}


"  ____ ____ ____ ____ ____ ____
" ||p |||l |||u |||g |||i |||n ||
" ||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|

" airline {{{

if 1
  " https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
  function! GetCharCode()
    " Get the output of :ascii
    redir => ascii
    silent! ascii
    redir END
    if match(ascii, 'NUL') != -1
      return 'NUL'
    endif

    " Zero pad hex values
    let nrformat = '0x%02x'

    let encoding = (&fenc == '' ? &enc : &fenc)

    if encoding == 'utf-8'
      " Zero pad with 4 zeroes in unicode files
      let nrformat = '0x%04x'
    endif

    " Get the character and the numeric value from the return value of :ascii
    " This matches the two first pieces of the return value, e.g.
    " '<F>  70' => char: 'F', nr: '70'
    let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

    " Format the numeric value
    let nr = printf(nrformat, nr)

    return "'". char ."' ". nr
  endfunction

  function! GetEncoding()
    let fenc = strlen(&fenc) >0 ? &fenc : ''
    let ff = strlen(&ff) > 0 ? &ff : ''
    return fenc . '[' . ff . ']'
  endfunction

  " Display charcode, fileencoding and fileformat.
  let g:airline_section_y = '%{GetCharCode()} %{g:airline_right_alt_sep} %{GetEncoding()}'

  let g:airline_powerline_fonts = 0
  let g:airline_left_sep = '»'
  let g:airline_left_sep = ''
  let g:airline_right_sep = '«'
  let g:airline_right_sep = ''
  let g:airline_linecolumn_prefix = '␊ '
  let g:airline_linecolumn_prefix = '␤ '
  let g:airline_linecolumn_prefix = '¶ '
  let g:airline#extensions#branch#symbol = '⎇  '
  let g:airline#extensions#paste#symbol = 'ρ '
  let g:airline#extensions#paste#symbol = 'Þ '
  let g:airline#extensions#paste#symbol = '∥ '
  let g:airline#extensions#whitespace#symbol = 'Ξ'
endif

" }}}

" AlterCmd {{{

call altercmd#load()
AlterCommand ag Ag
AlterCommand align Alignta
AlterCommand cd TabpageCD
AlterCommand execlip Execlip
AlterCommand nyancat Unite -update-time=50 -winheight=30 nyancat_anim
AlterCommand ref Ref
AlterCommand res Restart
AlterCommand ssf SSF
AlterCommand tm tabmove

" }}}

" ChangeLog {{{

let g:changelog_dateformat='%Y-%m-%d (%a)'
let g:changelog_username = 'ANekoS'
let g:changelog_date_end_entry_search = '^\s*$'

" }}}

" eregexp {{{

" http://d.hatena.ne.jp/h1mesuke/20100703/p1
let g:eregex_meta_chars = '^$()|[]{}.*+?\/'
let g:vregex_meta_chars = '^$|[].*\/'
"nnoremap <silent> * :M/<C-r>=substitute(escape(expand("<cword>"),g:vregex_meta_chars),"\n",'\\n','g')<CR><CR>
vnoremap <silent> * "vy/<C-r>=substitute(escape(@v, g:vregex_meta_chars), "\n", '\\n', 'g')<CR><CR>

" }}}

" essk.vim {{{
let g:eskk#dictionary = {
\ 'path': $HOME . '/.eskk/dic/SKK-JISYO.L',
\ 'sorted': 0,
\ 'encoding': 'eucjp-ms',
\}
" }}}

" fontzoom {{{
"
let g:fontzoom_no_default_key_mappings=1
nnoremap <silent> +
\  :<C-u>Fontzoom +<C-r>=v:count1<CR><CR>:XMonadRefreshWindow<CR>
nnoremap <silent> -
\  :<C-u>Fontzoom -<C-r>=v:count1<CR><CR>:XMonadRefreshWindow<CR>

" }}}

" ghcmod-vim {{{

let g:ghcmod_ghc_options = ['-ilib']

" }}}

" gitgutter {{{

let g:gitgutter_enabled = 0

" }}}

" haskell_doc {{{

" g:haddock_browser
" 無視
let g:haddock_index = 1

" }}}

" IndentLine {{{

let g:indentLine_enabled = 0
let g:indentLine_color_gui = '#343434'

" }}}

" J6uil {{{

let g:J6uil_no_default_keymappings = 1

function! s:J6uilInit()
  nmap <silent> <buffer> a                  <Plug>(J6uil_open_say_buffer)
  nmap <silent> <buffer> <Leader><Leader>r  <Plug>(J6uil_reconnect)
  nmap <silent> <buffer> <Leader><Leader>d  <Plug>(J6uil_disconnect)
  nmap <silent> <buffer> r                  <Plug>(J6uil_unite_rooms)
  nmap <silent> <buffer> u                  <Plug>(J6uil_unite_members)
  nmap <silent> <buffer> <CR>               <Plug>(J6uil_action_enter)
  nmap <silent> <buffer> o                  <Plug>(J6uil_action_open_links)
endfunction

MeowtoCmd FileType J6uil call s:J6uilInit()

" }}}

" jscomplete {{{

let g:jscomplete_use = ['dom', 'moz', 'xpcom']

" }}}

" LiName {{{

function! s:LiNameInit()
  setlocal shiftwidth=8 tabstop=8
  if filereadable(expand('~/local/script/liname/unite.vim'))
    source ~/local/script/liname/unite.vim
  endif
endfunction

command! -bar LiNameSort sort /^\d\+\t/
MeowtoCmd BufRead liname-*.txt call s:LiNameInit()

function! s:LiNameCd(dir)
  let l:dir = substitute(a:dir, '\/$', '', '')
  for l:ln in range(1, line('$'))
    let l:line = getline(l:ln)
    call setline(l:ln, substitute(l:line, '\t', '\t' . l:dir . '/', ''))
  endfor
endfunction
command! -nargs=1 -complete=dir LiNameCd call s:LiNameCd(<q-args>)

" }}}

" lisp {{{

let g:lisp_instring = 1
let g:lisp_rainbow = 1

" }}}

" manga-osort {{{

let g:manga_osort_default_options = {'ignorecase' : 1}
let g:manga_osort_alias = {
  \   '#zsh' : {'pattern' : '^#', 'key' : 1},
  \   '#paragraph' : {'pattern' : '^\S'},
  \   '#neobundle' : {'keyprefix' : 'NeoBundle\S*', 'pattern' : 'NeoBundle'},
  \   '#vimrc' : {'pattern' : '^"'},
  \ }

" }}}

" mkdpreview {{{

let g:mkdpreview_python_path = '/usr/bin/python2'

" }}}

" Neo Complete Cache {{{

" imap <silent><C-l>     <Plug>(neocomplcache_snippets_expand)
" smap <silent><C-l>     <Plug>(neocomplcache_snippets_expand)
" nmap <silent><C-e>     <Plug>(neocomplcache_keyword_caching)
" imap <expr><silent><C-e>     pumvisible() ? "\<C-e>" : "\<Plug>(neocomplcache_keyword_caching)"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 0
let g:neocomplcache_enable_ignore_case = 0
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_max_menu_width = 20

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"let g:neocomplcache_omni_function_list = {'clojure' : 'vimclojure#OmniCompletion'}
" Clojure 用に辞書追加
function! s:AddClojureDictionaries ()
  " NeoComplCacheEnable
  for l:vcdir in filter(split(&rtp, ','), 'v:val =~ "/vimclojure$"')
    if !exists('g:neocomplcache_dictionary_filetype_lists')
      let g:neocomplcache_dictionary_filetype_lists = {}
    endif
    let l:val = substitute(globpath(l:vcdir, 'ftplugin/clojure/*.txt'), "\n", ',', 'g')
    let g:neocomplcache_dictionary_filetype_lists['clojure'] = l:val
    let g:neocomplcache_dictionary_filetype_lists['int-lein'] = l:val
  endfor
  " NeoComplCacheCachingDictionary
endfunction
call s:AddClojureDictionaries()

" }}}

" NeoSnippet {{{

imap <C-q>     <Plug>(neosnippet_expand_or_jump)
smap <C-q>     <Plug>(neosnippet_expand_or_jump)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" }}}

" poslist {{{

let g:poslist_histsize = 1000

" }}}

" powerline {{{

" Do :PowerlineClearCache and restart, when you changed.
" let g:Powerline_symbols = 'fancy'
" call Pl#Theme#InsertSegment('charcode', 'after', 'filetype')

" }}}

" Quickhl {{{

let g:quickhl_keywords = [
\ 'IMPLEMENTME',
\ ]

" }}}

" Ref {{{

let g:ref_clojure_cmd = 'clojure'
let g:ref_clojure_precode = "(use '(clojure.contrib str-utils def repl-utils macro-utils))"

" たぶんいらない
"let g:ref_clojure_classpath = ['/usr/local/java/clojure-contrib.jar']

let g:ref_detect_filetype = {
  \   'zsh': 'man',
  \   'bash': 'man',
  \   'sh': 'man',
  \ }

let g:ref_source_webdict_use_cache = 1

let g:ref_source_webdict_sites = {
  \   'wikipedia:ja': 'http://ja.wikipedia.org/wiki/%s',
  \   'wiktionary': {
  \     'url': 'http://ja.wiktionary.org/wiki/%s',
  \     'keyword_encoding': 'utf-8',
  \     'cache': 1,
  \   },
  \ }

let g:ref_source_webdict_sites.default = 'wikipedia:ja'

" wiktionary 出力に対するフィルタ。最初の数行を削除している。
function! g:ref_source_webdict_sites.wiktionary.filter(output)
  return join(split(a:output, "\n")[18 :], "\n")
endfunction

MeowtoCmd FileType ref call s:initialize_ref_viewer()
function! s:initialize_ref_viewer()
  " nmap <buffer> b <Plug>(ref-back)
  " nmap <buffer> f <Plug>(ref-forward)
  nnoremap <buffer> q <C-w>c
  setlocal nonumber
endfunction

"}}}

" restart.vim {{{

function! s:OnRestart()
  return join([
  \   printf("let &guifont = '%s'", &guifont),
  \   'call system("~/.xmonad/bin/xc command refresh-window")'
  \ ], ' | ')
endfunction

let g:restart_sessionoptions = 'blank,buffers,curdir,folds,help,localoptions,tabpages'
let g:restart_save_window_values = 0
let g:restart_save_fn = [function('s:OnRestart')]

" }}}

" rmine {{{

let g:rmine_server_url = 'http://its.aoi/redmine'
let g:rmine_access_key = 'd5c269b625f6e764b8435a472e2c00df82bcc43d'
MeowtoCmd FileType rmine_issues setlocal nonumber

" }}}

" Ruby Syntax - syntax/ruby.vim {{{

let g:ruby_minlines = 100

" }}}

" runes {{{

let g:runes_table = {
\   'arrows': {
\     '1': '↙',
\     '2': '↓',
\     '3': '↘',
\     '4': '←',
\     '6': '→',
\     '7': '↖',
\     '8': '↑',
\     '9': '↗',
\   },
\   'ogham': {
\   'b':'ᚁ',
\   'l':'ᚂ',
\   'f':'ᚃ',
\   'v':'ᚃ',
\   's':'ᚄ',
\   'n':'ᚅ',
\   'h':'ᚆ',
\   'd':'ᚇ',
\   't':'ᚈ',
\   'c':'ᚉ',
\   'q':'ᚊ',
\   'm':'ᚋ',
\   'g':'ᚌ',
\   'N':'ᚍ',
\   'z':'ᚎ',
\   'r':'ᚏ',
\   'a':'ᚐ',
\   'o':'ᚑ',
\   'u':'ᚒ',
\   'e':'ᚓ',
\   'i':'ᚔ',
\   'E':'ᚕ',
\   'O':'ᚖ',
\   'U':'ᚗ',
\   'I':'ᚘ',
\   'A':'ᚙ'
\   }
\ }

" ogham
" ng -> N
" SS -> 該当文字がUnicodeになし
" EA -> E
" OI -> O
" UI -> U
" IA -> I
" AE -> A

" }}}

" slimv {{{

let g:paredit_mode = 0
let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim-temp/bundle/slimv.vim/slime/start-swank.lisp &'
let g:slimv_leader = ',,'

" }}}

" submode.vim {{{

" from http://d.hatena.ne.jp/tyru/20100502/vim_mappings

" マッピングさせないようにする
let g:wm_move_down  = ''
let g:wm_move_up    = ''
let g:wm_move_left  = ''
let g:wm_move_right = ''

" Change current window size.
call submode#enter_with('winsize', 'n', '', ',sw', '<Nop>')
call submode#leave_with('winsize', 'n', '', '<Esc>')
call submode#map       ('winsize', 'n', '', 'j', '<C-w>-:redraw<CR>')
call submode#map       ('winsize', 'n', '', 'k', '<C-w>+:redraw<CR>')
call submode#map       ('winsize', 'n', '', 'h', '<C-w><:redraw<CR>')
call submode#map       ('winsize', 'n', '', 'l', '<C-w>>:redraw<CR>')

" Scroll by j and k.
" TODO Stash &scroll value.
" TODO Use <excmd>j, <excmd>k
" TODO Make utility function to generate current shortest <SID> map.
call submode#enter_with('s', 'n', '', '<Space>j', '<C-d>:redraw<CR>')
call submode#enter_with('s', 'n', '', '<Space>k', '<C-u>:redraw<CR>')
call submode#leave_with('s', 'n', '', '<Esc>')
call submode#map       ('s', 'n', '', 'j', '<C-d>:redraw<CR>')
call submode#map       ('s', 'n', '', 'k', '<C-u>:redraw<CR>')
call submode#map       ('s', 'n', '', 'a', ':let &l:scroll -= 3<CR>')
call submode#map       ('s', 'n', '', 's', ':let &l:scroll += 3<CR>')

" }}}

" tagbar {{{

let g:tagbar_left = 1

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }

" }}}

" Unite {{{

let g:unite_enable_start_insert = 1
let g:unite_enable_smart_case = 1
let g:unite_source_file_ignore_pattern = ''
let g:unite_source_file_ignore_pattern .=
      \ 'tmp\|bundle\|_build\|_darcs\|\.git\|target\|\.idea.*\|logs\|\%(' . substitute('png jpeg jpg gif jar dcu manifest dll exe exp o so bak sw res dep idb pdb user ilk ncb class hi', ' ', '\\|', 'g') . '\)$'
let g:unite_source_file_rec_ignore_pattern = g:unite_source_file_ignore_pattern
let g:unite_source_directory_mru_ignore_pattern = ''

let g:unite_kind_openable_cd_command = 'TabpageCD'
let g:unite_source_file_mru_ignore_pattern = 'temp'

" Grep with ag
let g:unite_source_grep_command = '/bin/ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

" }}}

" unite-haddock {{{

let g:unite_source_haddock_browser = '/bin/urxvt -e w3m'

" }}}

" unite-hyperspec {{{

let g:unite_hyperspec_base_dir='/usr/share/doc/HyperSpec/'

" }}}

" vim2hs {{{

let g:haskell_conceal_wide = 0
let g:haskell_conceal      = 0

" }}}

" VimClojure {{{

let vimclojure#WantNailgun = 0
let vimclojure#NailgunClient = '~/.vim-plugins/vimclojure/bin/ng'

" }}}

" vimfiler {{{

" source ~/.vimfilerrc

" }}}

" VimShell {{{

" VimShell に選択文字列を送信
function! s:vs_send_string (line1, line2)
  let l:string = ''
  for l:line in getline(a:line1, a:line2)
    let l:string .= substitute(l:line, '^\s\+|\s\+$', ' ', 'g')
  endfor
  execute 'VimShellSendString ' . l:string
endfunction

" エラー行のファイルを開く
function! OpenerizedOpen(path)
  for l:tn in range(1, tabpagenr('$'))
    for l:bn in tabpagebuflist(l:tn)
      if a:path == expand('#' . l:bn . ':p')
        execute string(l:tn) . 'tabnext'
        let l:wn = bufwinnr(l:bn)
        if l:wn >= 0
          execute 'normal ' . l:wn . "\<C-w>\<C-w>"
          return 666
        endif
      endif
    endfor
  endfor
  execute 'tabedit ' . a:path
endfunction

function! JumpSourceLine()
  let l:curln = getpos('.')[1]

  for l:back in range(0, 10)
    let l:line = getline(l:curln - l:back)
    let l:match = matchlist(l:line, '\(/[-a-zA-Z./0-9]\+\):\(\d\+\)')[1:2]
    if len(l:match) > 0
      break
    endif
  endfor

  if len(l:match) <= 0
    return 0
  endif

  let [filepath, linenum] = l:match
  call OpenerizedOpen(l:filepath)
  execute l:linenum
  nnoremap <buffer> <Leader>x :<C-u>tabclose<CR>
  normal zz
endfunction

let g:vimshell_split_command = 'split'
let g:vimshell_interactive_cygwin_path = 'e:/cygwin/bin/'
let g:vimshell_no_default_keymappings = 1

" lein repl を起動
command! -bar Lein execute ':VimShellInteractive lein repl'

command! -bar -range -nargs=? VimShellJoinedSendString call s:vs_send_string(<line1>, <line2>)
"command! VimShellIntRestart :call vimshell#int_mappings#restart_command()

vnoremap <silent> <Leader>S :VimShellJoinedSendString<CR>
vnoremap <silent> <Leader>s :VimShellSendString<CR>

command! -bar Ghci :VimShellInteractive ghci

function! s:DefineVimshellMappings()
  nmap <buffer>   <CR>       <Plug>(vimshell_enter)
  nmap <buffer>   <CR>       <Plug>(vimshell_enter)
  nmap <buffer>   q          <Plug>(vimshell_hide)
  nmap <buffer>   Q          <Plug>(vimshell_exit)
  nmap <buffer>   <Leader>p  <Plug>(vimshell_previous_prompt)
  nmap <buffer>   <Leader>n  <Plug>(vimshell_next_prompt)
  nmap <buffer>   <C-k>      <Plug>(vimshell_delete_previous_output)
  nmap <buffer>   <C-y>      <Plug>(vimshell_paste_prompt)
  nmap <buffer>   E          <Plug>(vimshell_move_end_argument)
  nmap <buffer>   cc         <Plug>(vimshell_change_line)
  nmap <buffer>   dd         <Plug>(vimshell_delete_line)
  nmap <buffer>   I          <Plug>(vimshell_insert_head)
  nmap <buffer>   A          <Plug>(vimshell_append_end)
  nmap <buffer>   i          <Plug>(vimshell_insert_enter)
  nmap <buffer>   a          <Plug>(vimshell_append_enter)
  nmap <buffer>   ^          <Plug>(vimshell_move_head)
  nmap <buffer>   <C-c>      <Plug>(vimshell_hangup)
  nmap <buffer>   <C-l>      <Plug>(vimshell_clear)
  nmap <buffer>   <C-z>      <Plug>(vimshell_execute_by_background)

  imap <buffer>   <CR>       <Plug>(vimshell_enter)
  imap <buffer>   <C-l>      <Plug>(vimshell_history_unite)
  imap <buffer>   <TAB>      <Plug>(vimshell_command_complete)
  imap <buffer>   <C-a>      <Plug>(vimshell_move_head)
  imap <buffer>   <C-u>      <Plug>(vimshell_delete_backward_line)
  imap <buffer>   <C-w>      <Plug>(vimshell_delete_backward_word)
  imap <buffer>   <C-z>      <Plug>(vimshell_execute_by_background)
  imap <buffer>   <C-t>      <Plug>(vimshell_insert_last_word)
  imap <buffer>   <C-c>      <Plug>(vimshell_interrupt)
  imap <buffer>   <C-h>      <Plug>(vimshell_delete_backward_char)
  imap <buffer>   <BS>       <Plug>(vimshell_delete_backward_char)
  imap <buffer>   <C-k>      <Plug>(vimshell_delete_forward_line)

  nnoremap <buffer> <Leader>o :<C-u>call s:JumpSourceLine()<CR>
endfunction
MeowtoCmd! FileType vimshell call s:DefineVimshellMappings()

"}}}

" Zen Coding {{{

" let g:user_zen_leader_key = '<C-k>'

let g:user_zen_settings = {
\  'indentation' : '  ',
\  'ruby' : {
\    'aliases' : {
\      'req' : 'require '
\    },
\  },
\  'perl' : {
\    'aliases' : {
\      'req' : 'require '
\    },
\    'snippets' : {
\      'use' : "use strict\nuse warnings\n\n",
\      'warn' : "warn \"|\";",
\    }
\  }
\}

" }}}

" セッションの保存 {{{

function! s:MkSession(name)
  let l:fn = a:name

  if match(a:name, '\S\+') < 0
    let l:fn = (v:this_session ==# '' ? 'Session.vim' : v:this_session)
  elseif match(a:name, 'Session\.vim$')
    let l:fn = a:name . 'Session.vim'
  endif

  let l:fn = fnamemodify(l:fn, ':p')
  let l:hfn = fnamemodify(l:fn, ':~')

  if filereadable(l:fn) && (input('Overwrite to "' . l:hfn . '"? (y/n) ') !=# 'y')
    echoerr 'Canceled!'
    return 0
  endif
  redraw
  echo 'Session has been made: ' . l:hfn
  execute 'mksession! ' . l:hfn
endfunction

command! -complete=file -nargs=* MkSession call s:MkSession(<q-args>)
AlterCommand mks MkSession

" }}}


"  ____ ____ ____ ____ ____ ____ ____ ____
" ||f |||i |||l |||e |||t |||y |||p |||e ||
" ||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

" Set filetype {{{

MeowtoCmd BufNewFile,BufRead buildfile setlocal filetype=ruby

" }}}

" Quickfix {{{

function! s:InitQuickfix()
  nnoremap <buffer> r :<C-u>Qfreplace<CR>
  nnoremap <buffer> <CR> <CR>

  if neobundle#is_installed('unite-quickfix')
    nnoremap <buffer> u :<C-u>cclose<Bar>Unite quickfix<CR>
  endif
endfunction

MeowtoCmd FileType qf call s:InitQuickfix()

" }}}

" XML {{{

" ref: https://github.com/kana/config/blob/master/vim/personal/dot.vimrc
MeowtoCmd FileType html,xhtml,xml,xslt call s:on_FileType_xml()
function! s:on_FileType_xml()
  " To deal with namespace prefixes and tag-name-including-hyphens.
  setlocal iskeyword+=45  " hyphen (-)
  setlocal iskeyword+=58  " colon (:)

  " Support to input some parts of tags.
  inoremap <buffer> <LT>?  </
  imap <buffer> ?<LT>  <LT>?
  inoremap <buffer> ?>  />
  imap <buffer> >?  ?>

  " Support to input some blocks.
  inoremap <buffer> <LT>!C  <LT>![CDATA[]]><Left><Left><Left>
  inoremap <buffer> <LT>#  <LT>!----><Left><Left><Left><C-r>=
                          \<SID>on_FileType_xml_comment_dispatch()
                          \<Return>

  " Complete proper end-tags.
  " In the following description, {|} means the cursor position.

    " Insert the end tag after the cursor.
    " Before: <code{|}
    " After:  <code>{|}</code>
  inoremap <buffer> <LT><LT>  ><LT>/<C-x><C-o><C-r>=
                             \<SID>keys_to_stop_insert_mode_completion()
                             \<Return><C-o>F<LT>

    " Wrap the cursor with the tag.
    " Before: <code{|}
    " After:  <code>
    "           {|}
    "         </code>
  inoremap <buffer> >>  ><Return>X<Return><LT>/<C-x><C-o><C-r>=
                       \<SID>keys_to_stop_insert_mode_completion()
                       \<Return><C-o><Up><BS>
endfunction

" }}}


"  ____ ____ ____ ____ ____
" ||c |||o |||l |||o |||r ||
" ||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|

" color {{{

colorscheme olive
" colorscheme random

MeowtoCmd ColorScheme * silent! execute 'AirlineTheme ' . g:colors_name

let g:airline_theme = 'zenburn'

" }}}

" CUI - カラースキーム {{{

if !has('gui_running')
  command! -bar ReloadColors set t_Co=256 t_SI=[3\ q t_EI=[1\ q | colorscheme molokai | colorscheme molokai-fix
  MeowtoCmd VimEnter * ReloadColors
endif

" }}}


"  ____ ____ ____ ____ ____
" ||l |||o |||c |||a |||l ||
" ||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|

" ~/.vimrc.local {{{

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" }}}
