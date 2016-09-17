call plug#begin('~/.vim-temp/plug')

" Visual {{{

Plug 'cohama/easy-colorcolumn'
Plug 'itchyny/thumbnail.vim'
Plug 'osyo-manga/vim-brightest'
Plug 'rhysd/inazuma.vim'
Plug 'ryanoasis/vim-devicons'
Plug 't9md/vim-quickhl'
Plug 'thinca/vim-zenspace'
Plug 'VOom'
Plug 'Yggdroot/indentLine'

" }}}

" Benri {{{

Plug 'haya14busa/niconicomment.vim'
Plug 'heavenshell/vim-pokemon'
" Plug 'tyru/banban.vim'
" if = 'has("gui_running")'

" }}}

" Corpse Blinder {{{

Plug 'cocopon/iceberg.vim'
Plug 'popkirby/lightline-iceberg'
Plug 'freeo/vim-kalisi'
Plug 'aereal/vim-colors-japanesque'

" }}}

" Completion {{{

Plug 'mattn/googlesuggest-complete-vim'
Plug 'mattn/sonictemplate-vim'
Plug 'mattn/sonictemplate-vim'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'ujihisa/neco-look'
" Plug 'cohama/lexima.vim'
" Plug 'Valloric/YouCompleteMe' ", {'build': {'unix' : './install.sh'}}

" }}}

" Development {{{

Plug 'AndrewRadev/linediff.vim'
Plug 'cohama/vim-hier'
Plug 'kannokanno/previm'
Plug 'metakirby5/codi.vim'
Plug 'osyo-manga/shabadou.vim'
Plug 'osyo-manga/vim-watchdogs'
Plug 'scrooloose/syntastic'
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'tyru/caw.vim'

" }}}

" Filetype {{{

" filetype / syntax / indent
Plug 'chase/vim-ansible-yaml'
Plug 'elzr/vim-json'
Plug 'freitass/todo.txt-vim'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'toshi32tony3/vim-trailing-whitespace'
Plug 'rcmdnk/vim-markdown'
Plug 'sudar/vim-arduino-syntax'
Plug 'mattn/emmet-vim'
Plug 'cespare/vim-toml'
Plug 'lfe-support/vim-lfe'

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
Plug 'rhysd/committia.vim'
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
Plug 'violetyk/gitquick.vim'
Plug 'vim-utils/vim-man'

" }}}

" Misc {{{

" Plug 'tyru/eskk.vim'
Plug 'anekos/runes-vim'
Plug 'Konfekt/FastFold'
Plug 'Shougo/junkfile.vim'
Plug 'sjl/gundo.vim'
Plug 'tyru/open-browser.vim'
Plug 'yuratomo/gmail.vim'
" Plug 'Shougo/vimfiler.vim'

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

let g:plugins_installed = 1
