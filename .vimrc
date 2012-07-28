"================================================================================
" anekos vim rc
"                                                         vim: set ts=2 sw=2 et :
"================================================================================

"---------------------------------------
" にゃん
"---------------------------------------

" pre {{{

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
 set runtimepath+=~/.vim/bundle/neobundle.vim/
 call neobundle#rc(expand('~/.vim/bundle/'))
endif

 " let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'

" Ref
NeoBundle "taka84u9/vim-ref-ri"
NeoBundle 'thinca/vim-ref'
NeoBundle 'ujihisa/ref-hoogle'

" Library
NeoBundle 'mattn/webapi-vim'

" Twitter
NeoBundle "basyura/TweetVim"
NeoBundle "basyura/twibill.vim"

" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'basyura/unite-yarm'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'mattn/unite-mcdonalds-vim'
NeoBundle 'mfumi/unite-mpc'
NeoBundle 'pekepeke/unite-fileline'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'

" Haskell
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/unite-haddock'

" Joke
NeoBundle 'tyru/banban.vim'

" Completer
NeoBundle 'teramako/jscomplete-vim'

" Misc
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'gregsexton/VimCalc'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'http://conque.googlecode.com/svn/trunk/', {'directory' : 'conque'}
NeoBundle 'kana/vim-altercmd'
NeoBundle 'mattn/benchvimrc-vim'
NeoBundle 'mattn/mkdpreview-vim'
NeoBundle 'mattn/vimplenote-vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'toritori0318/vim-redmine'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/restart.vim'
NeoBundle 'vim-jp/vimdoc-ja'

" NeoBundle 'hokaccha/vim-ref'
" NeoBundle 'http://svn.coderepos.org/share/lang/vim/ack'
" NeoBundle 'kakkyz81/evervim'
" NeoBundle 'kien/ctrlp.vim'
" NeoBundle 'mattn/unite-mpc'
" NeoBundle 'osyo-manga/unite-shimapan'
" NeoBundle 'thinca/vim-singleton'
" NeoBundle 'tyru/eskk.vim'
" NeoBundle 'ujihisa/unite-haskellimport'

 " }}}

" Other plugins {{{

if has('vim_starting')
  set runtimepath+=~/.vim-plugins/qfixapp
  set runtimepath+=~/project/vim-plugins/runes-vim
  set runtimepath+=~/project/vim-plugins/unite-zsh-history
  set runtimepath+=~/project/vim-plugins/char-counter-vim
  set runtimepath+=~/project/vim-plugins/unite-haskellimport
  " set runtimepath+=~/.vim-plugins/im_control
endif


" }}}


"---------------------------------------
" 一般設定
"---------------------------------------

" Init {{{

filetype plugin indent on
filetype off
syntax on
language messages C

" }}}

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

" 自動インデント
" set cindent
" set autoindent

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
set backupdir=~/.vim/backup/

" スワップディレクトリ
set directory=~/.vim/swap/

" View ディレクトリ
if has('win32')
  set viewdir=r:/vim
else
  set viewdir=~/.vim/view
endif

" 補完設定
" set complete=.,w,b,u,t,k,U
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
" set background=dark

" スクロール余白
set scrolloff=0

" クリップボード *レジスタ
" set clipboard=unnamed

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
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab

" 補完メニュー強化
set wildmenu
set wildchar=<Tab>
set wildignore=*.o,*.obj,*.la,*.a,*.exe,*.com,*.so,*.beam,*.hi,*.~*

" 描画を抑える
" set lazyredraw

" 折り返し検索
set wrapscan

" vim7
if v:version >= 700
  " タブを常に表示
  set showtabline=2
endif

" for RecentFiles.vim
set viminfo& viminfo+=!

" ウィンドウサイズの自動調整
set noequalalways

" ヘルプの検索順
set helplang=ja,en

" 自動ディレクトリ移動
" set autochdir

" <Leader>
let mapleader = ","

" }}}

" map - override {{{

" 中央を維持しながら移動
noremap j gjzz
noremap k gkzz
noremap gj j
noremap gk k
noremap G Gzz
noremap gg ggzz
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" コマンドモード時にカーソル移動するのに便利ー
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>

