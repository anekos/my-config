"=============================================
" | \  |\__     |    |\  /|  |\  |\  /|  |
" | /  |   \   _|_|  | \/ |  | \ | \/ |  | /|
" | \  |    | | |    | /\ |  |   |    |  |/ |
" | /  |    |   |    |/  \|  |   |    |     |
"=============================================

scriptencoding utf8

" NeoBundle {{{

" pre {{{
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim-temp/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim-temp/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" }}}

" Visual {{{
NeoBundle 'cohama/easy-colorcolumn'
NeoBundle 'itchyny/thumbnail.vim'
NeoBundle 'osyo-manga/vim-brightest'
NeoBundle 'rhysd/inazuma.vim'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'thinca/vim-zenspace'
NeoBundle 'VOom'
NeoBundle 'Yggdroot/indentLine'
" }}}

" Benri {{{
NeoBundle 'osyo-manga/vim-fancy'
NeoBundle 'haya14busa/niconicomment.vim'
" GUI Only
if has('gui')
  NeoBundle 'tyru/banban.vim'
endif
" }}}

" Corpse Blinder {{{
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'popkirby/lightline-iceberg'
NeoBundle 'freeo/vim-kalisi'

function! s:LoadColors ()
  NeoBundle '29decibel/codeschool-vim-theme'
  NeoBundle 'aereal/vim-magica-colors'
  NeoBundle 'ajh17/Spacegray.vim'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'atelierbram/vim-colors_atelier-schemes'
  NeoBundle 'bluecloud'
  NeoBundle 'bluntpeak/bluntpeak-vim-colors'
  NeoBundle 'chriskempson/vim-tomorrow-theme'
  NeoBundle 'ciaranm/inkpot'
  NeoBundle 'Colour-Sampler-Pack'
  NeoBundle 'djjcast/mirodark'
  NeoBundle 'Donearm/Ubaryd'
  NeoBundle 'fisadev/fisa-vim-colorscheme'
  NeoBundle 'itchyny/landscape.vim'
  NeoBundle 'jonathanfilip/vim-lucius'
  NeoBundle 'jpo/vim-railscasts-theme'
  NeoBundle 'junegunn/seoul256.vim'
  NeoBundle 'machakann/vim-colorscheme-imas'
  NeoBundle 'Marslo/marslo.vim'
  NeoBundle 'morhetz/gruvbox'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'NLKNguyen/papercolor-theme'
  NeoBundle 'noahfrederick/vim-noctu'
  NeoBundle 'Pychimp/vim-sol'
  NeoBundle 'rdark'
  NeoBundle 'rhysd/vim-color-splatoon'
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
  " NeoBundle 'git://gist.github.com/187578.git', { 'name' : 'h2u_colors' }
endfunction
command! -bar LoadColors call s:LoadColors()
" }}}

" Completion {{{
NeoBundle 'mattn/googlesuggest-complete-vim'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'ujihisa/neco-look'
" NeoBundle 'cohama/lexima.vim'
" NeoBundle 'Valloric/YouCompleteMe' ", {'build': {'unix' : './install.sh'}}
" }}}

" Development {{{
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/caw.vim'
NeoBundle 'cohama/vim-hier'
" }}}

" Filetype {{{

" filetype / syntax / indent
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'elzr/vim-json'
NeoBundle 'freitass/todo.txt-vim'
NeoBundle 'Matt-Deacalion/vim-systemd-syntax'
NeoBundle 'toshi32tony3/vim-trailing-whitespace'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'sudar/vim-arduino-syntax'

NeoBundle 'mattn/emmet-vim'
MeowtoCmd FileType html NeoBundleSource mattn/emmet-vim

" (Java|ECMA|Type)Script
NeoBundle 'salomvary/vim-eslint-compiler'
MeowtoCmd FileType javascript NeoBundleSource salomvary/vim-eslint-compiler

" Haskell
NeoBundle 'bitc/lushtags'
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'ujihisa/unite-haskellimport'
MeowtoCmd FileType haskell NeoBundleSource bitc/lushtags dag/vim2hs eagletmt/unite-haddock ujihisa/unite-haskellimport
" NeoBundle 'eagletmt/ghcmod-vim'
" NeoBundle 'ujihisa/neco-ghc'

" Common Lisp
NeoBundle 'mopemope/unite-hyperspec'
" NeoBundle 'vim-scripts/slimv.vim' " vim update issue s:

" Clojure
NeoBundle 'thinca/vim-ft-clojure'
NeoBundle 'ujihisa/neoclojure.vim'
" MeowtoCmd FileType clojure NeoBundleSource vim-ft-clojure

