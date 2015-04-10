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

"  ______
" < init >
"  ------
"   \
"    \   \_\_    _/_/
"     \      \__/
"            (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

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

augroup Meowrc
  autocmd!
augroup END

command! -bang -nargs=* MeowtoCmd autocmd<bang> Meowrc <args>

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

  " □とか○の文字があってもカーソル位置がずれないようにする
  if exists('&ambiwidth')
    set ambiwidth=double
  endif

endif

set fileencoding=utf-8

set encoding=utf8
scriptencoding utf8

" }}}

" NeoBundle {{{

filetype plugin indent off     " required!

if has('vim_starting')
 set runtimepath+=~/.vim-temp/bundle/neobundle.vim/
 set runtimepath+=~/.vim-eclim/
 call neobundle#begin(expand('~/.vim-temp/bundle/'))
endif

" let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Color tool
NeoBundleLazy 'cocopon/colorswatch.vim', {'autoload' : {'commands' : ['ColorSwatchGenerate']}}
NeoBundle 'Rykka/colorv.vim'
NeoBundle 'Rykka/galaxy.vim'

" Color
NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'aereal/vim-magica-colors'
NeoBundle 'ajh17/Spacegray.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'atelierbram/vim-colors_atelier-schemes'
NeoBundle 'bluecloud'
NeoBundle 'bluntpeak/bluntpeak-vim-colors'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'ciaranm/inkpot'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'Colour-Sampler-Pack'
NeoBundle 'djjcast/mirodark'
NeoBundle 'Donearm/Ubaryd'
NeoBundle 'fisadev/fisa-vim-colorscheme'
NeoBundle 'git://gist.github.com/187578.git', { 'name' : 'h2u_colors' }
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'Marslo/marslo.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'noahfrederick/vim-noctu'
NeoBundle 'Pychimp/vim-sol'
NeoBundle 'rdark'
NeoBundle 'Risto-Color-Scheme'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'sjl/badwolf'
NeoBundle 'tomasr/molokai'
NeoBundle 'trapd00r/neverland-vim-theme'
NeoBundle 'twilight'
NeoBundle 'uu59/vim-herokudoc-theme'
NeoBundle 'vim-scripts/BusyBee'
NeoBundle 'vim-scripts/darktango.vim'
NeoBundle 'vim-scripts/phd'
NeoBundle 'vol2223/vim-colorblind-colorscheme'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'wabisabi'
NeoBundle 'Wombat'

" Completion
if has('lua')
  NeoBundle 'Shougo/neocomplete'
else
  NeoBundle 'Valloric/YouCompleteMe' " , {'build': {'unix' : './install.sh'}}
endif
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" Format
NeoBundle 'h1mesuke/vim-alignta'

" Game
NeoBundle 'mattn/flappyvird-vim'
NeoBundle 'mattn/habatobi-vim'
NeoBundle 'mattn/invader-vim'
NeoBundle 'rbtnn/puyo.vim'
NeoBundle 'thinca/vim-threes'

" Haskell
NeoBundle 'bitc/lushtags'
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'ujihisa/unite-haskellimport'

" (Java|ECMA|Type)Script
NeoBundle 'salomvary/vim-eslint-compiler'

" Filer
NeoBundle 'justinmk/vim-dirvish'
NeoBundle 'ctrlpvim/ctrlp.vim'

" filetype / syntax
NeoBundle 'freitass/todo.txt-vim'
NeoBundle 'HybridText'
NeoBundle 'mojako/aozora.vim'
NeoBundle 'tpope/vim-markdown'
" NeoBundle 'plasticboy/vim-markdown'
" NeoBundle 'Rykka/riv.vim'

" InputMethod
NeoBundle 'anekos/felis-cat-igirisu-toast-express'

" Library
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'Shougo/vimproc',
  \ {
  \   'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak'
  \   }
  \ }
NeoBundle 'vim-jp/vital.vim'

" Lisp
NeoBundle 'mopemope/unite-hyperspec'
" NeoBundle 'vim-scripts/slimv.vim' " vim update issue s:

" Net
NeoBundle 'basyura/J6uil.vim'
NeoBundle 'basyura/TweetVim'
NeoBundle 'basyura/twibill.vim'
" NeoBundle 'tsukkee/lingr-vim'
NeoBundle 'heavenshell/vim-slack'

" Operator
NeoBundle 'kana/vim-operator-replace'

" Ref
NeoBundle 'taka84u9/vim-ref-ri'
NeoBundle 'thinca/vim-ref'
NeoBundle 'ujihisa/ref-hoogle'
NeoBundleLazy 'mattn/excitetranslate-vim', {'depends': 'mattn/webapi-vim', 'autoload' : { 'commands': ['ExciteTranslate']} }

" Ruby
NeoBundle 'vim-ruby/vim-ruby'

" Scala
NeoBundle 'derekwyatt/vim-scala'

" Search
NeoBundle 'dyng/ctrlsf.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'vim-scripts/gtags.vim', {'autoload' : {'filetypes' : ['c', 'cpp', 'java']}}
" NeoBundle 'pelodelfuego/vim-swoop' " my plugin (forked)

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

" TypeScript
NeoBundle 'leafgarland/typescript-vim'
" NeoBundle 'clausreinke/typescript-tool'

" Unite
NeoBundle 'mattn/httpstatus-vim'
NeoBundle 'mattn/unite-mpc'
NeoBundle 'osyo-manga/unite-nyancat_anim'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-locate'

" VCS
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'cohama/agit.vim'
NeoBundleLazy 'gregsexton/gitv', {'autoload': {'commands': ['Gitv']}}
NeoBundle 'hrsh7th/vim-unite-vcs'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundleLazy 'lambdalisue/vim-gita', {'autoload': {'commands': ['Gita']}}
NeoBundle 'tpope/vim-fugitive'

" Misc
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'b4b4r07/vim-shellutils'
NeoBundle 'basyura/rmine.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'cohama/easy-colorcolumn'
NeoBundleLazy 'deris/vim-rengbang', {'autoload': {'commands': ['RengBang', 'RengBangUsePrev', 'RengBangConfirm']}}
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'gregsexton/VimCalc'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'haya14busa/vim-asterisk'
NeoBundle 'http://conque.googlecode.com/svn/trunk/', {'directory' : 'conque'}
NeoBundle 'itchyny/thumbnail.vim'
NeoBundle 'kana/vim-niceblock'
NeoBundle 'kana/vim-submode'
NeoBundle 'kannokanno/previm'
NeoBundleLazy 'Kuniwak/vim-qrcode', {'autoload': {'commands': ['QRCode']}} " gem install rqrcode
NeoBundle 'LeafCage/alti.vim'
NeoBundleLazy 'LeafCage/nebula.vim', {'autoload': {'commands': ['NebulaPutLazy', 'NebulaPutFromClipboard', 'NebulaYankOptions', 'NebulaPutConfig']}}
NeoBundleLazy 'majutsushi/tagbar',
  \ {
  \   'augroup': 'TagbarAutoCmds',
  \   'autoload': {
  \     'commands': [
  \       'TagbarGetTypeConfig',
  \       'TagbarSetFoldlevel',
  \       'TagbarOpen',
  \       'TagbarDebug',
  \       'Tagbar',
  \       'TagbarClose',
  \       'TagbarTogglePause',
  \       'TagbarOpenAutoClose',
  \       'TagbarDebugEnd',
  \       'TagbarCurrentTag',
  \       'TagbarShowTag',
  \       'TagbarToggle'
  \     ]
  \   }
  \ }