" 検索のハイライト
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap / :<C-u>M/
nnoremap ? :<C-u>?
nnoremap * :<C-u>set hls<Bar>execute 'M/\<' . expand('<cword>') . '\>' <CR>zz
nnoremap # #zz
nnoremap g* :<C-u>set hls<Bar>execute 'M/' . expand('<cword>') <CR>zz
nnoremap g# g#zz

" for US KBD
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" ヘルプを引く <S-C-h>
nnoremap <C-h> :<C-u>help<Space>

" クリップボードから貼り付け
inoremap <C-r>* <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>

" ]で補完する - http://vim-users.jp/2010/03/hack135/
" inoremap ] <C-n>
" inoremap <expr> ] searchpair('\[', '', '\]', 'nbW', 'synIDattr(synID(line("."), col("."), 2), "name") =~? "String"') ? ']' : "\<C-n>"

" kk Escape
inoremap kk <Esc>
inoremap jj <Esc>

" 誤爆防止
nnoremap qq q
nnoremap q <ESC>

" }}}

" map {{{

" Save like Emacs
inoremap <C-x><C-s> <ESC>:<C-u>w<CR>a

" Short
noremap <Space><Space> :<C-u>noautocmd bnext<CR>
noremap <C-Space><C-Space> :<C-u>bprev<CR>
noremap <Left> :<C-u>noautocmd tabprev<CR>
noremap <Right> :<C-u>noautocmd tabnext<CR>
noremap <Up> :<C-u>noautocmd bprev<CR>
noremap <Down> :<C-u>noautocmd bnext<CR>

" 検索時に結果が中央に来るようにする
noremap n nzz
noremap N Nzz

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

" tab
nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprev<CR>

" window walker
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-h> <C-w>h
nnoremap <M-l> <C-w>l
inoremap <M-j> <Esc><C-w>j
inoremap <M-k> <Esc><C-w>k
inoremap <M-h> <Esc><C-w>h
inoremap <M-l> <Esc><C-w>l

" runes
imap <C-z>z <Plug>(runes_toggle)
imap <C-z><C-z> <Plug>(runes_toggle)
imap <C-z>g <Plug>(runes_start_german)
imap <C-z>a <Plug>(runes_start_anglosaxon)
imap <C-z>d <Plug>(runes_start_denmark)
imap <C-z>s <Plug>(runes_start_sweden)

" Toggle NeoCon
nnoremap <Leader>n :<C-u>NeoComplCacheToggle<CR>

" }}}

" map <Leader> {{{

" Leaders
nmap s <Leader>

" eregex 検索
noremap <Leader>/ :<C-u>M/
noremap <Leader>? :<C-u>M?

" buffer
noremap <Leader>x :<C-u>bdelete<CR>

" ref.vim
nnoremap <Leader>r :<C-u>Ref<Space>

" 改行
nnoremap <CR> o<ESC>

" tab
nnoremap <Leader>tn :<C-u>tabnew<CR>
nnoremap <Leader>te :<C-u>tabedit<Space>
nnoremap <Leader>tx :<C-u>tabclose<CR>

" Unite
noremap <Leader>b :<C-u>Unite -buffer-name=files buffer_tab<CR>
nnoremap <Leader>uu :<C-u>Unite<Space>
nnoremap <Leader>U :<C-u>Unite<Space>
nnoremap <Leader>um :<C-u>Unite -buffer-name=files file_mru<CR>
nnoremap <Leader>uM :<C-u>Unite mapping<CR>
nnoremap <Leader>uf :<C-u>Unite -buffer-name=files file_rec/async<CR>
nnoremap <Leader>uF :<C-u>Unite -buffer-name=files file<CR>
nnoremap <Leader>ud :<C-u>Unite -buffer-name=files -default-action=cd<Space>directory_mru<CR>
nnoremap <Leader>uh :<C-u>Unite help<CR>
nnoremap <Leader>uo :<C-u>Unite outline<CR>
nnoremap <Leader>ug :<C-u>Unite grep<CR>
nnoremap <Leader>ur :<C-u>Unite register<CR>
nnoremap <Leader>ut :<C-u>Unite tag<CR>
nnoremap <Leader>uT :<C-u>Unite tab:no-current<CR>
nnoremap <Leader>uw :<C-u>Unite window:no-current<CR>