" Lisp
NeoBundle 'guns/vim-sexp'
MeowtoCmd FileType clojure,lisp NeoBundleSource
" NeoBundle 'paredit.vim'

" Scala
NeoBundle 'derekwyatt/vim-scala'

" }}}

" Formatter {{{
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'h1mesuke/vim-alignta'
" }}}

" Game {{{
NeoBundle 'katono/rogue.vim'
NeoBundle 'mattn/flappyvird-vim'
NeoBundle 'mattn/habatobi-vim'
NeoBundle 'mattn/invader-vim'
NeoBundle 'thinca/vim-threes'
NeoBundle 'progressbar-widget'
" NeoBundle 'mattn/die-vim'
" }}}

" Information {{{
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'KazuakiM/vim-qfstatusline'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'manicmaniac/betterga'
" }}}

" Library {{{
NeoBundle 'haya14busa/vim-migemo'
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
" }}}

" Metarw {{{
NeoBundle 'kana/vim-metarw'
NeoBundle 'mattn/vim-metarw-gdrive'
" }}}

" Net {{{
NeoBundle 'basyura/J6uil.vim'
NeoBundle 'heavenshell/vim-slack'
" }}}

" Operator {{{
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'wellle/targets.vim'
NeoBundle 'tommcdo/vim-exchange'
" }}}

" Search And Destroy {{{
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'haya14busa/vim-asterisk'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'rking/ag.vim'
NeoBundle 'tyru/chdir-proj-root.vim'
NeoBundle 'vim-scripts/gtags.vim'
" }}}

" Shell {{{
NeoBundle 'b4b4r07/vim-shellutils'
NeoBundle 'Shougo/vimshell'
" }}}

" Sticky Fingers {{{
NeoBundle 'AndrewRadev/switch.vim' " gs
NeoBundle 'deris/vim-rengbang'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'kana/vim-niceblock'
NeoBundle 'kana/vim-submode'
NeoBundle 'tpope/vim-surround'
NeoBundle 'thinca/vim-portal'
NeoBundle 'thinca/vim-poslist'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'tyru/vim-altercmd'
" }}}

" Text Object {{{
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
" }}}

" Tool {{{
NeoBundle 'tasuten/gcalc.vim'
NeoBundle 'Shougo/vinarise'
" }}}

" Unplugged {{{
NeoBundle 'LeafCage/nebula.vim'
NeoBundle 'thinca/vim-editvar'
NeoBundle 'thinca/vim-prettyprint'
NeoBundle 'tyru/capture.vim'
NeoBundle 'tyru/foldballoon.vim'
NeoBundle 'tyru/foldballoon.vim'
" }}}

" Ref {{{
NeoBundle 'phongvcao/vim-stardict'
NeoBundle 'taka84u9/vim-ref-ri'
NeoBundle 'thinca/vim-ref'
NeoBundle 'ujihisa/ref-hoogle'
NeoBundle 'rhysd/devdocs.vim'
" }}}

" Unite {{{
NeoBundle 'lambdalisue/unite-grep-vcs'
NeoBundle 'mattn/httpstatus-vim'
NeoBundle 'mattn/unite-mpc'
NeoBundle 'osyo-manga/unite-nyancat_anim'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'osyo-manga/unite-quickrun_config'
NeoBundle 'rhysd/unite-stackoverflow.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-locate'
" }}}

" VCS {{{
NeoBundle 'cohama/agit.vim'
NeoBundle 'hrsh7th/vim-unite-vcs'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'lambdalisue/vim-gista'
NeoBundle 'lambdalisue/vim-gita'
NeoBundle 'rhysd/committia.vim'
NeoBundle 'rhysd/git-messenger.vim'
NeoBundle 'tpope/vim-fugitive'
" }}}

" Vim {{{
NeoBundle 'mattn/benchvimrc-vim'
NeoBundle 'thinca/vim-ambicmd'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'thinca/vim-scouter'
NeoBundle 'tyru/restart.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'todesking/vint-syntastic'
" }}}

" Misc {{{
NeoBundle 'anekos/felis-cat-igirisu-toast-express'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tyru/open-browser.vim'
" }}}

" White Zombie {{{
NeoBundle 'LeafCage/alti.vim'
" }}}

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
  call s:LoadMyPlugin('hledger-vim')
  call s:LoadMyPlugin('commandlinefu.vim')
endif

" }}}

" Pre 2 {{{

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

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