NeoBundle 'mattn/benchvimrc-vim'
NeoBundle 'mattn/emmet-vim'
NeoBundleLazy 'osyo-manga/vim-fancy', {'autoload': {'commands': [{'complete': 'customlist,s:complete_list', 'name': 'FancyEnable'}, 'FancyDisable']}}
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'rbtnn/vimconsole.vim'
NeoBundle 'Shougo/vimshell'
NeoBundleLazy 'Shougo/vinarise', {
  \ 'autoload': {
  \   'unite_sources': ['vinarise_analysis'],
  \   'commands': [
  \     {'complete': 'customlist,vinarise#complete', 'name': 'VinariseScript2Hex'},
  \     'VinarisePluginBitmapView',
  \     {'complete': 'customlist,vinarise#complete', 'name': 'Vinarise'},
  \     'VinarisePluginDump',
  \     {'complete': 'customlist,vinarise#complete', 'name': 'VinariseDump'},
  \     {'complete': 'file', 'name': 'VinariseHex2Script'}
  \ ]}}
NeoBundle 'sjl/gundo.vim'
NeoBundle 't9md/vim-quickhl'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'taku-o/vim-batch-source'
NeoBundle 'tasuten/gcalc.vim'
NeoBundle 'thinca/vim-ambicmd'
NeoBundle 'thinca/vim-editvar'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'thinca/vim-portal'
NeoBundle 'thinca/vim-poslist'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-splash'
NeoBundle 'thinca/vim-template'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/capture.vim'
NeoBundle 'tyru/foldballoon.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/restart.vim'
NeoBundle 'tyru/vim-altercmd'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'VOom'
NeoBundleLazy 'Yggdroot/indentLine', {'autoload' : {'commands' : ['IndentLinesReset', 'IndentLinesToggle']}}
NeoBundle 'yuratomo/gmail.vim'
" NeoBundle 'thinca/vim-prettyprint'

" GUI Only
if has('gui')
  NeoBundle 'tyru/banban.vim'
endif

 " }}}

" Unmanaged plugins {{{

if has('vim_starting')
  " Man コマンドを使えるように
  runtime! ftplugin/man.vim
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
  call s:LoadMyPlugin('liname/res/vim')
  call s:LoadMyPlugin('unite-located-session')
  call s:LoadMyPlugin('~/.xmonad/res/vim')
  call s:LoadMyPlugin('unite-font')
  call s:LoadMyPlugin('nox/res/vim')
  call s:LoadMyPlugin('vim-swoop')
endif

" }}}

" Pre 2 {{{

if has('vim_starting')
  call neobundle#end()
endif


filetype plugin indent on
filetype off
syntax enable
silent! language messages ja_JP.UTF-8


" プラグインが入っていないっぽいときは、エラーになりがちなので、ここで終わり
" ~/script/vim/init && NeobundleInstall しようね！
if len(split(expand('~/.vim-temp/bundle/*'))) < 3
  nnoremap ; :
  nnoremap : ;
  echoerr 'Give me "NeoBundleInstall" !!'
  finish
endif

" }}}

"  ________
" < option >
"  --------
"   \
"    \   \_\_    _/_/
"     \      \__/
"            (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

" Options  {{{

" メニューの日本語化を抑止
set langmenu=none

" マウスのモード
behave mswin

" 改行コード
set fileformats=unix,mac,dos
set fileformat=unix

" 行数表示
set number
set relativenumber

" 検索結果をハイライト
set hlsearch

" 括弧の対応表示
set showmatch

" 括弧入力時の対応括弧ジャンプ時間
set matchtime=1

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

" バックアップしない (念の為ディレクトリ設定しておく)
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

" 一行を全部表示
set display=lastline

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

" clipboard
if !has('nvim')
  set clipboard=unnamedplus,autoselect,exclude:cons\|linux
endif

" iskeyword
set iskeyword=@,48-57,_,192-255

" }}}


"  __________
" < mappings >
"  ----------
"   \
"    \   \_\_    _/_/
"     \      \__/
"            (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

" option {{{

" <Leader>
let mapleader = ','

" }}}

" fix {{{

nnoremap <Del> <C-h>
inoremap <Del> <C-h>
cnoremap <Del> <C-h>
nnoremap  <C-h>
inoremap  <C-h>
cnoremap  <C-h>

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

" incsearch.vim FIXME
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
nnoremap /  /\v
nnoremap ?  /\v

" 検索のハイライト
noremap <silent> <Plug>(vimrc-searchafter) Nzz:set hlsearch<CR>
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
nnoremap <silent> <ESC><ESC> :<C-u>set nohlsearch<CR>

" for US KBD
nnoremap ; :
xnoremap ; :
nnoremap : ;
xnoremap : ;

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
xmap p <Plug>(operator-replace)

" Strong refresh
nnoremap <C-l> :<C-u>XMonadRefreshWindow<CR><C-l>

" 自然派
nnoremap Y y$

" 自分で「:.!」って打てばええんや
nnoremap ! :Switch<CR>

" タブ
nnoremap gh 1gt

" }}}

" map {{{

" Save like Emacs
inoremap <C-x><C-s> <ESC>:<C-u>w<CR>a
inoremap <C-x>s <ESC>:<C-u>w<CR>a

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

" Emacs ライクなキャンセル
cnoremap <C-g> <C-c>

" like ranger
nnoremap <expr> cd ":\<C-u>TabpageCD\<Space>" . fnamemodify(get(t:, 'cwd', '~/'), ':~:.')

" 改行
nnoremap <CR> A<CR><ESC>
inoremap <S-CR> <C-o>O

" }}}

" <Leader> {{{

" Leaders
nmap s <Leader>
xmap s <Leader>

" Migemo 検索
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
nnoremap <Leader>tt :<C-u>Unite -immediately tab:no-current<CR>
nnoremap <Leader>tm :<C-u>tabnew<Bar>Unite -unique -buffer-name=files file_mru<CR>

