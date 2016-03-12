"===================================
" |\    |_/  /|\ | |\      |   |
" |\ \/ |_    |  | |\ \/  _|_| | /|
" | \/  | \   |  | | \/  | |   |/ |
" |           |  | |       |      |
"===================================

scriptencoding utf8

" メニューの日本語化を抑止
set langmenu=none

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
set listchars=tab:->,extends:ᛖ,precedes:ᛈ,nbsp:ᛋ,trail:ᛋ

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

" undo を復元してくれるよ!
set undofile
set undodir=~/.vim-temp/undo/

" View ディレクトリ
set viewdir=~/.vim-temp/view

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

" ++
set history=1000

" Unicode の記号などを全角で表示する
set ambiwidth=double

" clipboard
if !has('nvim')
  set clipboard=unnamedplus,autoselect,exclude:cons\|linux
endif

" iskeyword
set iskeyword=@,48-57,_,192-255

" キー入力のタイムアウト
set timeoutlen=750
set ttimeoutlen=250

" 右クリックめぬーでぽっぽあっぽ
set mousemodel=popup

" 矩形ビジュアルモードでカーソルを範囲外まで移動できるようにする
set virtualedit=block

" 選択時の行末関係の挙動 (exclusive にすると vim-sexp の挙動がおかしくなる)
set selection=inclusive

" for :grep
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git\ --exclude='*.json'\ --exclude='*.log'\ --exclude='*min.js'\ --exclude='*min.css'