" QuickRun
nnoremap <Leader>R :<C-u>QuickRun<CR>

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <Leader>o <Plug>(openbrowser-smart-search)
vmap <Leader>o <Plug>(openbrowser-smart-search)


" }}}

" 全角でかかないようにする map {{{

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

" Auto Command {{{

" 自動で窓開く
MeowtoCmd QuickFixCmdPost vimgrep cwin

" 折りたたみの保存 - http://vim-users.jp/2009/10/hack84/
MeowtoCmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
MeowtoCmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" Don't save options.
set viewoptions-=options

" }}}

" Abbr {{{

iabbr blogfiles http://snca.net/blogfiles/

" }}}

" PATH {{{

let $PATH="/home/anekos/bin:/home/anekos/.cabal/bin:".$PATH

" }}}


"---------------------------------------
" 環境別設定
"---------------------------------------

" シェル設定 {{{

if has('win32')
  "set shell=e:\\cygwin\\bin\\zsh.exe\ -i
  "set shellredir=2>&1\|iconv\ -s>%s
  "set shellcmdflag=--login\ -c
  "set shellslash
  "set shellquote=""
  "set shellxquote="\""
endif

" }}}

" CUI - カラースキーム {{{

if !has('gui')
  command! -bar ReloadColors set t_Co=256 t_SI=[3\ q t_EI=[1\ q | colorscheme molokai | colorscheme molokai-fix
  MeowtoCmd VimEnter * ReloadColors
endif

" }}}


"---------------------------------------
" スクリプト
"---------------------------------------

" 関数 {{{

function! Size ()
  let r = 0
  for i in range(1, line('$'))
    if match(getline(i), "^#")
      let r += len(getline(i))
    endif
  endfor
  echo r
endfunction

function! InsertText (s)
  let px = getpos(".")[2]
  let line = getline(".")
  let oline = strpart(line, 0, px)  . a:s . strpart(line, px, 1000)
  echo oline
  call setline(".", oline)
endfunction

function! InsertDate ()
  let d = system("date")
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
    let r = ""
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
  if getfsize(bufname("")) > 10
    return
  endif
  let filename = $HOME . '/.vim/template/' . &filetype . '.txt'
  if !filereadable(filename)
    return
  endif
  execute '0read ' . filename
  normal G
  setlocal fileencoding=utf8
endfunction

command! -bar LoadTemplate :call s:LoadTemplate()
" MeowtoCmd BufNewFile,BufRead * :call s:LoadTemplate()

" }}}

" 行末のスペースをハイライトする {{{

function! s:HighlightTrailingSpaces ()
  highlight WhitespaceEOL ctermbg=red guibg=red
  match WhitespaceEOL /[[:space:]　\t]\+$/
endfunction

MeowtoCmd BufNewFile,WinEnter * call s:HighlightTrailingSpaces()

" }}}


"---------------------------------------
" 複雑なマッピング
"---------------------------------------

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


"---------------------------------------
" コマンド
"---------------------------------------

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

" 読みモード
command! -bar Reader setlocal scrolloff=666 | :highlight Cursor guifg=NONE guibg=NONE | FontVL

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
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

"シンタックスの再同期
command! -bar SSF syntax sync fromstart

" LiName
command! -bar LiNameSort sort /^\d\+\t/

" }}}

" スクラッチバッファ {{{

function! s:Scratch ()
  new
  setlocal buftype=nowrite
endfunction
command! -bar Scratch :call s:Scratch()

" }}}

" Encoding {{{

" http://www.kawaz.jp/pukiwiki/?vim

if 1

  let s:default_encoding = "utf-8"

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

" }}}

" Encoding - anekos {{{

"set fileencodings=utf-8
set fileencoding=utf-8

" }}}

" ヘルプタグ {{{

" helptag ~/.vim/doc
function! s:MakeHelpTags ()
  for path in split(&runtimepath, ",")
    echo path
    let path .= "/doc"
    if isdirectory(path)
      try
        execute "helptags " . path
      catch
        echo "Error on: " . path
      endtry
    endif
  endfor
  helptags ~/.vim/doc
  echo "Done."
endfunction

command! -bar MakeHelpTags :call s:MakeHelpTags()

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

" カレントファイルのパスをクリプボぅ! {{{

command! -bar CopyCurrentFilepath :call s:CopyCurrentFilepath()
function! s:CopyCurrentFilepath ()
  if has('win32')
    let @*=substitute(expand('%:p'), '\\/', '\\', 'g')
  elseif has('unix')
    let @*=expand('%:p')
  endif
endfunction

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


"---------------------------------------
" プラグイン用設定
"---------------------------------------

" let - プラグイン設定 {{{

" OutLine Mode
let g:Tlist_Ctags_Cmd = 'ctags'

" Ruby Syntax
let g:ruby_minlines = 100

" ChangeLog
let g:changelog_dateformat="%Y-%m-%d (%a)"
let g:changelog_username = "ANekoS"
let g:changelog_date_end_entry_search = '^\s*$'

" QuickBuf
let g:qb_hotkey = "\\\\"

" haskell_doc.vim を無視
let g:haddock_index = 1

let g:lisp_instring = 1
let g:lisp_rainbow = 1

if !has('gui')
  let g:loaded_showmarks = 1
endif

" }}}

" qfixhowm {{{

let g:QFixHowm_Key        = 's'
let g:QFixHowm_KeyB       = 'q'
let g:howm_dir            = '~/howm'
let g:howm_filename       = '%Y/%m/%Y-%m-%d.howm'
let g:howm_fileencoding   = 'utf-8'
let g:howm_fileformat     = 'unix'
let g:QFixHowm_DiaryFile  = '%Y/%m/%Y-%m-%d.howm'
" project.vim とかぶるので無効化
let g:QFix_Wincmd_O       = 0
"Quickfixウィンドウの高さ。0以下ならば最大になる。
"プレビューウィンドウの高さは、set previewheight で指定する。
let QFix_Height                = 15
"Quickfixウィンドウの高さの最大値。
"vimのウィンドウサイズからQFix_HeightMaxを引いた値がQuickfixウィンドウの最大値になる。
let QFix_HeightMax             = 15
"QuickfixウィンドウサイズをQFix_HeightDefaultに固定する/しない。
"QFix_HeightDefaultは無指定なら、起動時にQFix_Heightに設定される。
let QFix_HeightFixMode         = 1
"Quickfixウィンドウから開いた後ウィンドウを閉じる/閉じない。
" let QFix_CloseOnJump           = 0
"Quickfixウィンドウでプレビューを有効にする。
" let QFix_PreviewEnable         = 1
"Quickfixウィンドウのプレビューでfiletypeのハイライトを有効にする。
"環境やファイルサイズによっては重くなるので、その場合はOFFにしてください。
" let QFix_PreviewFtypeHighlight = 1
"カーソルラインを表示する
" let QFix_CursorLine            = 1
"プレビュー画面のカーソルラインを表示する
" let QFix_PreviewCursorLine     = 1
"アンダーラインにしたい場合は次のようにハイライトを設定する。
"hi CursorLine guifg=NONE guibg=NONE gui=underline
"ファイルを画面分割して開く/開かない。
" let QFix_FileOpenMode = 0

" }}}

" VimShell {{{

let g:vimshell_split_command = 'split'
let g:vimshell_interactive_cygwin_path = "e:/cygwin/bin/"

" lein repl を起動
command! -bar Lein execute ":VimShellInteractive lein repl"

" VimShell に選択文字列を送信
function! s:vs_send_string (line1, line2)
  let l:string = ""
  for l:line in getline(a:line1, a:line2)
    let l:string .= substitute(l:line, '^\s\+|\s\+$', ' ', 'g')
  endfor
  execute 'VimShellSendString ' . l:string
endfunction

command! -bar -range -nargs=? VimShellJoinedSendString call s:vs_send_string(<line1>, <line2>)
"command! VimShellIntRestart :call vimshell#int_mappings#restart_command()

vnoremap <silent> <Leader>S :VimShellJoinedSendString<CR>
vnoremap <silent> <Leader>s :VimShellSendString<CR>

command! -bar Ghci :VimShellInteractive ghci


"}}}

" Ref {{{

let g:ref_clojure_cmd = 'clojure'
let g:ref_clojure_precode = "(use '(clojure.contrib str-utils def repl-utils macro-utils))"

" たぶんいらない
"let g:ref_clojure_classpath = ['/usr/local/java/clojure-contrib.jar']

MeowtoCmd FileType ref call s:initialize_ref_viewer()
function! s:initialize_ref_viewer()
  " nmap <buffer> b <Plug>(ref-back)
  " nmap <buffer> f <Plug>(ref-forward)
  nnoremap <buffer> q <C-w>c
  setlocal nonumber
endfunction

"}}}

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

" Zen Coding {{{

let g:user_zen_leader_key = '<C-k>'

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

" Neo Complete Cache {{{

" imap <silent><C-l>     <Plug>(neocomplcache_snippets_expand)
" smap <silent><C-l>     <Plug>(neocomplcache_snippets_expand)
" nmap <silent><C-e>     <Plug>(neocomplcache_keyword_caching)
" imap <expr><silent><C-e>     pumvisible() ? "\<C-e>" : "\<Plug>(neocomplcache_keyword_caching)"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_max_menu_width = 20

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

" eregexp {{{

" http://d.hatena.ne.jp/h1mesuke/20100703/p1
let g:eregex_meta_chars = '^$()|[]{}.*+?\/'
let g:vregex_meta_chars = '^$|[].*\/'
"nnoremap <silent> * :M/<C-r>=substitute(escape(expand("<cword>"),g:vregex_meta_chars),"\n",'\\n','g')<CR><CR>
vnoremap <silent> * "vy/<C-r>=substitute(escape(@v, g:vregex_meta_chars), "\n", '\\n', 'g')<CR><CR>

" }}}

" VimClojure {{{

let vimclojure#WantNailgun = 0
let vimclojure#NailgunClient = "~/.vim-plugins/vimclojure/bin/ng"

" }}}

" AlterCmd " {{{

call altercmd#load()
AlterCommand ref Ref
AlterCommand execlip Execlip
AlterCommand ssf SSF
AlterCommand align Alignta
AlterCommand cd TabpageCD

" }}}

" Unite {{{

let g:unite_enable_start_insert = 1
let g:unite_enable_smart_case = 1
let g:unite_source_file_ignore_pattern = ''
let g:unite_source_file_ignore_pattern .=
      \ '_darcs\|\.git\|\%(' . substitute('png jpeg jpg gif jar dcu manifest dll exe exp o so bak sw res dep idb pdb user ilk ncb class', ' ', '\\|', 'g') . '\)$'
let g:unite_source_file_rec_ignore_pattern = g:unite_source_file_ignore_pattern
let g:unite_source_directory_mru_ignore_pattern = ''

let g:unite_kind_openable_cd_command = "TabpageCD"
let g:unite_source_file_mru_ignore_pattern = 'temp'

" }}}

" essk.vim {{{
let g:eskk#dictionary = {
\ 'path': '/home/anekos/.eskk/dic/SKK-JISYO.L',
\ 'sorted': 0,
\ 'encoding': 'eucjp-ms',
\}
" }}}

" im_control {{{

" " 「日本語入力固定モード」切替キー
" inoremap <silent> <C-q> <C-r>=IMState('FixMode')<CR>
"
" " Pythonインターフェイス制御のみ使用する
" let IM_CtrlIBusPython = 2
"
" if has('gui_running')
"   " iminsert=1を設定して IBusの vi協調モードを無効化する
"   set iminsert=0
" endif
"
" let IM_CtrlIBusPythonVer = 'python'

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

" mkdpreview {{{

let g:mkdpreview_python_path = '/usr/bin/python2'

" }}}

" ghcmod-vim {{{

let g:ghcmod_ghc_options = ['-ilib']

" }}}

" jscomplete {{{

let g:jscomplete_use = ['dom', 'moz', 'xpcom']

" }}}

" vimfiler {{{

source ~/.vimfilerrc

" }}}

" powerline {{{

" Do :PowerlineClearCache and restart, when you changed.
let g:Powerline_symbols = 'fancy'
call Pl#Theme#InsertSegment('charcode', 'after', 'filetype')

" }}}


"---------------------------------------
" テーマ
"---------------------------------------

" color {{{

colorscheme anekos

" }}}