" Unite
nnoremap <Space> :<C-u>Unite -immediately -buffer-name=files -default-action=goto buffer<CR>
nnoremap <Leader>uu :<C-u>Unite<Space>
nnoremap <Leader>U :<C-u>UniteResume<CR>
nnoremap <Leader>b :<C-u>Unite -immediately -buffer-name=files buffer<CR>
nnoremap <Leader>B :<C-u>Unite tab:no-current<CR>
nnoremap <Leader>ua :<C-u>Unite grep:.<CR>
nnoremap <Leader>uA :<C-U>Unite -auto-preview grep:.<CR>
nnoremap <Leader>ub :<C-u>Unite bookmark<CR>
nnoremap <Leader>uC :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <Leader>uc :<C-u>Unite hyperspec<CR>
nnoremap <Leader>ud :<C-u>Unite -unique -buffer-name=files -default-action=cd<Space>directory_mru<CR>
nnoremap <Leader>uF :<C-u>Unite -unique -buffer-name=files file<CR>
nnoremap <Leader>uf :<C-u>Unite -unique -buffer-name=files file_rec<CR>
nnoremap <Leader>ug :<C-u>Unite grep:.<CR>
nnoremap <expr> <Leader>uh ':<C-u>Unite help ' . (getbufvar('%', '&filetype') == 'help' ? '' : '-tab') . '<CR>'
nnoremap <Leader>uj :<C-u>Unite jump -auto-preview<CR>
nnoremap <Leader>ul :<C-u>Unite line<CR>
nnoremap <Leader>uL :<C-u>Unite locate<CR>
nnoremap <Leader>um :<C-u>Unite -unique -buffer-name=files file_mru<CR>
nnoremap <Leader>uM :<C-u>Unite mapping<CR>
nnoremap <Leader>uo :<C-u>Unite outline<CR>
nnoremap <Leader>ur :<C-u>Unite register<CR>
nnoremap <Leader>us :<C-u>call SwoopMulti()<CR>
nnoremap <Leader>uS :<C-u>Unite located_session<CR>
nnoremap <Leader>uT :<C-u>Unite tab:no-current<CR>
nnoremap <Leader>ut :<C-u>Unite tag<CR>
nnoremap <Leader>uv :<C-u>Unite variable<CR>
nnoremap <Leader>uw :<C-u>Unite window:no-current<CR>
nnoremap <Leader>u/ :<C-u>Unite -buffer-name=search line:forward<CR>
nnoremap <Leader>u? :<C-u>Unite -buffer-name=search line:backward<CR>
nmap <Leader>un <Plug>(nox-tag-search-menu)
nmap <Leader>uN <Plug>(nox-cat-menu)

" QuickRun
nnoremap <Leader>R :<C-u>QuickRun<CR>

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <Leader>o <Plug>(openbrowser-smart-search)
xmap <Leader>o <Plug>(openbrowser-smart-search)

" QuickHl
nmap <Leader>hh <Plug>(quickhl-manual-this)
nmap <Leader>hr <Plug>(quickhl-manual-reset)
nnoremap <Leader>hd :<C-u>QuickhlManualDelete<CR>
nnoremap <Leader>ha :<C-u>QuickhlManualAdd<Space>

" 保存 ﾎﾟﾗﾎﾟﾗﾎﾟﾗ
nnoremap <Leader>w :<C-u>update<CR>
nnoremap <Leader>W :<C-u>wall<CR>
nnoremap <Leader>z ZZ

" nox
nnoremap <Leader>n :<C-u>NoxSearch<Space>

" neocomplate
nnoremap <Leader>N :<C-u>NeoCompleteToggle<CR>


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
xmap ab <Plug>(textobj-multiblock-a)
xmap ib <Plug>(textobj-multiblock-i)

" poslist
map <Leader><C-o> <Plug>(poslist-prev-buf)
map <Leader><C-i> <Plug>(poslist-next-buf)

" ambcmd
cnoremap <expr> <C-o> ambicmd#expand("\<Space>")

" textmanip
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)
xmap <Leader>j <Plug>(textmanip-duplicate-down)
xmap <Leader>k <Plug>(textmanip-duplicate-up)

