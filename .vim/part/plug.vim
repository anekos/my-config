"========================
" |_/ |\  |\__    \    /
" |_  | \ |   \     \/
" | \ |   |    |   /  \
"     |   |    | /     \
"========================

" %Alignta g/^Plug "

scriptencoding utf-8

call plug#begin('~/.vim-temp/plug')

" Visual {{{

Plug 'itchyny/thumbnail.vim'            " サムネ表示でバッファを選択
Plug 'osyo-manga/vim-brightest'         " 現在のカーソル位置の単語を常にハイライトする
Plug 't9md/vim-quickhl'                 " 複数の単語をカラフルにハイライト
Plug 'thinca/vim-zenspace'              " 忌しき全角の空白を暴露する
Plug 'VOom'                             " アウトライン表示する :Voom
Plug 'Yggdroot/indentLine'              " 線でインデントレベルを表示する

" }}}

" Benri {{{

Plug 'haya14busa/niconicomment.vim'     " コメントをニコニコ動画のように流す。レビューの時に便利
Plug 'heavenshell/vim-pokemon'          " 伝説のチンポコモンを探そう
Plug 'tyru/banban.vim'                  " Vim をバンバンする
Plug 'pocke/sushibar.vim'               " https://www.youtube.com/watch?v=epfPe2U_2Xk

" }}}

" Corpse Blinder {{{

Plug 'aereal/vim-colors-japanesque'     " カ
Plug 'AlessandroYorba/Alduin'           " ラ
Plug 'altercation/vim-colors-solarized' " フ
Plug 'cocopon/iceberg.vim'              " ル
Plug 'freeo/vim-kalisi'                 " ナ
Plug 'jacoborus/tender'                 " ヴ
Plug 'jonathanfilip/vim-lucius'         " ィ
Plug 'lifepillar/vim-solarized8'        " ム
Plug 'morhetz/gruvbox'                  " ゥ
Plug 'popkirby/lightline-iceberg'       " ス
Plug 'rhysd/vim-color-spring-night'     " キ


" }}}

" Completion {{{

Plug 'mattn/sonictemplate-vim'          " :Template
Plug 'Konfekt/FastFold'                 " ネオコンがほしがる
Plug 'Shougo/neocomplete'               " ネオコン
Plug 'Shougo/neosnippet'                " すにぺ
Plug 'Shougo/neosnippet-snippets'       " すにぺぺ
Plug 'ujihisa/neco-look'                " look コマンドを使用して英単語の補完
Plug 'cohama/lexima.vim'                " かっこよく括弧を入力する

" }}}

" Development {{{

Plug 'AndrewRadev/linediff.vim'         " 選択した行の diff を取る
Plug 'cohama/vim-hier'                  " QuickFix の該当箇所をハイライトする
Plug 'metakirby5/codi.vim'              " インタラクティブな scratch バッファを作成する :Codi ruby
Plug 'osyo-manga/shabadou.vim'          " QuickRun Hooks
Plug 'osyo-manga/vim-watchdogs'         " Syntax Checker
" Plug 'scrooloose/syntastic'             " Syntax Checker
Plug 'thinca/vim-qfreplace'             " quickfix 上で r を押して、元ファイルを置換する
Plug 'thinca/vim-quickrun'              " くいっくるん
Plug 'tyru/caw.vim'                     " コメントアウトするやつ

" }}}

" Filetype {{{

" filetype / syntax / indent
Plug 'chase/vim-ansible-yaml'
Plug 'elzr/vim-json'
Plug 'freitass/todo.txt-vim'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'rcmdnk/vim-markdown'
Plug 'sudar/vim-arduino-syntax'
Plug 'mattn/emmet-vim'
Plug 'cespare/vim-toml'

" (Java|ECMA|Type)Script
Plug 'salomvary/vim-eslint-compiler'

" Haskell
Plug 'bitc/lushtags'
Plug 'dag/vim2hs'
Plug 'eagletmt/unite-haddock'
Plug 'ujihisa/unite-haskellimport'
" Plug 'eagletmt/ghcmod-vim'
" Plug 'ujihisa/neco-ghc'

" Common Lisp
Plug 'mopemope/unite-hyperspec'
" Plug 'vim-scripts/slimv.vim' " vim update issue s:

" Clojure
Plug 'thinca/vim-ft-clojure'
Plug 'ujihisa/neoclojure.vim'

" Lisp
Plug 'guns/vim-sexp'
" Plug 'paredit.vim'

" Scala
Plug 'derekwyatt/vim-scala'

" Rust
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'

" }}}

" Formatter {{{

Plug 'dhruvasagar/vim-table-mode'
Plug 'h1mesuke/vim-alignta'

" }}}

" Game {{{

Plug 'katono/rogue.vim'
Plug 'mattn/flappyvird-vim'
Plug 'mattn/habatobi-vim'
Plug 'mattn/invader-vim'
Plug 'thinca/vim-threes'
Plug 'progressbar-widget'
" Plug 'mattn/die-vim'

" }}}

" Information {{{

Plug 'itchyny/lightline.vim'
Plug 'KazuakiM/vim-qfstatusline'
Plug 'manicmaniac/betterga'
" Plug 'majutsushi/tagbar'

" }}}

" Library {{{

Plug 'haya14busa/vim-migemo'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'mattn/webapi-vim'
Plug 'Shougo/vimproc.vim'
Plug 'vim-jp/vital.vim'

" }}}

" Metarw {{{

Plug 'kana/vim-metarw'
Plug 'mattn/vim-metarw-gdrive'

" }}}

" Net {{{

Plug 'basyura/J6uil.vim'
Plug 'heavenshell/vim-slack'

" }}}

" Operator {{{

Plug 'kana/vim-operator-replace'
Plug 'wellle/targets.vim'
Plug 'tommcdo/vim-exchange'

" }}}

" Search And Destroy {{{

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'osyo-manga/vim-over'
Plug 'rking/ag.vim'
Plug 'tyru/chdir-proj-root.vim'
Plug 'vim-scripts/gtags.vim'

" }}}

" Shell {{{

Plug 'b4b4r07/vim-shellutils'
Plug 'Shougo/vimshell'
Plug 'mattn/vim-terminal'

" }}}

" Sticky Fingers {{{

Plug 'AndrewRadev/switch.vim'
Plug 'deris/vim-rengbang'
Plug 'gcmt/wildfire.vim'
Plug 'kana/vim-niceblock'
Plug 'kana/vim-submode'
Plug 'tpope/vim-surround'
Plug 'thinca/vim-portal'
Plug 't9md/vim-textmanip'
Plug 'tyru/vim-altercmd'

" }}}

" Text Object {{{

"     b   = Any brackets
"     fX  = beetween X - http://d.hatena.ne.jp/thinca/20100614/1276448745
"     i   = Indent Level
"     u   = URL
"     y   = Syntax
"     z   = Fold
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'mattn/vim-textobj-url'
Plug 'osyo-manga/vim-textobj-multiblock'

" }}}

" Tool {{{

Plug 'tasuten/gcalc.vim'
Plug 'Shougo/vinarise'
Plug 'tpope/vim-speeddating'

" }}}

" Unplugged {{{

Plug 'LeafCage/nebula.vim'
Plug 'thinca/vim-editvar'
Plug 'thinca/vim-prettyprint'
Plug 'tyru/capture.vim'
Plug 'tyru/foldballoon.vim'

" }}}

" Ref {{{

Plug 'phongvcao/vim-stardict'
Plug 'taka84u9/vim-ref-ri'
Plug 'thinca/vim-ref'
Plug 'ujihisa/ref-hoogle'
Plug 'rhysd/devdocs.vim'
Plug 'aiya000/aref-web.vim'

" }}}

" Unicode {{{

Plug 'mattn/emoji-vim'

" }}}

" Unite {{{

Plug 'lambdalisue/unite-grep-vcs'
Plug 'mattn/httpstatus-vim'
Plug 'mattn/unite-mpc'
Plug 'osyo-manga/unite-nyancat_anim'
Plug 'osyo-manga/unite-quickfix'
Plug 'osyo-manga/unite-quickrun_config'
Plug 'rhysd/unite-stackoverflow.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite-help'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite.vim'
Plug 'thinca/vim-unite-history'
Plug 'tsukkee/unite-tag'
Plug 'ujihisa/unite-colorscheme'
Plug 'ujihisa/unite-locate'

" }}}

" VCS {{{

Plug 'cohama/agit.vim'
Plug 'hrsh7th/vim-unite-vcs'
Plug 'kmnk/vim-unite-giti'
Plug 'lambdalisue/vim-gista'
Plug 'lambdalisue/vim-gita'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'

" }}}

" Vim {{{

Plug 'mattn/benchvimrc-vim'
Plug 'thinca/vim-ambicmd'
Plug 'thinca/vim-fontzoom'
Plug 'thinca/vim-localrc'
Plug 'thinca/vim-scouter'
Plug 'tyru/restart.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'todesking/vint-syntastic'
Plug 'vim-utils/vim-man'

" }}}

" Misc {{{

Plug 'anekos/runes-vim'
Plug 'sjl/gundo.vim'                    " undo ツリーを表示して、履歴を移動したい
Plug 'tyru/open-browser.vim'
Plug 'skywind3000/asyncrun.vim'         " 非同期でシェルのコマンドを実行し、quickfix ににゅるっと出す
Plug 'haya14busa/vim-gtrans'
Plug 'yami-beta/vim-responsive-tabline' " れすぽんちぶのタブ表示
Plug 'yuttie/comfortable-motion.vim'    " 慣性スクロール

" }}}

" White Zombie {{{

Plug 'LeafCage/alti.vim'

" }}}

" Our {{{

Plug 'anekos/felis-cat-igirisu-toast-express'
Plug 'anekos/runes-vim'
Plug 'anekos/manga-osort'
Plug 'anekos/unite-font'
Plug 'anekos/commandlinefu.vim'
Plug 'anekos/unite-located-session'
" Plug 'liname-hs' repo = 'anekos/liname-hs' rtp = 'res/vim'
" Plug 'xmonad'
" repo = '~/.xmonad/res/vim'

" }}}

" Unmanaged {{{

function! s:add_my_plugin(plugin)
  for l:base in ['', '~/project/', '~/repos/', '~/project/vim-plugins/']
    let l:path = l:base . a:plugin.path
    let l:expanded = expand(l:path)
    if isdirectory(l:expanded)
      execute 'Plug' printf("'%s'", l:path)
      return
    endif
  endfor
endfunction

function! s:add_my_plugins()
  for l:plugin in g:my_plugins
    call s:add_my_plugin(l:plugin)
  endfor
endfunction

call s:add_my_plugins()

" }}}

call plug#end()