" ctrlp
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <Leader>cb :<C-u>CtrlPBookmarkDir<CR>
nnoremap <Leader>cB :<C-u>CtrlPBookmarkDirAdd<CR>
nnoremap <Leader>cc :<C-u>CtrlPLastMode<CR>
nnoremap <Leader>cf :<C-u>CtrlP<CR>
nnoremap <Leader>cC :<C-u>ctrlp
nnoremap <Leader>cd :<C-u>CtrlPDir<CR>
nnoremap <Leader>cx :<C-u>CtrlPChange<CR>
nnoremap <Leader>cX :<C-u>CtrlPChangeAll<CR>
nnoremap <Leader>cl :<C-u>CtrlPLine<CR>
nnoremap <Leader>cL :<C-u>CtrlPClearCache<CR>
nnoremap <Leader>cm :<C-u>CtrlPMixed<CR>
nnoremap <Leader>cq :<C-u>CtrlPQuickfix<CR>
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<C-h>', '<BS>', '<C-]>'],
  \ 'PrtDelete()':          ['<C-d>'],
  \ 'PrtDeleteWord()':      ['<C-w>'],
  \ 'PrtClear()':           ['<C-u>'],
  \ 'PrtSelectMove("j")':   ['<C-n>', '<Down>'],
  \ 'PrtSelectMove("k")':   ['<C-p>', '<Up>'],
  \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
  \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
  \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
  \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
  \ 'PrtHistory(-1)':       ['<C-l>'],
  \ 'PrtHistory(1)':        ['<C-k>'],
  \ 'AcceptSelection("e")': ['<CR>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': [],
  \ 'AcceptSelection("t")': ['<C-CR>'],
  \ 'AcceptSelection("v")': [],
  \ 'ToggleFocus()':        ['<S-Tab>'],
  \ 'ToggleRegex()':        ['<C-r>'],
  \ 'ToggleByFname()':      ['<C-t>'],
  \ 'ToggleType(1)':        ['<C-Up>'],
  \ 'ToggleType(-1)':       ['<C-Down>'],
  \ 'PrtExpandDir()':       ['<Tab>'],
  \ 'PrtInsert("c")':       ['<MiddleMouse>', '<Insert>'],
  \ 'PrtInsert()':          ['<C-\>'],
  \ 'PrtCurStart()':        ['<C-a>'],
  \ 'PrtCurEnd()':          ['<C-e>'],
  \ 'PrtCurLeft()':         ['<C-b>', '<Left>'],
  \ 'PrtCurRight()':        ['<C-f>', '<Right>'],
  \ 'PrtClearCache()':      [],
  \ 'PrtDeleteEnt()':       ['<F7>'],
  \ 'CreateNewFile()':      [],
  \ 'MarkToOpen()':         ['<C-y>', '<C-x>'],
  \ 'OpenMulti()':          ['<C-o>'],
  \ 'PrtExit()':            ['<Esc>', '<C-c>', '<C-g>'],
  \ }

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
    return ws . (cmd[strlen(cmd) - 1] ==# '!' ? cmd[:-2] : cmd . '!') . rest
endfunction
cnoremap <Plug>(cmdline-toggle-bang) <C-\>e <SID>toggle_bang(getcmdline())<CR>
cmap <C-x> <Plug>(cmdline-toggle-bang)

" }}}

" ヘルプ以外の空バッファウィンドウを閉じる {{{

function! s:OnlyHelpBufferWindow ()
  let l:blanks = 0
  let l:helps = 0
  for n in tabpagebuflist()
    if getbufvar(n, '&filetype') ==# 'help'
      let l:helps += 1
    elseif bufname(n) ==# ''
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


"  _________
" < autocmd >
"  ---------
"   \
"    \   \_\_    _/_/
"     \      \__/
"            (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

" Auto Command {{{

" 自動で窓開く
MeowtoCmd QuickFixCmdPost vimgrep cwin

" 折りたたみの保存 - http://vim-users.jp/2009/10/hack84/
MeowtoCmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
MeowtoCmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif

" セッションロード後に、XMonad 的なリフレッシュ
MeowtoCmd SessionLoadPost * XMonadRefreshWindow

" md as markdown, instead of modula2
MeowtoCmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
MeowtoCmd BufNewFile,BufRead *.nox set filetype=nox

" nox
MeowtoCmd FileType nox TabpageCD ~/nox
MeowtoCmd FileType nox-cat nmap <silent> <buffer> i     <Plug>(nox-tabedit-current-section-file)
MeowtoCmd FileType nox-cat nmap <silent> <buffer> o     <Plug>(nox-tabedit-current-section-file)
MeowtoCmd FileType nox-cat nmap <silent> <buffer> a     <Plug>(nox-tabedit-current-section-file)
MeowtoCmd FileType nox-cat nmap <silent> <buffer> <CR>  <Plug>(nox-tabedit-current-section-file)
MeowtoCmd FileType nox-cat nmap <silent> <buffer> I     <Plug>(nox-edit-current-section-file)
MeowtoCmd FileType nox-cat nmap <silent> <buffer> O     <Plug>(nox-edit-current-section-file)
MeowtoCmd FileType nox-cat nmap <silent> <buffer> A     <Plug>(nox-edit-current-section-file)
MeowtoCmd FileType nox nmap <silent> <buffer> t <Plug>(nox-tag-add-menu)

" }}}


"  _____
" < env >
"  -----
"   \
"    \   \_\_    _/_/
"     \      \__/
"            (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

" PATH {{{

let $PATH = $HOME . '/bin:' . $HOME . '/.cabal/bin:' . $PATH

" }}}


"  ________
" < script >
"  --------
"   \
"    \   \_\_    _/_/
"     \      \__/
"            (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

" 可愛いフォーマッタ殺害 {{{

function! s:KillTheFuckingFormatters()
  setlocal textwidth=0
  " fo = formatoptions
  setlocal fo-=o fo-=t fo-=c fo+=mM
endfunction

MeowtoCmd FileType * call s:KillTheFuckingFormatters()

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

" }}}

" セミコロンで Sticky Shift {{{
function! s:InitStickyShiftBySemiColon ()
  inoremap ;; ;
  for l:lc in split('abcdefghijklmnopqrstuvwxyz', '\zs')
    execute 'inoremap ;' . l:lc . ' ' . toupper(l:lc)
  endfor
  inoremap ;' "
  inoremap ;, <
  inoremap ;. >
  inoremap ;[ {
  inoremap ;] }
  inoremap ;= +
  inoremap ;- _
  inoremap ;` ~
  inoremap ;\ <Bar>
  inoremap ;1 !
  inoremap ;2 @
  inoremap ;3 #
  inoremap ;4 $
  inoremap ;5 %
  inoremap ;6 ^
  inoremap ;7 &
  inoremap ;8 *
  inoremap ;9 (
  inoremap ;0 )
endfunction
call s:InitStickyShiftBySemiColon()
" }}}

" Vim の矩形選択の痒いところに手を届かせる - TIM Labs {{{
" http://labs.timedia.co.jp/2012/10/vim-more-useful-blockwise-insertion.html
xnoremap <expr> I <SID>force_blockwise_visual('I')
xnoremap <expr> A <SID>force_blockwise_visual('A')

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


"  ____________
" < hightlight >
"  ------------
"   \
"    \   \_\_    _/_/
"     \      \__/
"            (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

" 行末のスペースを目立たせる {{{

set listchars+=trail:#

if has('gui_running')
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
endif

" }}}

" 地蔵でディレクトリ作る {{{
" http://vim-users.jp/2011/02/hack202/

MeowtoCmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
function! s:auto_mkdir(dir, force)
  if isdirectory(a:dir)
    return
  endif

  if a:force || input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$'
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" }}}


"  _________
" < command >
"  ---------
"   \
"    \   \_\_    _/_/
"     \      \__/
"            (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

" *.archive に選択範囲を移動 {{{

function! Archive(comment) range
  let l:basefn = expand('%:p')
  if l:basefn ==# ''
    echoerr 'No filename'
    return
  endif
  execute (a:firstline . ',' . a:lastline) . 'delete'
  if a:comment !=# ''
    let l:prefix = a:comment . ' - '
  else
    let l:prefix = ''
  endif
  let l:content = "\n\n\n[" . l:prefix . system('date | tr --delete "\n"') . "]\n\n" . @"

  " call vimproc#write(l:basefn . '.archive', l:content, 'a')

  let l:file = vimproc#fopen(l:basefn . '.archive', 'O_WRONLY | O_CREAT | O_APPEND')
  call file.write(l:content)
  call l:file.close()
endfunction

command! -nargs=* -range Archive <line1>,<line2>call Archive(<q-args>)

" }}}

" chmod {{{
function! s:Chmod(perm)
  let l:perm = len(a:perm) > 0 ? a:perm : "+x"
  let res = system('chmod ' . l:perm . ' ' . shellescape(expand('%')))
  write
  edit
endfunction
command! -nargs=* Chmod :call s:Chmod(<q-args>)
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
  if a:bang ==# '!'
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

augroup XMonadRefreshWindow
  autocmd!
augroup END

" 念の為) この関数が実行されるまでに、'updatetime' が変更されても上書きされてしまう問題有り。
function! s:XMonadRefreshWindowDelayed()
  silent call vimproc#system('~/.xmonad/bin/xc command refresh-window')

  let &updatetime = s:xmonad_refresh_window_updatetime_backup
  unlet s:xmonad_refresh_window_updatetime_backup
  autocmd! XMonadRefreshWindow
endfunction

function! s:XMonadRefreshWindow()
  if !has('gui_running')
    return
  endif

  if exists('s:xmonad_refresh_window_updatetime_backup')
    return
  endif

  let s:xmonad_refresh_window_updatetime_backup = &updatetime
  set updatetime=200
  autocmd XMonadRefreshWindow CursorHold * call s:XMonadRefreshWindowDelayed()
endfunction

command! -bar XMonadRefreshWindow call s:XMonadRefreshWindow()

" }}}

" バルーンで Syntax 情報を得てみる {{{

function! s:BallonSyntax(name)
  set ballooneval
  if a:name ==# 'syntax'
    set balloonexpr=synIDattr(synID(v:beval_lnum,\ v:beval_col,\ 1),\ 'name')
  elseif a:name ==# 'fold'
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

" 日付挿入 {{{

function! s:InsertDate ()
  let l:text = substitute(system('LANG=ja_JP.UTF-8 date'), '\n', '', '')
  if &filetype ==# 'nox'
    let l:text = '# ' . l:text
  else
    let l:text = '<<' . l:text . '>>'
  endif
  call append(line('.'), [l:text, ''])
  normal! zzG
endfunction

command! -bar Date normal! :call s:InsertDate()<CR>

" }}}

" セッションの保存 {{{

function! s:MkSession(name)
  let l:fn = a:name

  if match(a:name, '\S\+') < 0
    let l:fn = (v:this_session ==# '' ? 'Session.vim' : v:this_session)
  elseif match(a:name, 'Session\.vim$') < 0
    let l:fn = a:name . 'Session.vim'
  else
    let l:fn = a:name
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

" }}}

" 下線を引く for rst とか {{{

function! UnderLine(up)
  let l:prev_len = strdisplaywidth(getline('.'))
  let l:char = nr2char(getchar())

  if l:char ==# 'l' && exists('s:previous_underline_char')
    let l:char = s:previous_underline_char
  else
    let s:previous_underline_char = l:char
  endif

  let l:text = ''

  while len(l:text) < l:prev_len
    let l:text .= l:char
  endwhile

  " 改行消さないために a を入れる
  if a:up
    return "o\a\<C-u>" . l:text . "\<Esc>kO\<C-u>" . l:text . "\<Esc>"
  else
    return "o\a\<C-u>" . l:text . "\<Esc>"
  endif
endfunction

" l を押すと最後に使った文字になる
nnoremap <expr> <Leader>l UnderLine(0)
nnoremap <expr> <Leader>L UnderLine(1)
command! UnderLine call UnderLine

" }}}

" 表示に関する設定切り替え {{{

function! s:InitUniteSomethingMenu()
  if !exists('g:unite_source_menu_menus')
    let g:unite_source_menu_menus = {}
  endif

  " menu の説明
  let l:commands = {
    \   'description' : 'something-action',
    \}

  " コマンドを登録
  let l:commands.candidates = {
    \   'indent-line'             : 'IndentLinesToggle',
    \   'cross'                   : 'setlocal cursorcolumn! cursorline!',
    \   'relative-number'         : 'setlocal relativenumber!',
    \   'quickhl'                 : 'QuickhlManualEnable',
    \   'colorcolumn'             : 'ColorColumn',
    \   'write-at-escape'         : 'EscWrite',
    \   'open-all-project-source' : 'OpenAllProjectSource',
    \}

  " 上記で登録したコマンドを評価する関数
  " 最終的にこれで評価した結果が unite に登録される
  function l:commands.map(key, value)
    return {'word' : a:key, 'kind' : 'command', 'action__command' : a:value}
  endfunction

  let g:unite_source_menu_menus['something'] = deepcopy(l:commands)

  " 呼び出しのキーマップ
  nnoremap <silent> <Leader>i :<C-u>Unite -immediately menu:something<CR>
  vnoremap <silent> <Leader>i :<C-u>Unite -immediately menu:something<CR>
endfunction

call s:InitUniteSomethingMenu()

" }}}

" 隠れバッファの削除 {{{

function! s:delete_hide_buffer()
  let list = filter(range(1, bufnr('$')), 'bufexists(v:val) && !buflisted(v:val)')
  for num in list
    execute 'bw ' . num
  endfor
endfunction

command! DeleteHideBuffer :call s:delete_hide_buffer()

" }}}

" Esc で保存 {{{

let s:write_at_escape = 0
function! s:ToggleWriteAtEscape()
  if s:write_at_escape
    set noautowrite
    autocmd! WriteAtEscape
    echomsg 'write-at-escape: Off'
  else
    set autowrite
    augroup WriteAtEscape
      MeowtoCmd CursorHold *  silent! wall
      MeowtoCmd CursorHoldI *  silent! wall
      MeowtoCmd InsertLeave *  silent! wall
    augroup END
    echomsg 'write-at-escape: On'
  endif
  let s:write_at_escape = !s:write_at_escape
endfunction
command EscWrite call s:ToggleWriteAtEscape()

" }}}

" mongo のシェルから貼り付けたものを適当に整形する {{{

function! s:ReformMongoPaste()
  %S/ISODate\((.+?)\)/\1
  %S/ObjectId\((.+?)\)/\1
  %G/.*/normal A,
  normal! G$x
  call append('^', '[')
  call append('$', ']')
  %!python -mjson.tool
endfunction
command! ReformMongoPaste :call s:ReformMongoPaste()


" }}}

" エレクチオン {{{

command! Election inoremap ん ン

" }}}

" テンキー表記を矢印に変換 {{{
function! s:KakugeReplace()
  silent!'<,'>s/1/↙/g
  silent! '<,'>s/2/↓/g
  silent! '<,'>s/3/↘/g
  silent! '<,'>s/4/←/g
  silent! '<,'>s/5/Ｎ/g
  silent! '<,'>s/6/→/g
  silent! '<,'>s/7/↖/g
  silent! '<,'>s/8/↑/g
  silent! '<,'>s/9/↗/g
  silent! '<,'>s/p/Ｐ/gi
  silent! '<,'>s/k/Ｋ/gi
  silent! '<,'>s/h/Ｈ/gi
  silent! '<,'>s/t/Ｔ/gi
endfunction

command! -range=% KakugeReplace call s:KakugeReplace()
" }}}


"  ________
" < plugin >
"  --------
"   \
"    \   \_\_    _/_/
"     \      \__/
"            (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

" Agit {{{

" agit.vim を vimfiler や unite-file 内から開く
let s:agit_file = { 'description' : 'open the file''s history in agit.vim' }
function! s:agit_file.func(candidate)
  execute 'AgitFile' '--file='.a:candidate.action__path
endfunction
call unite#custom#action('file', 'agit-file', s:agit_file)

" }}}

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

    let encoding = (&fenc ==# '' ? &enc : &fenc)

    if encoding ==# 'utf-8'
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
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_symbols = {'linenr': '¶ '}
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
AlterCommand agit Agit
AlterCommand align Alignta
AlterCommand c CtrlSF
AlterCommand cd TabpageCD
AlterCommand chmod Chmod
AlterCommand co CtrlSFOpen
AlterCommand date Date
AlterCommand execlip Execlip
AlterCommand mfc MFC
AlterCommand mks MkSession
AlterCommand mkp MarkdownPreview
AlterCommand noxa NoxAttach
AlterCommand noxc NoxCat
AlterCommand noxd NoxDiary
AlterCommand noxn NoxNew
AlterCommand noxs NoxSearch
AlterCommand noxt NoxTagAdd
AlterCommand noxtu NoxTagUpdate
AlterCommand noxu NoxUnugly
AlterCommand nyancat Unite -update-time=50 -winheight=25 nyancat_anim
AlterCommand ref Ref
AlterCommand res Restart
AlterCommand ssf SSF
AlterCommand tm tabmove
AlterCommand w1 w!
AlterCommand w2 w!
AlterCommand w3 w!

" }}}

" ChangeLog {{{

let g:changelog_dateformat='%Y-%m-%d (%a)'
let g:changelog_username = 'ANekoS'
let g:changelog_date_end_entry_search = '^\s*$'

" }}}

" ColorColumn {{{

command! -range=% ColorColumn call easy_colorcolumn#toggle((<line1> == 1 && <line2> == line('$')) ? 'n' : 'v')

" }}}

" ColorV {{{

let g:colorv_no_global_map = 1

" }}}
"
" CtrlP {{{

let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_working_path_mode = 'a'


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v([\/]\.(git|hg|svn)|target)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

" }}}

" Dirvish {{{

let g:dirvish_hijack_netrw = 1
let g:dirvish_relative_paths = 1

" }}}

" Eclim {{{

if 0 <= index(split(&runtimepath, ','), fnamemodify('~/.vim-eclim', ':p'))
  " let g:EclimCompletionMethod = "omnifunc"
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.java = '\k\.\k*'
  let g:neocomplete#force_omni_input_patterns.scala = '\k\.\k*'
  set completeopt-=preview
endif

" }}}

" essk.vim {{{
let g:eskk#dictionary = {
\ 'path': $HOME . '/.eskk/dic/SKK-JISYO.L',
\ 'sorted': 0,
\ 'encoding': 'eucjp-ms',
\}
" }}}

" fancy-rainbow-osyo-zone {{{

let s:rainbow_interval = 25

function! s:InitRainbow ()
  set updatetime=25
  let l:bufname = bufname('%')
  bufdo call fancy#enable_when_idle(s:rainbow_interval, "rainbow")
  execute 'buffer ' . l:bufname
  MeowtoCmd BufWinEnter call fancy#enable_when_idle(s:rainbow_interval, "rainbow")
endfunction

command! Rainbow call s:InitRainbow()


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

" incsearch.vim {{{

let g:incsearch#magic = '\v'

" }}}

" IndentLine {{{

let g:indentLine_enabled = 0
let g:indentLine_color_gui = '#343434'

" }}}

" J6uil {{{

let g:J6uil_no_default_keymappings = 1
let g:J6uil_display_icon = 1
let g:J6uil_empty_separator = 1

function! s:J6uilInit()
  nmap <silent> <buffer> a                  <Plug>(J6uil_open_say_buffer)
  nmap <silent> <buffer> <Leader><Leader>r  <Plug>(J6uil_reconnect)
  nmap <silent> <buffer> <Leader><Leader>d  <Plug>(J6uil_disconnect)
  nmap <silent> <buffer> r                  <Plug>(J6uil_unite_rooms)
  nmap <silent> <buffer> u                  <Plug>(J6uil_unite_members)
  nmap <silent> <buffer> <CR>               <Plug>(J6uil_action_enter)
  nmap <silent> <buffer> o                  <Plug>(J6uil_action_open_links)
  nnoremap <buffer> <Tab>                   /http<CR>:set<Space>nohlsearch<CR>
  nnoremap <buffer> <S-Tab>                 ?http<CR>:set<Space>nohlsearch<CR>
endfunction

MeowtoCmd FileType J6uil call s:J6uilInit()

" }}}

" lisp {{{

let g:lisp_instring = 1
let g:lisp_rainbow = 1

" }}}

" Nox {{{

let g:nox_document_path = expand('~/nox/')

function! s:MyNoxTagFromPath(path)
  let l:base = fnamemodify('~/nox/', ':p')
  let l:path = fnamemodify(a:path, ':h:p')
  let l:result = substitute(l:path, l:base, '', '')
  let l:result = substitute(l:result, '-', ' ', 'g')
  let l:path_route = split(l:result, '/')
  if l:path_route[0] !=# 'work'
    let l:path_route = l:path_route[1:]
  endif
  return filter(l:path_route, 'match(v:val, ''^\d\+$'')')
endfunction

let g:NoxTagFromPath = function('s:MyNoxTagFromPath')

" }}}

" manga-osort {{{

let g:manga_osort_default_options = {'ignorecase' : 1}
let g:manga_osort_alias = {
  \   '#zsh' : {'pattern' : '^#', 'key' : 1},
  \   '#haskell-import' : {'pattern' : '^import', 'keyprefix' : 'import\s\+\(qualified\s\)\?'},
  \   '#paragraph' : {'pattern' : '^\S'},
  \   '#neobundle' : {'keyprefix' : 'NeoBundle\S*', 'pattern' : 'NeoBundle'},
  \   '#vimrc' : {'pattern' : '^"'},
  \   '#common-list-definition' : {'pattern' : '^('},
  \   '#nox-definiton-list' : {'pattern' : '^[^\s:]', 'key': 1}
  \ }
let g:manga_osort_context = [
  \   {'pattern' : '^NeoBundle ', 'arguments': '#neobundle'},
  \ ]

" }}}

" mkdpreview {{{

function! s:MarkdownPreview()
  " FIXME
  let l:destfn = tempname() . '.html'
  let l:sourcefn = expand('%:p')
  let l:cssfn = expand('~/.pandoc/github.css')
  call system('pandoc --standalone --self-contained --from=markdown --to=html --css=' . fnameescape(l:cssfn) . ' --output=' . fnameescape(l:destfn) . ' ' . fnameescape(l:sourcefn))
  call system('rifle ' . fnameescape(l:destfn))
endfunction
command! MarkdownPreview call s:MarkdownPreview()

" }}}

" NeoComplete {{{

" NeoComplete migration guide
" https://github.com/Shougo/neocomplete.vim/wiki/neocomplete-migration-guide

" imap <silent><C-l>     <Plug>(neocomplcache_snippets_expand)
" smap <silent><C-l>     <Plug>(neocomplcache_snippets_expand)
" nmap <silent><C-e>     <Plug>(neocomplcache_keyword_caching)
" imap <expr><silent><C-e>     pumvisible() ? "\<C-e>" : "\<Plug>(neocomplcache_keyword_caching)"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

if neobundle#is_installed('neocomplete')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 0
  let g:neocomplete#enable_ignore_case = 0
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define keyword.
  if !exists('g:g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns= {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'
else
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_smart_case = 0
  let g:neocomplcache_enable_ignore_case = 0
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
  let g:neocomplcache_max_menu_width = 20
endif

" }}}

" NeoSnippet {{{

let g:neosnippet#snippets_directory = '~/.vim/snippets'

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

" Puyo {{{

function! s:StartPuyo()
  " 1000以上推奨。
  set maxfuncdepth=1000
  " フォント
  if !has('gui_running')
    call system(printf("set-font '' 4 '' %d 1", v:windowid))
  endif
  " ゲームを始める
  call puyo#new()
  XMonadRefreshWindow
  nmap <buffer> <Space><Space> :
  wincmd o
  1
endfunction

let g:puyo#updatetime = 450
command!  Puyo :call s:StartPuyo()

" }}}

" Quickhl {{{

" 1 だと重いョ
let g:quickhl_tag_enable_at_startup = 0
let g:quickhl_manual_keywords = [
\ 'IMPLEMENTME',
\ ]

" }}}

" Quickrun {{{

let g:quickrun_config = {
\   '_' : {'runner' : 'vimproc', 'runner/vimproc/updatetime' : 60},
\   'javascript': {'command': 'eslint'},
\   'scala': {'command': 'sbt', 'exec': 'test:compile'}
\ }

let g:quickhl_tag_enable_at_startup = 0
let g:quickhl_manual_keywords = [
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

function! s:SetWindowRole(role)
  call system(printf('xprop -id %s -f WM_WINDOW_ROLE 8s -set WM_WINDOW_ROLE %s', v:windowid, a:role))
endfunction
command! -bar -nargs=* SetWindowRole call s:SetWindowRole(<q-args>)

function! s:OnRestart()
  call s:SaveLastColor()

  let res = [
  \   printf("let &guifont = '%s'", &guifont),
  \   'XMonadRefreshWindow',
  \   printf('colorscheme %s', g:colors_name),
  \   printf('autocmd VimEnter * let v:this_session = %s', string(v:this_session))
  \ ]

  " 念の為、ROLE に使われる文字を制限
  let l:window_role = substitute(system('xprop -id ' . v:windowid . ' WM_WINDOW_ROLE'), '^.*= "\([a-zA-Z_0-9-]\+\)".*', '\1', 'g')
  if match(l:window_role, '^WM_WINDOW_ROLE:.*not found') < 0
    call add(res, 'SetWindowRole ' . l:window_role)
  endif

  return join(res, ' | ')
endfunction

command! SSS echo s:OnRestart()

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

" splash {{{

function! s:InitSplash()
  let l:list = split(globpath(expand('~/.vim/splash/'), '*'), '\n')
  if has('reltime')
    let l:n = len(l:list) - 1
    let l:match_end = matchend(reltimestr(reltime()), '\d\+\.') + 1
    let l:rand = reltimestr(reltime())[l:match_end : ] % (n + 1)
  else
    let l:rand = 0
  endif
  let g:splash#path = l:list[l:rand]
endfunction

call s:InitSplash()

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
call submode#map       ('winsize', 'n', '', '=', '<C-w>=:redraw<CR>')

" Scroll by j and k.
" TODO Stash &scroll value.
" TODO Use <excmd>j, <excmd>k
" TODO Make utility function to generate current shortest <SID> map.
call submode#enter_with('s', 'n', '', ',ss', '<C-d>:redraw<CR>')
call submode#enter_with('s', 'n', '', ',ss', '<C-u>:redraw<CR>')
call submode#leave_with('s', 'n', '', '<Esc>')
call submode#map       ('s', 'n', '', 'j', '<C-d>:redraw<CR>')
call submode#map       ('s', 'n', '', 'k', '<C-u>:redraw<CR>')
call submode#map       ('s', 'n', '', 'a', ':let &l:scroll -= 3<CR>')
call submode#map       ('s', 'n', '', 's', ':let &l:scroll += 3<CR>')

" }}}

" Swoop {{{

let g:swoopUseDefaultKeyMap = 0

function! s:InitSwoop()
  nnoremap <buffer><silent> <CR> :call SwoopSelect()<CR>
  setlocal foldmethod=manual
endfunction

autocmd BufEnter,BufWinEnter swoopBuf call s:InitSwoop()

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

" textmanip {{{

let g:textmanip_enable_mappings = 0

" }}}

" tweetvim {{{
"
let g:tweetvim_empty_separator = 1

" }}}

" Unite {{{

let g:unite_enable_start_insert = 1
let g:unite_enable_smart_case = 1

let g:unite_kind_openable_cd_command = 'TabpageCD'

let s:unite_ignore_globs_dir = 'tmp _build target .idea logs _static .nix-profile'
let s:unite_ignore_globs_dir .= ' cabal-dev dist .cabal-sandbox' " for haskell
let s:unite_ignore_globs_dir .= ' temp vendor' " for ruby/rails
let s:unite_ignore_globs_dir .= ' quicklisp' " for common lisp
let s:unite_ignore_globs_dir .= ' export' " for java
let s:unite_ignore_globs_dir .= ' bower_components' " for bower
let s:unite_ignore_globs_dir .= ' .sass-cache' " for SASS
let s:unite_ignore_globs_dir .= ' node_modules' " for npm
let s:unite_ignore_globs_dir .= ' grunt_tmp' " for grunt
let s:unite_ignore_globs_dir .= ' .git .svn _darcs' " for vcs

let s:unite_ignore_globs_extensions = 'png jpeg jpg gif jar dcu manifest dll exe exp o so bak sw res dep idb pdb user ilk ncb class hi doctree'

function! s:InitUnite()
  " *unite-filter-sorter_default*
  call unite#custom_source('buffer,file,file_rec,file_rec/async', 'sorters', 'sorter_word')

  " set ignore pattern
  let s:unite_ignore_globs_extensions = substitute(s:unite_ignore_globs_extensions,  '\v(\S+)', '*.\1', 'g')
  let s:unite_ignore_globs_dir = substitute(s:unite_ignore_globs_dir,  '\v(\S+)', '\1/', 'g')
  let s:unite_ignore_globs = s:unite_ignore_globs_dir . ' ' . s:unite_ignore_globs_extensions
	call unite#custom#source('file,file_rec,file_rec/async', 'ignore_globs', split(s:unite_ignore_globs, ' '))
endfunction

function! s:InitUniteBuffer()
  nmap <silent> <buffer> J      <Plug>(unite_toggle_mark_current_candidate)
  nmap <silent> <buffer> K      <Plug>(unite_toggle_mark_current_candidate-up)
  nmap <silent> <buffer> <C-a>  <Plug>(unite_toggle_mark_all_candidates)
  nmap <silent> <buffer> P      <Plug>(unite_toggle_auto_preview)
  imap <silent> <buffer> <C-j>  <Plug>(unite_do_default_action)
  imap <silent> <buffer> <C-c>  <Plug>(unite_exit)
  nmap <silent> <buffer> <C-c>  <Plug>(unite_exit)
  inoremap <silent><buffer><expr> <C-e> unite#do_action('rec')
endfunction

" unite.vim の候補を動的にソートする - C++でゲームプログラミング
"     http://d.hatena.ne.jp/osyo-manga/20130913/1379077733
function! s:InitMangaUniteSort()
  function! s:sort(sorters)
      call unite#mappings#set_current_filters(a:sorters)
      execute "normal \<Plug>(unite_redraw)"
  endfunction

  let s:source = {
  \    "name" : "sort",
  \    "action_table" : {
  \        "set_current_filters" : {
  \            "is_selectable" : 0,
  \            "is_quit" : 0,
  \        },
  \    },
  \    "default_action" : "set_current_filters",
  \ }

  function! s:source.action_table.set_current_filters.func(candidate)
      execute "normal \<Plug>(unite_exit)"
      call s:sort(a:candidate.action__sorters)
  endfunction

  function! s:source.gather_candidates(...)
      let l:sorters = filter(values(map(unite#variables#filters(), 'v:val.name')), 'v:val =~ "^sorter"')
      return map(copy(l:sorters), '{
  \         "word" : v:val,
  \         "action__sorters"     : [v:val],
  \     }')
  \     + map(copy(sorters), '{
  \         "word" : "reverse " . v:val,
  \         "action__sorters"     : [v:val, "sorter_reverse"],
  \     }')
  endfunction

  call unite#define_source(s:source)
  unlet s:source

  function! s:start_sort()
      let l:context = {}
      let l:context.input = ''
      let l:context.auto_preview = 0
      let l:context.unite__is_vimfiler = 0
      let l:context.default_action = 'default'
      call unite#start_temporary([["sort", ""]], l:context)
  endfunction

  augroup MyOsyo
      autocmd!
      autocmd FileType unite nnoremap <buffer><silent> S :call <SID>start_sort()<CR>
  augroup END
endfunction

call s:InitUnite()
call s:InitMangaUniteSort()
MeowtoCmd FileType unite call s:InitUniteBuffer()

" }}}

" unite-font {{{

let g:unite_font_list_command = 'font-names 1'
call unite#custom#source('font', 'matchers', 'matcher_migemo')

" }}}

" unite-grep {{{

" Grep with ag
let g:unite_source_grep_command = '/bin/ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

function! s:GrepSelected()
  let l:backup = @z
  normal! vgv"zy
  let l:str = @z
  let @z = l:backup
  call unite#start([['grep', '.', '', l:str]])
endfunction

xnoremap sua :call <SID>GrepSelected()<CR>

" }}}

" unite-haddock {{{

let g:unite_source_haddock_browser = '/bin/urxvt -e w3m'

" }}}

" unite-hyperspec {{{

let g:unite_hyperspec_base_dir='/usr/share/doc/HyperSpec/'

" }}}

" unite-line {{{

call unite#custom#source('line', 'matchers', 'matcher_migemo')

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
  normal! zz
endfunction
command! JumpSourceLine :call JumpSourceLine()

let g:vimshell_split_command = 'split'
let g:vimshell_interactive_cygwin_path = 'e:/cygwin/bin/'
let g:vimshell_no_default_keymappings = 1

" lein repl を起動
command! -bar Lein execute ':VimShellInteractive lein repl'

command! -bar -range -nargs=? VimShellJoinedSendString call s:vs_send_string(<line1>, <line2>)
"command! VimShellIntRestart :call vimshell#int_mappings#restart_command()

xnoremap <silent> <Leader>S :VimShellJoinedSendString<CR>
xnoremap <silent> <Leader>s :VimShellSendString<CR>

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
MeowtoCmd FileType vimshell call s:DefineVimshellMappings()

"}}}

" wildfire {{{

" This selects the next closest text object.
let g:wildfire_fuel_map = '<S-Enter>'

" This selects the previous closest text object.
let g:wildfire_water_map = '<C-S-Enter>'

"}}}

" Zen Coding {{{

let g:user_emmet_mode = 'inv'
let g:user_emmet_leader_key = '<C-y>'

let g:user_emmet_settings = {
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


"  __________
" < filetype >
"  ----------
"   \
"    \   \_\_    _/_/
"     \      \__/
"            (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

" Set filetype {{{

MeowtoCmd BufNewFile,BufRead buildfile setlocal filetype=ruby

" }}}

" misc {{{

MeowtoCmd FileType gitcommit call feedkeys('ggA')
MeowtoCmd FileType J6uil setlocal nonumber norelativenumber

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


"  __________
" < terminal >
"  ----------
"   \
"    \   \_\_    _/_/
"     \      \__/
"            (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

" {{{

" 対応端末では、左右スクロールマージンを利用する
" ref: http://slashdot.jp/journal/572013/vim%E3%81%A7%E3%81%AE%E7%B8%A6%E5%88%86%E5%89%B2%E6%99%82%E3%81%AE%E3%82%B9%E3%82%AF%E3%83%AD%E3%83%BC%E3%83%AB%E9%80%9F%E5%BA%A6%E6%94%B9%E5%96%84
if index(['xterm', 'mlterm', 'RLogin', 'tanasinn', 'pangoterm'], $TERM) >= 0
  let &t_ti .= "\e[?6;69h"
  let &t_te .= "\e7\e[?6;69l\e8"
  let &t_CV = "\e[%i%p1%d;%p2%ds"
  let &t_CS = 'y'
endif

" }}}


"  _______
" < color >
"  -------
"   \
"    \   \_\_    _/_/
"     \      \__/
"            (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

" color {{{

if has('gui_running')
  let s:fallback_colorscheme = 'anekos'
  let s:last_color_filename = fnamemodify('~/.vim.lastcolor', ':p')
  let g:unite_colorscheme_command = 'Colorscheme'

  function! s:SaveLastColor()
    if filereadable(s:last_color_filename)
      call delete(s:last_color_filename)
    endif

    let l:file = vimproc#fopen(s:last_color_filename, 'O_WRONLY | O_CREAT')
    call file.write(g:colors_name)
    call l:file.close()

    " call vimproc#write(s:last_color_filename, g:colors_name, 'w')
  endfunction

  function! s:LoadLastColor()
    try
      let l:file = vimproc#fopen(s:last_color_filename, 'O_RDONLY', 0)

      let l:name = file.read()
      if l:name =~# '^\s*$'
        throw 'empty name'
      endif
      execute 'colorscheme ' . l:name

      call l:file.close()
    catch
      execute 'colorscheme ' . s:fallback_colorscheme
    endtry
  endfunction

  function! s:SetAirLineTheme()
    if has('vim_starting')
      return
    endif

    try
      silent execute 'AirlineTheme ' . g:colors_name
    catch
      AirlineTheme zenburn
    endtry
  endfunction

  function! s:MeowColorscheme(name, save)
    execute 'colorscheme ' . a:name
    if a:name !~# '^\s*$'
      let g:colors_name = a:name
    endif

    if a:save
      call s:SaveLastColor()
    endif
  endfunction

  call s:LoadLastColor()

  MeowtoCmd VimLeave * call s:SaveLastColor()
  " 起動時になぜかエラーになるので、コメントアウト
  " MeowtoCmd VimEnter * call s:SetAirLineTheme()
  MeowtoCmd ColorScheme * call s:SetAirLineTheme()

  command! -bang -nargs=? -complete=color Colorscheme call s:MeowColorscheme(<q-args>, <bang>0)
endif

" }}}

" CUI - カラースキーム {{{

if !has('gui_running') && ($TERM !=# 'linux')
  command! -bar ReloadColors set t_Co=256 t_SI=[3\ q t_EI=[1\ q | colorscheme molokai | colorscheme molokai-fix
  MeowtoCmd VimEnter * ReloadColors
endif

" }}}


" _______
"< final >
" -------
"         \
"          \
"            ^__^
"    _______/(oo)
"/\/(       /(__)
"   | W----|| |~|
"   ||     || |~|  ~~
"             |~|  ~
"             |_| o
"             |#|/
"            _+#+_

" ~/.vimrc.local {{{

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" }}}
