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


" Safety {{{

if !has('unix') && has('macunix')
  echo 'huh?'
  silent! quitall!
endif

" }}}

" Reloadablerrr {{{

augroup Meowrc
  autocmd!
augroup END
command! -bang -nargs=* MeowtoCmd autocmd<bang> Meowrc <args>

" }}}

" Encoding {{{

set encoding=utf8
let &termencoding = &encoding
scriptencoding utf8
set fileencodings=utf8

" }}}

" 起動時間を計測 (from .thincarc) {{{

if has('vim_starting') && has('reltime')
  let g:startuptime = reltime()
  MeowtoCmd VimEnter * let g:startuptime = reltime(g:startuptime)
  \                  | redraw
  \                  | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

" }}}

" ショッキカ {{{

if !isdirectory(expand('~/.vim-temp'))
  function s:initialize()
    let l:dirs = split('backup swap undo view info')
    for l:dir in l:dirs
      call mkdir(expand('~/.vim-temp/') . l:dir, 'p')
    endfor

    source ~/.vim/part/plug.vim
    PlugInstall
    quitall!
  endfunction

  call s:initialize()
endif

" }}}

" 自前プラグインとか {{{

let g:my_plugins = [
      \   {'name': 'nox',      'path': 'nox/res/vim'},
      \   {'name': 'hledger',  'path': 'hledger-vim'},
      \   {'name': 'fancy',    'path': 'vim-fancy'},
      \   {'name': 'colocolo', 'path': 'colocolo.vim'},
      \   {'name': 'guruguru', 'path': 'guruguru.vim'},
      \ ]

"}}}



" from ~/.vim/part/let.vim
"================
" |\  |\  /| /|\
" | \ | \/ |  |
" |   |    |  |
" |   |    |  |
"================


" Default plugins {{{
"
let g:loaded_gzip               = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let g:loaded_2html_plugin       = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_logipat            = 1
" let g:loaded_rrhelper           = 1
" let g:loaded_netrw              = 1
" let g:loaded_netrwPlugin        = 1
" let g:loaded_netrwSettings      = 1
" let g:loaded_netrwFileHandlers  = 1

" }}}

" Aref {{{

let g:aref_web_source = {
\   'stackage': {
\     'url': 'https://www.stackage.org/lts-6.6/hoogle?q=%s&page=1'
\   },
\   'weblio': {
\     'url': 'http://ejje.weblio.jp/content/%s'
\   },
\ }

" }}}

" brightest {{{

" カーソル移動が重くなるので…
let g:brightest#enable_on_CursorHold = 1
let g:brightest#enable_filetypes = {'_': 1}
let g:brightest#highlight = {'group': 'BrightestUnderline'}
let g:brightest#enable_clear_highlight_on_CursorMoved = 1

" }}}

" Capture {{{

let g:capture_open_command = 'tabnew'

" }}}

" chdir_proj_root {{{

let g:cpr_autochdir_to_proj = 0

" }}}

" Codi {{{

let g:codi#rightsplit = 0

" }}}

" colocolo {{{

let g:i_am_not_pika_beast = 0

" }}}

" comfortable-motion.vim {{{

let g:comfortable_motion_no_default_key_mappings = 0

" }}}

" commitia {{{

let g:committia_open_only_vim_starting = 0


" https://github.com/rhysd/committia.vim
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    setlocal spell

    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

" }}}

" ft-clojure {{{

let g:clojure#indent#definiens = '\%(letfn\|proxy\|reify\)$\|.\+/def.*'
let g:clojure#indent#special = '\%(^\|/\)def'

" }}}

" fontzoom {{{

let g:fontzoom_no_default_key_mappings=1

" }}}

" hledger {{{

MeowtoCmd FileType hledger setlocal omnifunc=hledger#complete#omnifunc

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

let g:incsearch#magic = ''

" }}}

" IndentLine {{{

let g:indentLine_enabled = 0
let g:indentLine_color_gui = '#343434'
let g:indentLine_faster = 1

" }}}

" J6uil {{{

let g:J6uil_no_default_keymappings = 1
let g:J6uil_display_icon = 1
let g:J6uil_empty_separator = 1

function! s:j6uil_init()
  nmap      <silent><buffer>    a                   <Plug>(J6uil_open_say_buffer)
  nmap      <silent><buffer>    <Leader><Leader>r   <Plug>(J6uil_reconnect)
  nmap      <silent><buffer>    <Leader><Leader>d   <Plug>(J6uil_disconnect)
  nmap      <silent><buffer>    r                   <Plug>(J6uil_unite_rooms)
  nmap      <silent><buffer>    u                   <Plug>(J6uil_unite_members)
  nmap      <silent><buffer>    <CR>                <Plug>(J6uil_action_enter)
  nmap      <silent><buffer>    o                   <Plug>(J6uil_action_open_links)
  nnoremap  <buffer>            <Tab>               /http<CR>:set<Space>nohlsearch<CR>
  nnoremap  <buffer>            <S-Tab>             ?http<CR>:set<Space>nohlsearch<CR>
endfunction

autocmd Meowrc FileType J6uil call s:j6uil_init()

" }}}

" lexima {{{

let g:lexima_enable_basic_rules = 1

" }}}

" lisp {{{

let g:lisp_instring = 0
let g:lisp_rainbow = 1

" }}}

" Nox {{{

let g:nox_base_url = 'http://localhost:9199/'
let g:nox_diary_id_base = 'diary/'

" }}}

" manga-osort {{{

let g:manga_osort_default_options = {'ignorecase': 1}
let g:manga_osort_alias = {
\   '#zsh': {'pattern': '^#', 'key': 1},
\   '#haskell-import': {'pattern': '^import', 'keyprefix': 'import\s\+\(qualified\s\)\?'},
\   '#paragraph': {'pattern': '^\S'},
\   '#neobundle': {'keyprefix': 'NeoBundle\S*', 'pattern': 'NeoBundle'},
\   '#vimrc': {'pattern': '^"'},
\   '#common-list-definition': {'pattern': '^('},
\   '#nox-definiton-list': {'pattern': '^[^\s:]', 'key': 1}
\ }
let g:manga_osort_context = [
\   {'pattern': '^NeoBundle ', 'arguments': '#neobundle'},
\ ]

" }}}

" neco-look {{{

if !exists('g:neocomplete#text_mode_filetypes')
  let g:neocomplete#text_mode_filetypes = {}
endif

let g:neocomplete#text_mode_filetypes = {
\   'rst': 1,
\   'markdown': 1,
\   'gitrebase': 1,
\   'gitcommit': 1,
\   'vcs-commit': 1,
\   'hybrid': 1,
\   'text': 1,
\   'help': 1,
\   'tex': 1,
\   'nox': 1,
\ }

" }}}

" NeoComplete {{{

" https://github.com/Shougo/neocomplete.vim

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 0
let g:neocomplete#enable_ignore_case = 0
let g:neocomplete#sources#syntax#min_keyword_length = 3

if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#sources#omni#functions.hledger = 'hledger#complete#omnifunc'
let g:neocomplete#force_omni_input_patterns.hledger = '\w*'

" Define keyword.
if !exists('g:g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns= {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" }}}

" neoclojure {{{

augroup vimrc-neoclojure
  autocmd!
  " autocmd FileType clojure setlocal omnifunc=neoclojure#complete#omni_auto
augroup END

" }}}

" NeoSnippet {{{

let g:neosnippet#snippets_directory = '~/.vim/snippets'

" }}}

" Quickhl {{{

" 1 だと重いョ
let g:quickhl_tag_enable_at_startup = 0
let g:quickhl_manual_keywords = ['IMPLEMENTME']

" }}}

" ref.vim {{{

let g:ref_open = '10split'

" clojure
let g:ref_clojure_cmd = ['clj']
let g:ref_clojure_precode = '(ns vim-ref (:use [clojure.repl :only (doc find-doc)]))'

let g:ref_detect_filetype = {
\   'zsh': 'man',
\   'bash': 'man',
\   'sh': 'man',
\ }

let g:ref_source_webdict_use_cache = 1

let g:ref_source_webdict_sites = {
\   'je': {
\     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
\   },
\   'ej': {
\     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
\   },
\   'wikipedia:ja': 'http://ja.wikipedia.org/wiki/%s',
\   'wiktionary': {
\     'url': 'http://ja.wiktionary.org/wiki/%s',
\     'keyword_encoding': 'utf-8',
\     'cache': 1,
\   },
\ }

let g:ref_source_webdict_sites.default = 'ej'

" wiktionary 出力に対するフィルタ。最初の数行を削除している。
function! g:ref_source_webdict_sites.wiktionary.filter(output)
  return join(split(a:output, "\n")[18 :], "\n")
endfunction

autocmd Meowrc FileType ref call s:initialize_ref_viewer()
function! s:initialize_ref_viewer()
  " nmap <buffer> b <Plug>(ref-back)
  " nmap <buffer> f <Plug>(ref-forward)
  nnoremap <buffer> q <C-w>c
  setlocal nonumber
endfunction

"}}}

" restart.vim {{{

let g:restart_sessionoptions = 'blank,buffers,curdir,folds,help,localoptions,tabpages'

" }}}

" Rogue {{{

function! s:vogue()
  let g:rogue#message = 'mesg_E'
  let g:rogue#japanese = 0

  " let &guifont='New Britannia Runic Carved\, 12'
  let &guifont = 'New Britannia Runic Stroke\, 22'
  " let &guifont='Runic\, 22'

  set columns=80
  set lines=24

  redraw

  Rogue
endfunction

command! -bar Vogue :call s:vogue()

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

" rust {{{

let g:racer_cmd = expand('$HOME/.cargo/bin/racer')

" 自動整形
let g:rustfmt_autosave = 0
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'

" }}}

" sexp {{{

" Disable mapping hooks
let g:sexp_filetypes = ''

function! s:vim_sexp_mappings()
  xmap <silent><buffer> af              <Plug>(sexp_outer_list)
  omap <silent><buffer> af              <Plug>(sexp_outer_list)
  xmap <silent><buffer> if              <Plug>(sexp_inner_list)
  omap <silent><buffer> if              <Plug>(sexp_inner_list)
  xmap <silent><buffer> aF              <Plug>(sexp_outer_top_list)
  omap <silent><buffer> aF              <Plug>(sexp_outer_top_list)
  xmap <silent><buffer> iF              <Plug>(sexp_inner_top_list)
  omap <silent><buffer> iF              <Plug>(sexp_inner_top_list)
  xmap <silent><buffer> as              <Plug>(sexp_outer_string)
  omap <silent><buffer> as              <Plug>(sexp_outer_string)
  xmap <silent><buffer> is              <Plug>(sexp_inner_string)
  omap <silent><buffer> is              <Plug>(sexp_inner_string)
  xmap <silent><buffer> ae              <Plug>(sexp_outer_element)
  omap <silent><buffer> ae              <Plug>(sexp_outer_element)
  xmap <silent><buffer> ie              <Plug>(sexp_inner_element)
  omap <silent><buffer> ie              <Plug>(sexp_inner_element)
  nmap <silent><buffer> (               <Plug>(sexp_move_to_prev_bracket)
  xmap <silent><buffer> (               <Plug>(sexp_move_to_prev_bracket)
  omap <silent><buffer> (               <Plug>(sexp_move_to_prev_bracket)
  nmap <silent><buffer> )               <Plug>(sexp_move_to_next_bracket)
  xmap <silent><buffer> )               <Plug>(sexp_move_to_next_bracket)
  omap <silent><buffer> )               <Plug>(sexp_move_to_next_bracket)
  " nmap <silent><buffer> <M-b>           <Plug>(sexp_move_to_prev_element_head)
  " xmap <silent><buffer> <M-b>           <Plug>(sexp_move_to_prev_element_head)
  " omap <silent><buffer> <M-b>           <Plug>(sexp_move_to_prev_element_head)
  " nmap <silent><buffer> <M-w>           <Plug>(sexp_move_to_next_element_head)
  " xmap <silent><buffer> <M-w>           <Plug>(sexp_move_to_next_element_head)
  " omap <silent><buffer> <M-w>           <Plug>(sexp_move_to_next_element_head)
  " nmap <silent><buffer> g<M-e>          <Plug>(sexp_move_to_prev_element_tail)
  " xmap <silent><buffer> g<M-e>          <Plug>(sexp_move_to_prev_element_tail)
  " omap <silent><buffer> g<M-e>          <Plug>(sexp_move_to_prev_element_tail)
  " nmap <silent><buffer> <M-e>           <Plug>(sexp_move_to_next_element_tail)
  " xmap <silent><buffer> <M-e>           <Plug>(sexp_move_to_next_element_tail)
  " omap <silent><buffer> <M-e>           <Plug>(sexp_move_to_next_element_tail)
  nmap <silent><buffer> [[              <Plug>(sexp_move_to_prev_top_element)
  xmap <silent><buffer> [[              <Plug>(sexp_move_to_prev_top_element)
  omap <silent><buffer> [[              <Plug>(sexp_move_to_prev_top_element)
  nmap <silent><buffer> ]]              <Plug>(sexp_move_to_next_top_element)
  xmap <silent><buffer> ]]              <Plug>(sexp_move_to_next_top_element)
  omap <silent><buffer> ]]              <Plug>(sexp_move_to_next_top_element)
  nmap <silent><buffer> [e              <Plug>(sexp_select_prev_element)
  xmap <silent><buffer> [e              <Plug>(sexp_select_prev_element)
  omap <silent><buffer> [e              <Plug>(sexp_select_prev_element)
  nmap <silent><buffer> ]e              <Plug>(sexp_select_next_element)
  xmap <silent><buffer> ]e              <Plug>(sexp_select_next_element)
  omap <silent><buffer> ]e              <Plug>(sexp_select_next_element)
  nmap <silent><buffer> ==              <Plug>(sexp_indent)
  nmap <silent><buffer> =-              <Plug>(sexp_indent_top)
  " nmap <silent><buffer> <LocalLeader>i  <Plug>(sexp_round_head_wrap_list)
  " xmap <silent><buffer> <LocalLeader>i  <Plug>(sexp_round_head_wrap_list)
  " nmap <silent><buffer> <LocalLeader>I  <Plug>(sexp_round_tail_wrap_list)
  " xmap <silent><buffer> <LocalLeader>I  <Plug>(sexp_round_tail_wrap_list)
  " nmap <silent><buffer> <LocalLeader>[  <Plug>(sexp_square_head_wrap_list)
  " xmap <silent><buffer> <LocalLeader>[  <Plug>(sexp_square_head_wrap_list)
  " nmap <silent><buffer> <LocalLeader>]  <Plug>(sexp_square_tail_wrap_list)
  " xmap <silent><buffer> <LocalLeader>]  <Plug>(sexp_square_tail_wrap_list)
  " nmap <silent><buffer> <LocalLeader>{  <Plug>(sexp_curly_head_wrap_list)
  " xmap <silent><buffer> <LocalLeader>{  <Plug>(sexp_curly_head_wrap_list)
  " nmap <silent><buffer> <LocalLeader>}  <Plug>(sexp_curly_tail_wrap_list)
  " xmap <silent><buffer> <LocalLeader>}  <Plug>(sexp_curly_tail_wrap_list)
  " nmap <silent><buffer> <LocalLeader>w  <Plug>(sexp_round_head_wrap_element)
  " xmap <silent><buffer> <LocalLeader>w  <Plug>(sexp_round_head_wrap_element)
  " nmap <silent><buffer> <LocalLeader>W  <Plug>(sexp_round_tail_wrap_element)
  " xmap <silent><buffer> <LocalLeader>W  <Plug>(sexp_round_tail_wrap_element)
  " nmap <silent><buffer> <LocalLeader>e[ <Plug>(sexp_square_head_wrap_element)
  " xmap <silent><buffer> <LocalLeader>e[ <Plug>(sexp_square_head_wrap_element)
  " nmap <silent><buffer> <LocalLeader>e] <Plug>(sexp_square_tail_wrap_element)
  " xmap <silent><buffer> <LocalLeader>e] <Plug>(sexp_square_tail_wrap_element)
  " nmap <silent><buffer> <LocalLeader>e{ <Plug>(sexp_curly_head_wrap_element)
  " xmap <silent><buffer> <LocalLeader>e{ <Plug>(sexp_curly_head_wrap_element)
  " nmap <silent><buffer> <LocalLeader>e} <Plug>(sexp_curly_tail_wrap_element)
  " xmap <silent><buffer> <LocalLeader>e} <Plug>(sexp_curly_tail_wrap_element)
  " nmap <silent><buffer> <LocalLeader>h  <Plug>(sexp_insert_at_list_head)
  " nmap <silent><buffer> <LocalLeader>l  <Plug>(sexp_insert_at_list_tail)
  " nmap <silent><buffer> <LocalLeader>@  <Plug>(sexp_splice_list)
  " nmap <silent><buffer> <LocalLeader>o  <Plug>(sexp_raise_list)
  " xmap <silent><buffer> <LocalLeader>o  <Plug>(sexp_raise_list)
  " nmap <silent><buffer> <LocalLeader>O  <Plug>(sexp_raise_element)
  " xmap <silent><buffer> <LocalLeader>O  <Plug>(sexp_raise_element)
  " nmap <silent><buffer> <M-k>           <Plug>(sexp_swap_list_backward)
  " xmap <silent><buffer> <M-k>           <Plug>(sexp_swap_list_backward)
  " nmap <silent><buffer> <M-j>           <Plug>(sexp_swap_list_forward)
  " xmap <silent><buffer> <M-j>           <Plug>(sexp_swap_list_forward)
  " nmap <silent><buffer> <M-h>           <Plug>(sexp_swap_element_backward)
  " xmap <silent><buffer> <M-h>           <Plug>(sexp_swap_element_backward)
  " nmap <silent><buffer> <M-l>           <Plug>(sexp_swap_element_forward)
  " xmap <silent><buffer> <M-l>           <Plug>(sexp_swap_element_forward)
  " nmap <silent><buffer> <M-S-j>         <Plug>(sexp_emit_head_element)
  " xmap <silent><buffer> <M-S-j>         <Plug>(sexp_emit_head_element)
  " nmap <silent><buffer> <M-S-k>         <Plug>(sexp_emit_tail_element)
  " xmap <silent><buffer> <M-S-k>         <Plug>(sexp_emit_tail_element)
  " nmap <silent><buffer> <M-S-h>         <Plug>(sexp_capture_prev_element)
  " xmap <silent><buffer> <M-S-h>         <Plug>(sexp_capture_prev_element)
  " nmap <silent><buffer> <M-S-l>         <Plug>(sexp_capture_next_element)
  " xmap <silent><buffer> <M-S-l>         <Plug>(sexp_capture_next_element)
  imap <silent><buffer> <BS>            <Plug>(sexp_insert_backspace)
  imap <silent><buffer> <C-h>           <Plug>(sexp_insert_backspace)
  imap <silent><buffer> "               <Plug>(sexp_insert_double_quote)
  imap <silent><buffer> (               <Plug>(sexp_insert_opening_round)
  imap <silent><buffer> )               <Plug>(sexp_insert_closing_round)
  imap <silent><buffer> [               <Plug>(sexp_insert_opening_square)
  imap <silent><buffer> ]               <Plug>(sexp_insert_closing_square)
  imap <silent><buffer> {               <Plug>(sexp_insert_opening_curly)
  imap <silent><buffer> }               <Plug>(sexp_insert_closing_curly)
endfunction

augroup vim_sexp_mapping
  autocmd!
  autocmd FileType clojure,scheme,lisp,timl call s:vim_sexp_mappings()
augroup END

" }}}

" slimv {{{

" let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim-temp/bundle/slimv.vim/slime/start-swank.lisp &'
" let g:slimv_leader = ',,'

" }}}

" sonictemplate {{{

let g:sonictemplate_vim_template_dir = ['$HOME/.vim/template']

" }}}

" surround {{{

let g:surround_no_insert_mappings = 1

" }}}

" Table mode {{{

let g:table_mode_disable_mappings = 0
let g:table_mode_align_char = ':'

let g:table_mode_motion_down_map = ''
let g:table_mode_motion_left_map = ''
let g:table_mode_motion_right_map = ''
let g:table_mode_cell_text_object_a_map = ''
let g:table_mode_cell_text_object_i_map = ''
let g:table_mode_realign_map = ''
let g:table_mode_delete_row_map = ''
let g:table_mode_delete_column_map = ''
let g:table_mode_add_formula_map = ''
let g:table_mode_eval_formula_map = ''
let g:table_mode_echo_cell_map = ''
let g:table_mode_sort_map = ''

" }}}

" tagbar {{{

let g:tagbar_left = 1

let g:tagbar_type_scala = {
\   'ctagstype': 'Scala',
\   'kinds': [
\     'p:packages:1',
\     'V:values',
\     'v:variables',
\     'T:types',
\     't:traits',
\     'o:objects',
\     'a:aclasses',
\     'c:classes',
\     'r:cclasses',
\     'm:methods'
\   ]
\ }

" }}}

" textmanip {{{

let g:textmanip_enable_mappings = 0

" }}}

" trailing whitespaces 行末のスペースを目立たせる {{{

" uniteでスペースが表示されるので、設定でOFFにします。
let g:extra_whitespace_ignored_filetypes = ['unite']

" }}}

" tweetvim {{{
"
let g:tweetvim_empty_separator = 1

" }}}

" vim2hs {{{

let g:haskell_conceal_wide = 0
let g:haskell_conceal = 0

" }}}

" vimfiler {{{

let g:vimfiler_as_default_explorer = 1

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

let g:vimshell_split_command = 'rightbelow vsplit'
let g:vimshell_no_default_keymappings = 1

let g:vimshell_prompt_expr = 'fnamemodify(getcwd(), ":~:.") . "$ "'
let g:vimshell_prompt_pattern = '^[^\$]*\$ '

let g:vimshell_interactive_update_time = 300

" lein repl を起動
command! -bar Lein execute ':VimShellInteractive lein repl'

command! -bar -range -nargs=? VimShellJoinedSendString call s:vs_send_string(<line1>, <line2>)
"command! -bar VimShellIntRestart :call vimshell#int_mappings#restart_command()

xnoremap <silent> <Leader>S :VimShellJoinedSendString<CR>
xnoremap <silent> <Leader>s :VimShellSendString<CR>

command! -bar Ghci :VimShellInteractive ghci

function! s:define_vimshell_mappings()
  nmap <buffer>  <CR>       <NOP>
  nmap <buffer>  q          <Plug>(vimshell_hide)
  nmap <buffer>  Q          <Plug>(vimshell_exit)
  nmap <buffer>  <Leader>p  <Plug>(vimshell_previous_prompt)
  nmap <buffer>  <Leader>n  <Plug>(vimshell_next_prompt)
  nmap <buffer>  <C-k>      <Plug>(vimshell_delete_previous_output)
  nmap <buffer>  <C-y>      <Plug>(vimshell_paste_prompt)
  nmap <buffer>  E          <Plug>(vimshell_move_end_argument)
  nmap <buffer>  cc         <Plug>(vimshell_change_line)
  nmap <buffer>  dd         <Plug>(vimshell_delete_line)
  nmap <buffer>  I          <Plug>(vimshell_insert_head)
  nmap <buffer>  A          <Plug>(vimshell_append_end)
  nmap <buffer>  i          <Plug>(vimshell_insert_enter)
  nmap <buffer>  a          <Plug>(vimshell_append_enter)
  nmap <buffer>  ^          <Plug>(vimshell_move_head)
  nmap <buffer>  <C-c>      <Plug>(vimshell_hangup)
  nmap <buffer>  <C-l>      <Plug>(vimshell_clear)
  nmap <buffer>  <C-z>      <Plug>(vimshell_execute_by_background)

  imap <buffer>  <CR>       <Plug>(vimshell_enter)
  imap <buffer>  <C-l>      <Plug>(vimshell_history_unite)
  imap <buffer>  <TAB>      <Plug>(vimshell_command_complete)
  imap <buffer>  <C-a>      <Plug>(vimshell_move_head)
  imap <buffer>  <C-u>      <Plug>(vimshell_delete_backward_line)
  imap <buffer>  <C-w>      <Plug>(vimshell_delete_backward_word)
  imap <buffer>  <C-z>      <Plug>(vimshell_execute_by_background)
  imap <buffer>  <C-t>      <Plug>(vimshell_insert_last_word)
  imap <buffer>  <C-c>      <Plug>(vimshell_interrupt)
  imap <buffer>  <C-h>      <Plug>(vimshell_delete_backward_char)
  imap <buffer>  <BS>       <Plug>(vimshell_delete_backward_char)
  imap <buffer>  <C-k>      <Plug>(vimshell_delete_forward_line)

  nnoremap <buffer>  <Leader>o  :<C-u>JumpCode<CR>
endfunction

function! s:define_vimshell_int_mappings()
  nmap <buffer>  <CR>   <Plug>(vimshell_int_execute_line)
  nmap <buffer>  <CR>   <Plug>(vimshell_int_execute_line)
  nmap <buffer>  <C-y>  <Plug>(vimshell_int_paste_prompt)
  nmap <buffer>  <C-z>  <Plug>(vimshell_int_restart_command)
  nmap <buffer>  <C-c>  <Plug>(vimshell_int_interrupt)
  nmap <buffer>  q      <Plug>(vimshell_int_exit)
  nmap <buffer>  cc     <Plug>(vimshell_int_change_line)
  nmap <buffer>  dd     <Plug>(vimshell_int_delete_line)
  nmap <buffer>  I      <Plug>(vimshell_int_insert_head)
  nmap <buffer>  A      <Plug>(vimshell_int_append_end)
  nmap <buffer>  i      <Plug>(vimshell_int_insert_enter)
  nmap <buffer>  a      <Plug>(vimshell_int_append_enter)
  nmap <buffer>  <C-l>  <Plug>(vimshell_int_clear)
  " nmap <buffer>  <C-p>  <Plug>(vimshell_int_previous_prompt)
  " nmap <buffer>  <C-n>  <Plug>(vimshell_int_next_prompt)

  imap <buffer>  <C-h>  <Plug>(vimshell_int_delete_backward_char)
  imap <buffer>  <BS>   <Plug>(vimshell_int_delete_backward_char)
  imap <buffer>  <C-a>  <Plug>(vimshell_int_move_head)
  imap <buffer>  <C-u>  <Plug>(vimshell_int_delete_backward_line)
  imap <buffer>  <C-w>  <Plug>(vimshell_int_delete_backward_word)
  imap <buffer>  <C-k>  <Plug>(vimshell_int_delete_forward_line)
  imap <buffer>  <CR>   <Plug>(vimshell_int_execute_line)
  imap <buffer>  <C-c>  <Plug>(vimshell_int_interrupt)
  imap <buffer>  <C-l>  <Plug>(vimshell_int_history_unite)
  imap <buffer>  <C-v>  <Plug>(vimshell_int_send_input)
endfunction

autocmd Meowrc FileType vimshell call s:define_vimshell_mappings()
autocmd Meowrc FileType int-* call s:define_vimshell_int_mappings()

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
\   'indentation': '  ',
\   'ruby': {
\     'aliases': {
\       'req': 'require '
\     },
\   },
\   'perl': {
\     'aliases': {
\       'req': 'require '
\     },
\     'snippets': {
\       'use': "use strict\nuse warnings\n\n",
\       'warn': "warn \"|\";",
\     }
\   }
\ }

" }}}


" from ~/.vim/part/plug.vim
"========================
" |_/ |\  |\__    \    /
" |_  | \ |   \     \/
" | \ |   |    |   /  \
"     |   |    | /     \
"========================


if 0-0
  %Alignta g/^Plug "
endif

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
Plug 'tyru/banban.vim'                  " Vim をバンバンする
Plug 'pocke/sushibar.vim'               " https://www.youtube.com/watch?v=epfPe2U_2Xk
if has('cryptv')
  Plug 'heavenshell/vim-pokemon'          " 伝説のチンポコモンを探そう
endif

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
Plug 'cohama/lexima.vim'                " かっこよく括弧を入力する
if has('lua')
  Plug 'Konfekt/FastFold'                 " ネオコンがほしがる
  Plug 'Shougo/neocomplete'               " ネオコン
  Plug 'Shougo/neosnippet'                " すにぺ
  Plug 'Shougo/neosnippet-snippets'       " すにぺぺ
  Plug 'ujihisa/neco-look'                " look コマンドを使用して英単語の補完
endif

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
Plug 'dannyob/quickfixstatus'           " quickfix の該当行にいくと、エラー内容をネコーする

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

Plug 'dhruvasagar/vim-table-mode'       " markdown の table を綺麗に書く
Plug 'h1mesuke/vim-alignta'             " align

" }}}

" Game {{{

Plug 'katono/rogue.vim'
Plug 'mattn/flappyvird-vim'
Plug 'mattn/habatobi-vim'
Plug 'mattn/invader-vim'
Plug 'thinca/vim-threes'
Plug 'mattn/die-vim'

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

Plug 'kana/vim-operator-replace'        " yank しないで置換する: _{motion}
Plug 'wellle/targets.vim'               " :help targets
Plug 'tommcdo/vim-exchange'             " テキスト交換: n_cx{motion} n_cxx v_X n_cxc

" }}}

" Search And Destroy {{{

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'rking/ag.vim'
Plug 'tyru/chdir-proj-root.vim'
Plug 'vim-scripts/gtags.vim'
if v:version >= 800
  Plug 'osyo-manga/vim-over'
endif

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
Plug 'thinca/vim-portal' " n_<Leader>pb n_<Leader>po
Plug 't9md/vim-textmanip' " テキストを選択したブロックで移動する:  <C-h> <C-j> <C-k> <C-l>

" }}}

" Text Object {{{

"     b   = Any brackets
"     fX  = beetween X - http://d.hatena.ne.jp/thinca/20100614/1276448745
"     i   = Indent Level
"     u   = URL
"     y   = Syntax
"     z   = Fold
"     ar  = Entire
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-entire'
Plug 'mattn/vim-textobj-url'
Plug 'osyo-manga/vim-textobj-multiblock'

" }}}

" Tool {{{

Plug 'tasuten/gcalc.vim' " Google 電卓
Plug 'Shougo/vinarise' " バイナリエディア
Plug 'tpope/vim-speeddating'

" }}}

" Unplugged {{{

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
Plug 'Shougo/denite.nvim'
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
Plug 'rhysd/git-messenger.vim'
Plug 'rhysd/committia.vim'
Plug 'tpope/vim-fugitive'
if v:version >= 740
  Plug 'lambdalisue/vim-gita'
endif

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

Plug 'sjl/gundo.vim'                    " undo ツリーを表示して、履歴を移動したい
Plug 'tyru/open-browser.vim'            " カーソル下の URL をブラウザで開いたり
Plug 'skywind3000/asyncrun.vim'         " 非同期でシェルのコマンドを実行し、quickfix ににゅるっと出す
Plug 'haya14busa/vim-gtrans'            " Goooogle 翻訳
Plug 'yami-beta/vim-responsive-tabline' " れすぽんちぶのタブ表示
Plug 'yuttie/comfortable-motion.vim'    " 慣性スクロール
Plug 'rhysd/inazuma.vim'                " 目をギョロギョロ(Inazumize)させながら、コードを読む

" }}}

" White Zombie {{{

Plug 'LeafCage/alti.vim'                " ctrlp インスパイア

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


" from ~/.vim/part/env.vim
"=====================
" |\  /|   |   |\__
" | \/ |  _|_| |   \
" |    | | |   |    |
" |    |   |   |    |
"=====================


let $PATH = $HOME . '/bin:' . $HOME . '/.cabal/bin:' . $PATH


" from ~/.vim/part/utils.vim
"========================
" |\__   /|\ |  |\  |
" |   \   |  |  | \ | /|
" |    |  |  |  |   |/ |
" |    |  |  |  |      |
"========================


" Generate 1 to n
function! Rand(n)
  " http://vim-jp.org/vim-users-jp/2009/11/05/Hack-98.html
  let l:match_end = matchend(reltimestr(reltime()), '\d\+\.') + 1
  return reltimestr(reltime())[l:match_end : ] % (a:n + 1)
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! GetCharCode()
  " Get the output of :ascii
  redir => l:ascii
  silent! ascii
  redir END
  if match(l:ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let l:nrformat = '0x%02x'

  let l:encoding = (&fileencoding ==# '' ? &encoding : &fileencoding)

  if l:encoding ==# 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let l:nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [l:str, l:char, l:nr; l:rest] = matchlist(l:ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let l:nr = printf(l:nrformat, l:nr)

  return "'". l:char ."' ". l:nr
endfunction


" from ~/.vim/part/set.vim
"=================
" |    |\  /| /|\
" | /| | \/ |  |
" |/ | |    |  |
"    | |    |  |
"=================


" メニューの日本語化を抑止
set langmenu=none

" 改行コード
set fileformats=unix,mac,dos
set fileformat=unix

" 行数表示
set nonumber
set norelativenumber

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

" う゛ぃみんふぉ
set viminfo=
set viminfo+='1000                     " マークが復元される履歴の最大
set viminfo+=<50                       " 各レジスタで保存される行数の最大値
set viminfo+=s50                       " Kbyte単位でのフラグの最大値
set viminfo+=h                         " viminfo ファイルの読み込み時に、'hlsearch' を無効にする。
set viminfo+=!                         " 大文字のみで構成されるグローバル変数を保存する
set viminfo+=n~/.vim-temp/info/viminfo " viminfo の保存場所

" ウィンドウサイズの自動調整
set noequalalways

" ヘルプの検索順
set helplang=ja

" セッションで保存する要素
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages

" カカッ!
set secure

" Don't save options.
set viewoptions-=options

" K
set keywordprg=

" ++
set history=10000

" Unicode の記号などを全角で表示する
set ambiwidth=double

" clipboard
if !has('nvim')
  set clipboard=unnamedplus,autoselect,exclude:cons\|linux
endif

" iskeyword ← 説明になってない!
set iskeyword=@,48-57,-,_,192-255

" こいつらをファイル・メイとして認めてやらんこともない
set isfname=@,48-57,/,.,-,_,~

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

" メッセージの省略
set shortmess=tToOlmnrwxf


" CursorHold とかに使われるね
set updatetime=1000

" 長すぎる行で重くなると嫌ですね
" set synmaxcol=666

" タイトルの文字 ↓ わかりづらいね!
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

" 正規表現エンジン
if v:version >= 800
  set regexpengine=0 " 0=自動選択, 1=old, 2=Neko Felis Association

  " 絵文字全角
  if has('multi_byte')
    set emoji
  endif

  " 破壊いぬでんと
      " 🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕🐕
  if has('linebreak')
    set breakindent
  endif

  " カラフフ
  if has('termguicolors')
    set termguicolors
  endif
endif

" 暗い
set background=dark


" from ~/.vim/part/map.vim
"=================
" |\  /| |\   |_/
" | /\ | |\ \ |_
" |/  \| |  \ | \
" |    | |
"=================


let g:mapleader = ','

" fix {{{

nnoremap <Del> <C-h>
inoremap <Del> <C-h>
cnoremap <Del> <C-h>
" FIXME see https://github.com/osyo-manga/vital-over/issues/126
" nnoremap  <C-h>
" inoremap  <C-h>
" cnoremap  <C-h>

" }}}

" override {{{

" 小指を鍛えるエディタ風
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" コマンドモードの移動
cnoremap <C-a> <Home>
cnoremap <C-d> <Del>

" 検索時に結果が中央に来るようにする
noremap n nzzzv
noremap N Nzzzv

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" nnoremap /  /\v
" nnoremap ?  /\v

" 検索のハイライト
noremap <Silent> <Plug>(vimrc-searchafter) Nzz:set hlsearch<CR>
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
nnoremap <silent> <Esc><Esc> :<C-u>set hlsearch!<CR>

" for US KBD
nnoremap ; q:
xnoremap ; q:
nnoremap q: :
xnoremap q: :
nnoremap : ;
xnoremap : ;

" クリップボードから貼り付け
inoremap <C-r>* <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>

" JK ワイパー
inoremap jk <Esc>
inoremap kj <Esc>

" Don't move on *
nnoremap * *<C-o>
nnoremap # #<C-o>

" Operator
map _ <Plug>(operator-replace)

" Strong refresh
nnoremap <C-l> :<C-u>XMonadRefreshWindow<CR><C-l>

" 自然派
nnoremap Y y$

" 自分で「:.!」って打てばええんや
nnoremap ! :Switch<CR>

" タブ
nnoremap gh 1gt

" quickfix
nnoremap <Leader>cp :cprevious<CR>
nnoremap <Leader>cn :cnext<CR>
nnoremap <Leader>cf :cfirst<CR>
nnoremap <Leader>cl :clast<CR>
nnoremap <Leader>lp :lprevious<CR>
nnoremap <Leader>ln :lnext<CR>
nnoremap <Leader>lf :lfirst<CR>
nnoremap <Leader>ll :llast<CR>

" 小窓を大きくする風
nnoremap <C-w>o :MaximizeModoki<CR>

" }}}

" map {{{

" Save like Emacs
inoremap <C-x><C-s> <Esc>:<C-u>w<CR>a
inoremap <C-x>s <Esc>:<C-u>w<CR>a

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
nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprev<CR>

" Emacs ライクなキャンセル
cnoremap <C-g> <C-c>

" like ranger
nnoremap <expr> cd ":\<C-u>cd\<Space>" . fnamemodify(get(t:, 'cwd', '~/'), ':~:.') . "\<C-f>"

" 改行
nnoremap <CR> A<CR><Esc>

" tag jump
nnoremap <C-k> :<C-u>execute 'vertical' 'botright' 'stjump' expand('<cword>')<CR>

" for vimeight
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv

" Co Pi Pe
if has('gui_running')
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" Repeat on visual mode
vnoremap <silent> . :normal .<CR>

" for lexima <BS>
imap <C-h> <BS>

" }}}

" <Leader> {{{

" Leaders
nmap s <Leader>
xmap s <Leader>

" Migemo 検索
noremap <Leader>/ :<C-u>Migemo<Space><C-f>

" buffer
nnoremap <Leader>x :<C-u>wincmd c<CR>

" ref.vim
nnoremap <Leader>R :<C-u>Ref<Space><C-f>

" QuickRun
nnoremap <Leader>r :<C-u>QuickRun<CR>
vnoremap <Leader>r :<C-u>'<,'>QuickRun<CR>

" tab
nnoremap <Leader>tn :<C-u>tabnew<CR>
nnoremap <Leader>te :tabedit<Space><C-f>
nnoremap <Leader>tx :<C-u>tabclose<CR>
nnoremap <Leader>tm :<C-u>tabnew<Bar>Unite -unique -buffer-name=files file_mru<CR>

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <Leader>o <Plug>(openbrowser-smart-search)
xmap <Leader>o <Plug>(openbrowser-smart-search)

" QuickHl
nmap <Leader>hh <Plug>(quickhl-manual-this)
nmap <Leader>hr <Plug>(quickhl-manual-reset)
nnoremap <Leader>hd :<C-u>QuickhlManualDelete<CR>
nnoremap <Leader>ha :<C-u>QuickhlManualAdd<Space><C-f>

" 保存 ﾎﾟﾗﾎﾟﾗﾎﾟﾗ
nnoremap <Leader>w :<C-u>update<CR>
nnoremap <Leader>W :<C-u>wall<CR>
nnoremap <Leader>z ZZ

" nox
nnoremap <Leader>ns :<C-u>NoxSearch<Space><C-f>
nnoremap <Leader>nt :<C-u>Unite nox_tag<CR>
nnoremap <Leader>nm :<C-u>Unite nox_mlt<CR>
nnoremap <Leader>nM :<C-u>Unite nox_mlt_source<CR>
nnoremap <Leader>nl :<C-u>NoxLocationOpen<CR>

" neocomplate
nnoremap <Leader>N :<C-u>NeoCompleteToggle<CR>

" caw - commentout
nmap <Leader>cc <plug>(caw:tildepos:toggle)
vmap <Leader>cc <plug>(caw:tildepos:toggle)

" }}}

" Double Leader {{{

nnoremap <Leader><Leader>b :<C-u>CleanupWindows<CR>

" }}}

" Command line window {{{

autocmd CmdwinEnter * call s:initialize_command_window()

function! s:initialize_command_window()
  inoremap <buffer><expr> <Space> ambicmd#expand("\<Space>")
  inoremap <buffer><expr> <CR>    ambicmd#expand("\<CR>\<CR>")

  inoremap <buffer>       <C-g>   <C-c><C-c>
  inoremap <buffer>       <C-k>   <Up><End>
  inoremap <buffer>       <C-l>   <Down><End>

  nnoremap <buffer>       <C-g>   <C-c><C-c>

  startinsert!
endfunction

" }}}

" for plugin {{{

" multiblock
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
xmap ab <Plug>(textobj-multiblock-a)
xmap ib <Plug>(textobj-multiblock-i)

" ambcmd
cnoremap <expr> <Space> ambicmd#expand("\<Space>")
cnoremap <expr> <CR> ambicmd#expand("\<CR>")

" textmanip
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)
xmap <Leader>j <Plug>(textmanip-duplicate-down)
xmap <Leader>k <Plug>(textmanip-duplicate-up)

" vimshell
vnoremap <Leader>> :VimShellJoinedSendString<CR>

" Fontzoom
nnoremap <silent> + :<C-u>Fontzoom +<C-r>=v:count1<CR><CR>:XMonadRefreshWindow<CR>
nnoremap <silent> - :<C-u>Fontzoom -<C-r>=v:count1<CR><CR>:XMonadRefreshWindow<CR>

" neosnippet
imap <C-q> <Plug>(neosnippet_expand_or_jump)
smap <C-q> <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" }}}

" Toggle bang {{{

" http://twitter.com/tyru/status/13474491734
function! s:toggle_bang(cmdline)
  " :substituteみたいに引数とコマンドの間に
  " 空白がなくても呼ばれたりするものもあるので完璧ではない。
  " そもそも:substituteはbangとらないけど。
  let l:m = matchlist(a:cmdline, '^\(\s*\)\(\S\+\)\(.*\)')
  if empty(l:m) | return a:cmdline | endif
  let [l:ws, l:cmd, l:rest] = l:m[1:3]
  return l:ws . (l:cmd[strlen(l:cmd) - 1] ==# '!' ? l:cmd[:-2] : l:cmd . '!') . l:rest
endfunction

cnoremap <Plug>(cmdline-toggle-bang) <C-\>e <SID>toggle_bang(getcmdline())<CR>
cmap <C-x> <Plug>(cmdline-toggle-bang)

" }}}

" 全角でかかないようにする map {{{


inoremap 　 <Space>
inoremap （ (
inoremap ） )
inoremap ｛ {
inoremap ｝ }
inoremap ； ;
inoremap ： :
inoremap ｜ <Bar>
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

" セミコロンで Sticky Shift {{{

function! s:init_sticky_shift_by_semi_colon ()
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

call s:init_sticky_shift_by_semi_colon()

" }}}

" submode {{{

" from http://d.hatena.ne.jp/tyru/20100502/vim_mappings

let g:submode_timeoutlen = 2000

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
call submode#enter_with('scroll', 'n', '', ',ss', '<C-d>:redraw<CR>')
call submode#leave_with('scroll', 'n', '', '<Esc>')
" call submode#map       ('scroll', 'n', '', 'j', '<C-d>:redraw<CR>')
" call submode#map       ('scroll', 'n', '', 'k', '<C-u>:redraw<CR>')
call submode#map       ('scroll', 'n', '', 'j', ':call comfortable_motion#flick(100)<CR>:redraw<CR>')
call submode#map       ('scroll', 'n', '', 'k', ':call comfortable_motion#flick(-100)<CR>:redraw<CR>')
call submode#map       ('scroll', 'n', '', 'a', ':let &l:scroll -= 3<CR>')
call submode#map       ('scroll', 'n', '', 's', ':let &l:scroll += 3<CR>')

" Unite First/Previous/Next/Last
call submode#enter_with('unite', 'n', '', ',sq', ':<C-u>Unite -no-focus -no-start-insert -winheight=5 quickfix<CR>')
call submode#leave_with('unite', 'n', '', '<Esc>') " ':<C-u>:UniteClose<CR>'
call submode#map       ('unite', 'n', '', '0', ':UniteFirst<CR>')
call submode#map       ('unite', 'n', '', 'p', ':UnitePrevious<CR>')
call submode#map       ('unite', 'n', '', 'n', ':UniteNext<CR>')
call submode#map       ('unite', 'n', '', 'k', ':UnitePrevious<CR>')
call submode#map       ('unite', 'n', '', 'j', ':UniteNext<CR>')
call submode#map       ('unite', 'n', '', '$', ':UniteLast<CR>')

" }}}


" from ~/.vim/part/command.vim
"===============================================
"   /
"   |     |\    |\  /| |\  /| |\     |   |\  /|
"  /\     |\ \/ | /\ | | /\ | |\ \  _|_| | \/ |
" |   \   | \/  |/  \| |/  \| |  \ | |   | /\ |
" /     \ |     |    | |    | |      |   |/  \|
"===============================================


" 一行コマンド {{{

" 行末の空白をのぞく (space, ideographic-space, tab)
command! -bar RemoveTrailingSpaces %s/[ 　	]\+$//c

" エンコーディング指定オープン
command! -bang -complete=file -nargs=? Utf8 edit<bang> ++enc=utf-8 ++bad=keep<args>
command! -bang -complete=file -nargs=? Sjis edit<bang> ++enc=cp932 ++bad=keep<args>
command! -bang -complete=file -nargs=? Euc edit<bang> ++enc=eucjp ++bad=keep<args>
command! -bang -complete=file -nargs=? WUtf8 write<bang> ++enc=utf-8 ++bad=keep<args>
command! -bang -complete=file -nargs=? WSjis write<bang> ++enc=cp932 ++bad=keep<args>
command! -bang -complete=file -nargs=? WEuc write<bang> ++enc=eucjp ++bad=keep<args>

" ファイルリネーム - http://vim-users.jp/2009/05/hack17/
command! -nargs=1 -complete=file Rename save <args>|call delete(expand('#'))

"シンタックスの再同期
command! -bar SSF syntax sync fromstart

" }}}

" .*.archive に選択範囲を移動 {{{

function! s:archive(comment) range
  let l:path = expand('%:p')
  if l:path ==# ''
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

  let l:basename = printf('.%s.archive', fnamemodify(l:path, ':t'))
  let l:dir = fnamemodify(l:path, ':h')

  let l:file = vimproc#fopen(l:dir . '/' . l:basename, 'O_WRONLY | O_CREAT | O_APPEND')
  call l:file.write(l:content)
  call l:file.close()
endfunction

command! -nargs=* -range Archive <line1>,<line2>call s:archive(<q-args>)

" }}}

" chmod {{{

function! s:chmod(perm)
  let l:perm = len(a:perm) > 0 ? a:perm : '+x'
  let l:res = system('chmod ' . l:perm . ' ' . shellescape(expand('%')))
  write
  edit
endfunction

command! -bar -nargs=* Chmod :call s:chmod(<q-args>)

" }}}

" カレントファイルのパスをクリプボぅ! {{{

command! -nargs=* -bang -bar CopyCurrentFilepath :call s:copy_current_filepath('<bang>', <q-args>)

function! s:copy_current_filepath (bang, modifier)
  let l:path = expand('%' . a:modifier)
  if a:bang ==# '!'
    let l:path = printf('L%d@%s', line('.'), l:path)
  endif
  let @* = l:path
  let @+ = l:path
  echo printf('>> %s', l:path)
endfunction

" }}}

" 選択した行番号をコピペ {{{

function! s:ln(start, end, filename_modifier)
  if a:start == a:end
    let l:ln = printf('L%d', a:start)
  else
    let l:ln = printf('L%d-%d', a:start, a:end)
  endif

  if len(a:filename_modifier) > 0
    let l:ln .= '@' . expand('%' . a:filename_modifier)
  endif

  let @+ = l:ln
  let @* = l:ln
  echo l:ln
endfunction

" e.g)
"   :'<,'>Ln
"   :Ln
"   :Ln :t
command! -bar -range -nargs=? Ln call s:ln(<line1>, <Line2>, <q-args>)

" }}}

" numeronym -> n7m {{{

function! s:get_numeronym(word)
  let l:m = matchlist(a:word, '^\(.\)\(.*\)\(.\)$')
  return l:m[1] . string(len(l:m[2])) . l:m[3]
endfunction

function! s:numeronym(word)
  if len(a:word) > 0
    echo s:get_numeronym(a:word)
  else
    let l:word = s:get_numeronym(expand('<cword>'))
    execute 'normal ' . 'ciw' . l:word
  endif
endfunction

command! -bar -nargs=* Numeronym call s:numeronym(<q-args>)

" }}}

" バルーンで Syntax 情報を得てみる {{{

function! s:balloon_syntax(name)
  set ballooneval
  if a:name ==# 'syntax'
    set balloonexpr=synIDattr(synID(v:beval_lnum,\ v:beval_col,\ 1),\ 'name')
  elseif a:name ==# 'fold'
    set balloonexpr=foldballoon#balloonexpr()
  else
    echoerr 'Unknown type: ' . a:name
  endif
endfunction

function! s:balloon_syntax_compl(...)
  return ['syntax', 'fold']
endfunction

command! -bar -nargs=1 -complete=customlist,s:balloon_syntax_compl BallonSyntax call s:balloon_syntax(<q-args>)

" }}}

" テンキー表記を矢印に変換 {{{
"
function! s:kakuge_replace()
  " vint: -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
  silent! '<,'>s/1/↙/g
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
  " vint: +ProhibitCommandRelyOnUser +ProhibitCommandWithUnintendedSideEffect
endfunction

command! -bar -range=% KakugeReplace call s:kakuge_replace()
" }}}

" らんらんコマンド (quickrun) {{{

let s:anekos_fixed_run_command = 'QuickRun'

function! s:fix_run_command(command)
  let l:command = len(a:command) ? a:command : getreg(':')

  let b:anekos_fixed_run_command = l:command
  let s:anekos_fixed_run_command = l:command
  echo 'fixed: ' . l:command
endfunction

function! s:run_run_command()
  let l:cmd = get(b:, 'anekos_fixed_run_command', s:anekos_fixed_run_command)
  echomsg 'RunRun: ' . l:cmd . "\n"
  execute l:cmd
endfunction

command! -nargs=* -range FixRunCommand call s:fix_run_command(<q-args>)
command! -bar -range RunRunCommand call s:run_run_command()

noremap <Leader>r          :RunRunCommand<CR>
noremap <Leader><Leader>r  :FixRunCommand<CR>

" }}}

" 価格履歴 (price-watcher) {{{

function! s:extract_amazon_product_id (url)
  let l:patterns = [
    \ '.*/dp/\([^/]\+\).*',
    \ '.*/gp/product/\([^/]\+\).*'
    \ ]
  for l:pattern in l:patterns
    if match(a:url, l:pattern) >= 0
      return substitute(a:url, l:pattern, '\1', '')
    endif
  endfor
  return 0
endfunction

function! s:show_price_log (id)
  let l:id = a:id ==# '' ? s:extract_amazon_product_id(s:url_on_cursor()) : a:id
  echo system('price-watcher log ' . shellescape(l:id))
endfunction

function! s:url_on_cursor ()
  let l:line = getline('.')
  let l:col = col('.')
  let l:left = l:line[0 : l:col - 2]
  let l:right = l:line[l:col - 1 : -1]

  let l:left = substitute(l:left, '^ *', '', '')
  let l:right = matchstr(l:right, '[^() ]\+')
  let l:url = l:left . l:right
  return l:url
endfunction

" Amazon の URL を引数に、価格の履歴を抜きだす
command! -bar -nargs=* PriceLog call s:show_price_log(<q-args>)

" }}}

" ファイル名っぽいのをカーソル周辺から探してジャンプするんだね {{{

let s:jump_code_range = 10

function! s:remove_esc_seq (line)
  return substitute(a:line, '\e\[[^m]*m', '', 'g')
endfunction

function! s:extract_code_path (line)
  let l:line = s:remove_esc_seq(a:line)
  let l:match = matchlist(l:line, '\v(%([-_.a-z0-9]*/)*%([-_.a-z0-9]+))%(:(\d+))%(:(\d+))?')
  if len(l:match) > 0
    let l:filepath = l:match[1]
    let l:line = str2nr(l:match[2])
    let l:col = str2nr(l:match[3])

    if filereadable(l:filepath)
      return [1, l:filepath, l:line, l:col]
    endif
  endif

  return [0, 0, 0, 1]
endfunction

function! s:jump_to_file (filepath, ln, col)
  1wincmd w

  if fnamemodify(bufname(winbufnr(1)), ':p') !=# fnamemodify(a:filepath, ':p')
    execute 'edit' a:filepath
  endif

  if a:ln
    execute a:ln
  endif

  if a:col
    if a:col == 1
      normal! 0
    else
      execute 'normal!' printf('0%dl', a:col - 1)
    endif
  endif

  normal! zz
endfunction

function! s:jump_code ()
  let l:line = line('.')

  for l:i in range(0, s:jump_code_range)

    let l:target_ln = l:line - l:i
    let [l:found, l:filepath, l:ln, l:col] = s:extract_code_path(getline(l:target_ln))

    if !l:found
      let l:target_ln = l:line + l:i
      let [l:found, l:filepath, l:ln, l:col] = s:extract_code_path(getline(l:target_ln))
    endif

    if l:found
      if l:ln == 0
        let l:matched = matchlist(getline(l:target_ln + 1), '\(\d\+\)\(:\(\d\+\)\)\=')
        if len(l:matched) > 0
          let l:ln = str2nr(l:matched[1])
          let l:col = str2nr(l:matched[3])
        endif
      endif

      call s:jump_to_file(l:filepath, l:ln, l:col)
      return
    end
  endfor
endfunction

command! -bar JumpCode call s:jump_code()

" }}}

" chdir to project dirctory (git) {{{

function! s:ch_dir_to_poject_directory ()
  let l:dir = expand('%:hp')

  while 1
    if isdirectory(l:dir . '/.git')
      execute 'lcd' l:dir
      return
    endif

    let l:next = fnamemodify(l:dir, ':h')
    if l:next == l:dir
      return
    endif

    let l:dir = l:next
  endwhile
endfunction

command! -bar CdProjectRoot call s:ch_dir_to_poject_directory()

" }}}

" ヘルプ以外の空バッファウィンドウを閉じる {{{

function! s:kill_me_baby ()
  let l:blanks = 0
  let l:helps = 0
  for l:n in tabpagebuflist()
    if getbufvar(l:n, '&filetype') ==# 'help'
      let l:helps += 1
    elseif bufname(l:n) ==# ''
      let l:blanks += 1
    endif
  endfor

  if l:blanks > 0 && l:helps > 0
    only
  endif
endfunction

command! -bar KillMeBaby call s:kill_me_baby()

" }}}

" LongCat is Long {{{

function! s:long_cat (n)
  let l:top = copy([
    \ '    /\___/\',
    \ '   /       \',
    \ '  |  o    o |',
    \ '  \     #   |',
    \ '   \   _|_ /',
    \ '   /       \______',
    \ '  / _______ ___   \',
    \ '  |_____   \   \__/',
    \ '   |    \__/'
    \ ])

  let l:middle = '   |       |'
  let l:middle_c = '   |   %   |'

  let l:bottom = copy([
    \ '   /        \',
    \ '  /   ____   \',
    \ '  |  /    \  |',
    \ '  | |      | |',
    \ ' /  |      |  \',
    \ ' \__/      \__/'
    \ ])

  let l:middles = []
  if a:n =~# '^\d\+$'
    for l:_ in range(1, str2nr(a:n))
      let l:middles = add(l:middles, l:middle)
    endfor
  else
    for l:i in range(0, len(a:n) - 1)
      let l:middles = add(l:middles, substitute(l:middle_c, '%', a:n[l:i], ''))
    endfor
  endif

  return extend(extend(l:top, l:middles), l:bottom)
endfunction

function! s:spawn_longcat (...)
  let l:n = get(a:, 1, 20)
  call append(line('.'), s:long_cat(l:n))
endfunction

command! -bar -nargs=? LongCat call s:spawn_longcat(<q-args>)

" }}}

" cpo の設定を後付け {{{

function! s:insert_cpo()
  call append(0, ['let s:save_cpo = &cpo', 'set cpo&vim', '', ''])
  call append(line('$'), ['', '', 'let &cpo = s:save_cpo', 'unlet s:save_cpo'])
  normal! gg
  redraw
  sleep 1
  normal! G
endfunction

command! -bar InsertCpo call s:insert_cpo()

" }}}

" バッファを grep {{{

function! s:buffer_grep(query)
  execute 'silent!' 'bufdo' 'vimgrepadd' printf('/%s/', escape(a:query, '/\')) '%'
endfunction

command! -bar -nargs=* BGrep call s:buffer_grep(<q-args>)

" }}}

" figlet {{{

" rc ファイルヘッダ用
" http://ultimacodex.com/archive/runic/ 内の http://ultimacodex.com/archive/ftp/misc/fonts/runeflf.zip
command! -nargs=* Figlet .! figlet -d ~/.figlet -f rune -w 1000 <q-args>

" }}}

" panty {{{

function! s:panty_init (dir)
  sleep 100m

  if len(a:dir)
    execute 'cd' a:dir
  endif

  " http://d.hatena.ne.jp/osyo-manga/20131217/1387292034 - vim-startify を unite.vim で代替してみる - C++でゲームプログラミング
  if bufnr('$') <= 6
    let l:max_candidates = (&lines - 10) / 2
    call unite#custom_max_candidates('panty_file_mru', l:max_candidates)
    call unite#custom_max_candidates('panty_directory_mru', l:max_candidates)

    " Unite -select=0 output:echo:"==:directory:mru:===":! file

    Unite
    \ output:echo:"===:directory:mru:===":!
    \ panty_directory_mru
    \ output:echo:":":!
    \ output:echo:"===:file:mru:===":!
    \ panty_file_mru
    \ output:echo:":":!
    \ -hide-source-names
    \ -default-action=open_panty
    \ -no-split
    " \ -quick-match
  endif
endfunction

command! -bar -nargs=* PantyInit call s:panty_init(<q-args>)

" }}}

" 文字ケース変換 {{{

function! s:to_underscore_case ()
  let l:words = substitute(substitute(expand('<cword>'), '^.', '\l\0', ''), '\C\([A-Z]\+\)', '_\l\1', 'g')
  execute 'normal!' 'ciw' . l:words
endfunction

command! -bar CaseUnderScore call s:to_underscore_case()

" }}}

" 空バッファなどを削除  {{{

function! s:burn_empty_buffers()
  let l:killed = 0

  for l:nr in range(1, bufnr('$'))
    if buflisted(l:nr) == 1 && bufloaded(l:nr) == 1 && bufname(l:nr) ==# ''
      let l:killed += 1
      execute 'bdelete!' l:nr
    endif
  endfor

  echomsg printf('%d buffers have been killed!', l:killed)
endfunction

command! -bar Burn call s:burn_empty_buffers()

" }}}

" MFC {{{

function! s:mfc_calc(expr)
  echo substitute(system('mfc ' . shellescape(a:expr) . ' println'), '^$', '', 'g')
endfunction

command! -nargs=* MFC :call s:mfc_calc(<q-args>)

" }}}

" Maximize もどき {{{

function! s:maximize_modoki()
  if exists('t:maximize_modoki__back_to')
    let l:back_to = t:maximize_modoki__back_to
    tabclose
    execute 'tabnext' l:back_to
  else
    let l:back_to = tabpagenr()
    let l:bufnr = winbufnr(0)
    let l:linenr = line('.')
    tabnew
    execute 'buffer' l:bufnr
    execute l:linenr
    call settabvar(tabpagenr(), 'maximize_modoki__back_to', l:back_to)
  endif
endfunction

command! -bar MaximizeModoki call s:maximize_modoki()

" }}}

" 空のウィンドウを削除してサイズを揃える {{{

function! s:CleanupNotMicrosofts()
  for l:winnr in range(1, winnr('$'))
    let l:bufnr = winbufnr(l:winnr)
    if l:bufnr >= 0 && bufname(l:bufnr) ==# ''
      execute 'bdelete' l:bufnr
    endif
  endfor

  wincmd =
endfunction

command! -bar CleanupWindows call s:CleanupNotMicrosofts()

" }}}

" Swap ファイルいちいち聞いてくんなやなやなやー {{{

" Pakuri from 翻車魚 https://github.com/thinca/config/blob/21a7d5f25bfa7d6c015870808a55a65183d01485/dotfiles/dot.vim/vimrc#L566

augroup meowrc-swapfile
  autocmd!
  autocmd SwapExists * call s:on_SwapExists()
augroup END

function! s:on_SwapExists() abort
  if !filereadable(expand('<afile>'))
    let v:swapchoice = 'd'
    return
  endif
  let v:swapchoice = get(b:, 'swapfile_choice', 'o')
  unlet! b:swapfile_choice
  if v:swapchoice !=# 'd'
    let b:swapfile_exists = 1
  endif
endfunction

command! SwapfileRecovery call s:swapfile_recovery()
command! SwapfileDelete call s:swapfile_delete()

function! s:swapfile_recovery() abort
  if get(b:, 'swapfile_exists', 0)
    let b:swapfile_choice = 'r'
    unlet b:swapfile_exists
    edit
  endif
endfunction

function! s:swapfile_delete() abort
  if get(b:, 'swapfile_exists', 0)
    let b:swapfile_choice = 'd'
    unlet b:swapfile_exists
    edit
  endif
endfunction

" }}}

" which して開く {{{

" FUXME Wonderful dependencism
command! -nargs=* -complete=customlist,vimshell#helpers#vimshell_execute_complete Which call s:which(<q-args>)

function! s:which(command_name)
  let l:path = systemlist(printf('which %s', shellescape(a:command_name)))
  if v:shell_error == 0
    execute 'edit' path[0]
  else
    echoerr printf('Command not found: %s', a:command_name)
  endif
endfunction

" }}}

" re-panty {{{

command! -nargs=0 Repanty :call s:repanty()

function! s:repanty() abort
  silent mksession! /tmp/repanty.vim
  bwipeout
  echo system('panty summon --send ":so /tmp/repanty.vim<CR>"')
  quitall
endfunction

" }}}

" XMonad xc を使ってウィンドウをリフレッシュ {{{

function! s:xmonad_refresh_window_delayed(...)
  silent call vimproc#system('~/.xmonad/bin/xc command refresh-window')
endfunction

function! s:xmonad_refresh_window()
  if !has('gui_running')
    return
  endif

  call timer_start(200, function('s:xmonad_refresh_window_delayed'))
endfunction

command! -bar XMonadRefreshWindow call s:xmonad_refresh_window()

" }}}


" from ~/.vim/part/autocmd.vim
"=============================================
"                         /
" |\   |\__   /|\ |\      |     |\  /| |\  /|
" |\ \ |   \   |  |\ \/  /\     | /\ | | \/ |
" |  \ |    |  |  | \/  |   \   |/  \| | /\ |
" |    |    |  |  |     /     \ |    | |/  \|
"=============================================



" 折りたたみの保存 - http://vim-users.jp/2009/10/hack84/
MeowtoCmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
MeowtoCmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif

MeowtoCmd BufNewFile,BufRead *.nox set filetype=nox

" ファイルが他で更新されていないかチェックする
MeowtoCmd WinEnter,FocusGained * checktime

" 自動でプロジェクトのルートを作業ディレクトリにする
MeowtoCmd BufReadPost * silent CdProjectRoot

MeowtoCmd FileType c,cpp,rust,haskell,python nmap <buffer>K <Plug>(devdocs-under-cursor)

" ヘルプ以外の空バッファウィンドウを閉じる
MeowtoCmd BufNewFile,WinEnter,BufEnter,BufWinEnter * KillMeBaby

" 縦タブラインはよこい
if exists('&vtlc')
  MeowtoCmd TabEnter * if 3 <= tabpagenr('$') | set vtlc=20 showtabline=0 | else | set vtlc=0 showtabline=2 | endif
endif

" ファイルが変更されていたらヤバくなる {{{

function! s:OnFileChangedShell()
  let v:fcs_choice = ''
  call anekos#rainbow#start() " start osyo rainbow
endfunction

autocmd Meowrc FileChangedShell * call s:OnFileChangedShell()

" }}}

" 可愛いフォーマッタ殺害 {{{

let s:formatoptions = substitute(&formatoptions, '[tcq]', '', 'g') . 'Mjr'

function! s:kill_the_fucking_formatters()
  setlocal textwidth=0
  let &formatoptions = s:formatoptions
endfunction

autocmd Meowrc FileType * call s:kill_the_fucking_formatters()

call s:kill_the_fucking_formatters()

" }}}

" 地蔵でディレクトリ作る {{{
" http://vim-users.jp/2011/02/hack202/

autocmd Meowrc BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
function! s:auto_mkdir(dir, force)
  if isdirectory(a:dir)
    return
  endif

  if a:force || input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$'
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" }}}


" from ~/.vim/part/term.vim
"=========================
"            |\
" /|\ |\  /| |  \  |\  /|
"  |  | \/ | |  /  | /\ |
"  |  |    | |  \  |/  \|
"  |  |    | |   \ |    |
"=========================


if has('gui_running')
  finish
endif

" 20行でできる、端末版vimの縦分割スクロール高速化設定 - http://qiita.com/kefir_/items/c725731d33de4d8fb096
if has('vim_starting') && !has('gui_running') && has('vertsplit')
  function! s:enable_vsplit_mode()
    " enable origin mode and left/right margins
    let &t_CS = 'y'
    let &t_ti = &t_ti . "\e[?6;69h"
    let &t_te = "\e[?6;69l\e[999H" . &t_te
    let &t_CV = "\e[%i%p1%d;%p2%ds"
    call writefile([ "\e[?6;69h" ], '/dev/tty', 'a')
  endfunction

  " old vim does not ignore CPR
  map <special> <Esc>[3;9R <Nop>

  " new vim can't handle CPR with direct mapping
  " map <expr> ^[[3;3R g:EnableVsplitMode()
  set t_F9=[3;3R

  map <expr> <t_F9> <SID>enable_vsplit_mode()
  let &t_RV .= "\e[?6;69h\e[1;3s\e[3;9H\e[6n\e[0;0s\e[?6;69l"
endif


" from ~/.vim/part/plugin/lightline.vim
"===========================================
"               |\
" |\  |  \    / |  \ /|\ |\  |   |   |\  /|
" | \ |    \/   | /   |  | \ |  _|_| | \/ |
" |   |   /  \  |     |  |   | | |   |    |
" |   | /     \ |     |  |   |   |   |    |
"===========================================


if !(has('cryptv') && v:version >= 800)
  let g:lightline = {
  \   'enable': {'tabline': 0},
  \   'mode_map': {'c': 'NORMAL'},
  \   'active': {
  \     'left': [
  \       ['readonly', 'filename', 'modified'],
  \       ['mode', 'paste'],
  \     ],
  \     'right': [
  \       ['lineinfo'],
  \       ['percent'],
  \       ['fileformat', 'fileencoding', 'filetype'],
  \     ]
  \   },
  \   'separator': {'left': '', 'right': ''},
  \   'subseparator': {'left': '', 'right': ''}
  \ }

  finish
endif

let g:myline = {}


let g:lightline = {
\   'enable': {'tabline': 0},
\   'mode_map': {'c': 'NORMAL'},
\   'active': {
\     'left': [
\       ['readonly', 'filename', 'checker', 'modified'],
\       ['git_branch', 'git_traffic', 'git_status'],
\       ['mode', 'paste'],
\       ['checker']
\     ],
\     'right': [
\       ['lineinfo'],
\       ['percent'],
\       ['fileformat', 'fileencoding', 'filetype'],
\       ['charcode']
\     ]
\   },
\   'component_function': {
\     'modified': 'g:myline.modified',
\     'readonly': 'g:myline.readonly',
\     'fugitive': 'g:myline.fugitive',
\     'filename': 'g:myline.filename',
\     'fileformat': 'g:myline.fileformat',
\     'filetype': 'g:myline.filetype',
\     'fileencoding': 'g:myline.fileencoding',
\     'mode': 'g:myline.mode',
\     'charcode': 'g:myline.charCode',
\     'git_branch': 'g:myline.git_branch',
\     'git_traffic': 'g:myline.git_traffic',
\     'git_status': 'g:myline.git_status',
\   },
\   'component_expand': {
\     'checker': 'qfstatusline#Update',
\   },
\   'component_type': {
\     'checker': 'error',
\   },
\   'tab_component_function': {
\     'tabfilename': 'MyLineTabFileName'
\   },
\   'separator': {'left': '', 'right': ''},
\   'subseparator': {'left': '', 'right': ''}
\ }

let g:lightline.tab = {'active': ['tabnum', 'tabfilename', 'modified'], }
let g:lightline.tab.inactive = g:lightline.tab.active
let g:lightline.inactive = g:lightline.active


function! g:myline.modified()
  return &filetype =~# 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! g:myline.readonly()
  return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! g:myline.filename()
  return (&filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \  &filetype ==# 'unite' ? unite#get_status_string() :
        \  &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ '' !=# expand('%:t') ? expand('%:t') : '[No Name]')
endfunction

function! g:myline.fugitive()
  try
    if &filetype !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! g:myline.fileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! g:myline.filetype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! g:myline.fileencoding()
  return winwidth(0) > 70 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

function! g:myline.charCode()
  return winwidth(0) > 90 ? GetCharCode() : ''
endfunction

let g:Qfstatusline#UpdateCmd = function('lightline#update')

" FIXME
function! MyLineTabFileName(n)
  let l:buflist = tabpagebuflist(a:n)
  let l:winnr = tabpagewinnr(a:n)
  let l:name = expand('#' . buflist[winnr - 1] . ':t')

  if l:name =~ 'mod.rs'
    let l:name = expand('#' . buflist[winnr - 1] . ':h:t') . '/m'
  endif

  return l:name !=# '' ? l:name : '[No Name]'
endfunction

function! g:myline.git_branch()
  return gita#statusline#preset('branch_fancy')
endfunction

function! g:myline.git_traffic()
  return gita#statusline#preset('traffic_fancy')
endfunction

function! g:myline.git_status()
  return gita#statusline#preset('status')
endfunction

function! g:myline.pokemode()
  let l:mode = lightline#mode()
  if l:mode ==# 'NORMAL'
    return pokemon#getdaze()
  else
    return l:mode
  endif
endfunction

function! g:myline.mode()
  return winwidth(0) > 60 ? g:myline.pokemode() : ''
endfunction


" from ~/.vim/part/plugin/unite.vim
"===========================
" |\__     |   | /|\ |\  /|
" |   \   _|_| |  |  | \/ |
" |    | | |   |  |  |    |
" |    |   |   |  |  |    |
"===========================


" Unite {{{

let g:unite_enable_start_insert = 1
let g:unite_enable_smart_case = 1

" ファイルリストの生成コマンド
if executable('sfind')
  let g:unite_source_rec_async_command = ['sfind']
endif

" Initialize {{{

function! s:init_unite()
  let l:runrun_register = {'is_selectable': 0}

  function! l:runrun_register.func(candidate)
    execute 'FixRunCommand' a:candidate.action__command
  endfunction

  call unite#custom_action('command', 'runrun-register', l:runrun_register)

  call unite#custom_source('buffer,file,file_rec,file_rec/async', 'sorters', 'sorter_word')
  call unite#custom#source('file,file_rec,directory,directory_rec,file_mru,directory_mru,panty_file_mru,panty_directory_mru', 'converters', ['converter_shorten_path'])
endfunction

function! s:init_unite_buffer()
  nmap <silent><buffer> J      <Plug>(unite_toggle_mark_current_candidate)
  nmap <silent><buffer> K      <Plug>(unite_toggle_mark_current_candidate-up)
  nmap <silent><buffer> <C-a>  <Plug>(unite_toggle_mark_all_candidates)
  nmap <silent><buffer> P      <Plug>(unite_toggle_auto_preview)
  imap <silent><buffer> <C-j>  <Plug>(unite_do_default_action)
  imap <silent><buffer> <C-c>  <Plug>(unite_exit)
  nmap <silent><buffer> <C-c>  <Plug>(unite_exit)

  inoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nnoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  inoremap <silent><buffer><expr> <C-y> unite#do_action('yank')
  nnoremap <silent><buffer><expr> <C-y> unite#do_action('yank')

  inoremap <silent><buffer><expr> <C-z> unite#do_action('preview')
  nnoremap <silent><buffer><expr> <C-z> unite#do_action('preview')

  inoremap <silent><buffer><expr> <C-e> unite#do_action('rec')
  nnoremap <silent><buffer><expr> <C-e> unite#do_action('rec')

  inoremap <silent><buffer><expr> <C-k> unite#do_action('create')
  nnoremap <silent><buffer><expr> <C-k> unite#do_action('create')

  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
endfunction

call s:init_unite()
autocmd Meowrc FileType unite call s:init_unite_buffer()

" }}}

" Like startify {{{

let s:open_panty = {
\   'is_selectable': 0,
\ }

function! s:open_panty.func(candidate)
  let l:path = a:candidate.word
       if isdirectory(l:path)
         execute 'cd' l:path
       else
         execute 'edit' l:path
       endif
endfunction

call unite#custom#action('file,directory', 'open_panty', s:open_panty)

" }}}

" alias {{{
let g:unite_source_alias_aliases = {
\   'panty_file_mru': {
\     'source' : 'file_mru',
\   },
\   'panty_directory_mru': {
\     'source' : 'directory_mru',
\   },
\   'zsh_history': {
\     'source': 'output/shellcmd',
\     'args': printf('%s | head -n 1000', fnamemodify('~/script/zsh/history-all', ':p')),
\     'kind': 'common'
\   },
\ }
" }}}

" }}}

" mappings {{{

nnoremap <Space>          :<C-u>Unite -buffer-name=files -default-action=switch buffer file_rec/async file/new<CR>
nnoremap <Leader><Space>  :<C-u>Unite -buffer-name=files -default-action=tabswitch buffer file_rec/async file/new<CR>
nnoremap <Leader>uuu      :<C-u>Unite<Space><C-f>
nnoremap <Leader>U        :<C-u>UniteResume<CR>
nnoremap <Leader>b        :<C-u>Unite -buffer-name=files buffer<CR>
nnoremap <Leader>B        :<C-u>Unite tab:no-current<CR>
nnoremap <Leader>ua       :<C-u>Unite grep:.<CR>
nnoremap <Leader>uA       :<C-U>Unite -auto-preview grep:.<CR>
nnoremap <Leader>ub       :<C-u>Unite bookmark<CR>
nnoremap <Leader>uC       :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <Leader>uc       :<C-u>Unite -default-action=edit command<CR>
nnoremap <Leader>ud       :<C-u>Unite -unique -buffer-name=files -default-action=cd<Space>directory_mru<CR>
nnoremap <Leader>uF       :<C-u>Unite -unique -buffer-name=files file<CR>
nnoremap <Leader>uf       :<C-u>Unite -unique -buffer-name=files file_rec/async<CR>
nnoremap <Leader>ug       :<C-u>Unite file_rec/git<CR>
nnoremap <Leader>uh       :<C-u>Unite history/command -default-action=edit<CR>
nnoremap <Leader>u:       :<C-u>Unite history/command -default-action=edit<CR>
nnoremap <Leader>uj       :<C-u>Unite -auto-preview jump<CR>
nnoremap <Leader>uJ       :<C-u>Unite junkfile<CR>
nnoremap <Leader>ul       :<C-u>Unite -no-quit -auto-preview location_list<CR>
nnoremap <Leader>uL       :<C-u>Unite line<CR>
nnoremap <Leader>um       :<C-u>Unite -unique -buffer-name=files file_mru<CR>
nnoremap <Leader>uM       :<C-u>Unite mapping<CR>
nnoremap <Leader>uo       :<C-u>Unite outline<CR>
nnoremap <Leader>uq       :<C-u>Unite -auto-preview quickfix<CR>
nnoremap <Leader>ur       :<C-u>Unite quickrun_config -default-action=set_global_quickrun_config<CR>
nnoremap <Leader>uR       :<C-u>Unite quickrun_config -default-action=execute<CR>
nnoremap <Leader>us       :<C-u>Unite file_rec:~/.vim/part<CR>
nnoremap <Leader>uS       :<C-u>Unite located_session<CR>
nnoremap <Leader>uT       :<C-u>Unite tab:no-current<CR>
nnoremap <Leader>ut       :<C-u>Unite tag<CR>
nnoremap <Leader>uv       :<C-u>Unite variable<CR>
nnoremap <Leader>uw       :<C-u>Unite window:no-current<CR>
nnoremap <Leader>uy       :<C-u>Unite history/yank<CR>
nnoremap <Leader>u/       :<C-u>Unite -buffer-name=search line:forward<CR>
nnoremap <Leader>u?       :<C-u>Unite -buffer-name=search line:backward<CR>
nnoremap <Leader>uz       :<C-u>Unite -default-action=append zsh_history<CR>
nnoremap <Leader>uZ       :<C-u>Unite -default-action=append output/shellcmd:tail\ -n100\ /tmp/terminal-log/all.log<CR>

nnoremap <Leader>up :UnitePrevious<CR>
nnoremap <Leader>un :UniteNext<CR>
nnoremap <Leader>uf :UniteFirst<CR>
nnoremap <Leader>ul :UniteLast<CR>

" }}}

" unite-font {{{

let g:unite_font_list_command = 'font-names 1'
call unite#custom#source('font', 'matchers', 'matcher_migemo')

" }}}

" unite-grep {{{

let g:unite_source_grep_max_candidates = 200

" http://blog.monochromegane.com/blog/2014/01/16/the-platinum-searcher/
" go get -u github.com/monochromegane/the_platinum_searcher/...
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
else
  let g:unite_source_grep_command = 'sgrep'
  let g:unite_source_grep_default_opts = ''
  let g:unite_source_grep_recursive_opt = ''
endif

function! s:grep_selected()
  let l:backup = @z
  normal! vgv"zy
  let l:str = @z
  let @z = l:backup
  call unite#start([['grep', '.', '', l:str]])
endfunction

xnoremap sua :call s:grep_selected()<CR>

" }}}

" unite-haddock {{{

let g:unite_source_haddock_browser = '/bin/urxvt -e w3m'

" }}}

" unite-hyperspec {{{

let g:unite_hyperspec_base_dir='/usr/share/doc/HyperSpec/'

" }}}

" unite-nyancat_anim {{{

call unite#custom#profile('source/nyancat_anim', 'context', {'winheight': 24})

" }}}

" メニュー用コマンド {{{

function! s:menu_google_suggest()
  if exists('s:menu_google_suggest_complete_func')
    let &completefunc = s:menu_google_suggest_complete_func
    unlet s:menu_google_suggest_complete_func
  else
    let s:menu_google_suggest_complete_func = &completefunc
    set completefunc=googlesuggest#Complete
  endif
endfunction

command! -bar GoogleSuggestToggle call s:menu_google_suggest()

" }}}

" 色々なコマンドのメニュー {{{

function! s:init_unite_something_menu()
  if !exists('g:unite_source_menu_menus')
    let g:unite_source_menu_menus = {}
  endif

  " menu の説明
  let l:commands = {
    \   'description' : 'something-action',
    \}

  " コマンドを登録
  let l:commands.candidates = {
    \   'colorcolumn'             : 'ColorColumn',
    \   'cross'                   : 'setlocal cursorcolumn! cursorline!',
    \   'git-messager'            : 'GitMessengerToggle',
    \   'googlesuggest'           : 'GoogleSuggestToggle',
    \   'indent-line'             : 'IndentLinesToggle',
    \   'open-all-project-source' : 'OpenAllProjectSource',
    \   'quickhl'                 : 'QuickhlManualEnable',
    \   'number'                  : 'setlocal relativenumber! number!',
    \   'table-mode'              : 'TableModeToggle',
    \   'select-font'             : 'emenu Edit.Select\ Font\.\.\.',
    \   'sushi'                   : 'set statusline=%!sushibar#sushibar()',
    \   'brightest'               : 'BrightestToggle'
    \}

  " 上記で登録したコマンドを評価する関数
  " 最終的にこれで評価した結果が unite に登録される
  function l:commands.map(key, value)
    return {'word' : a:key, 'kind' : 'command', 'action__command' : a:value}
  endfunction

  let g:unite_source_menu_menus['something'] = deepcopy(l:commands)

  " 呼び出しのキーマップ ("I"nstant command)
  nnoremap <silent> <Leader>i :<C-u>Unite menu:something<CR>
  vnoremap <silent> <Leader>i :<C-u>Unite menu:something<CR>
endfunction

call s:init_unite_something_menu()

" }}}


" from ~/.vim/part/plugin/quickrun.vim
"  ____________________
" < ﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮ >
"  --------------------
"         \   ^__^
"          \ (◕‿‿◕)\_______
"            /(__)\       )\/\
"              || ||----w |
"                 ||     ||



let g:quickrun_config = {
\   '_' : {
\     'runner' : 'job',
\     'runner/job/interval' : 1,
\     'runner/vimproc/sleep' : 10,
\     'runner/vimproc/updatetime' : 600,
\     'hook/nuko/enable' : 0,
\     'hook/nuko/wait' : 2,
\     'outputter': 'multi',
\     'outputter/buffer/split': 'vertical rightbelow',
\     'outputter/buffer/close_on_empty' : 1,
\     'outputter/buffer/running_mark': " ____________________\n< ﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮ >\n --------------------\n        \\   ^__^\n         \\ (◕‿‿◕)\\_______\n           /(__)\\       )\\/\\\n             || ||----w |\n                ||     ||",
\     'outputter/quickfix/open_cmd': '',
\     'outputter/multi/targets': ['buffer', 'quickfix']
\   },
\   'make' : {
\     'command': 'make',
\     'exec': '%c %o',
\     'outputter': 'buffer'
\   },
\   'javascript': {
\     'command': 'eslint'
\   },
\   'scala': {
\     'type': 'scala/sbt/test-compile'
\   },
\   'scala/sbt/compile': {
\     'command': 'sbt',
\     'cmdopt': '-Dsbt.log.noformat=true',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': 'compile',
\     'runner/concurrent_process/prompt': '\[.*\] \$ '
\   },
\   'scala/sbt/test-compile': {
\     'command': 'sbt',
\     'cmdopt': '-Dsbt.log.noformat=true',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': 'test:compile',
\     'runner/concurrent_process/prompt': '\[.*\] \$ '
\   },
\   'scala/sbt/test': {
\     'command': 'sbt',
\     'cmdopt': '-Dsbt.log.noformat=true',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': 'test',
\     'runner/concurrent_process/prompt': '\[.*\] \$ '
\   },
\   'scala/sbt/sync/compile': {
\     'command': 'sbt',
\     'exec': '%c -Dsbt.log.noformat=true compile'
\   },
\   'scala/sbt/sync/test-compile': {
\     'command': 'sbt',
\     'exec': '%c -Dsbt.log.noformat=true test:compile',
\     'outputter': 'quickfix'
\   },
\   'clojure': {
\     'type': 'clojure/lein/load-file'
\   },
\   'clojure/clj': {'command': 'clj', 'exec': '%c %s %a'},
\   'clojure/watchdogs_checker': {
\     'type': 'clojure/lein/eastwood'
\   },
\   'clojure/lein/compile': {
\     'command': 'lein',
\     'exec': '%c compile %a'
\   },
\   'clojure/lein/run': {
\     'command': 'lein',
\     'exec': '%c run %a'
\   },
\   'clojure/lein/test': {
\     'command': 'lein',
\     'exec': '%c test %a'
\   },
\   'clojure/lein/load-file': {
\     'command': 'lein',
\     'cmdopt': 'repl',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': '(load-file "%S")',
\     'runner/concurrent_process/prompt': '.*=> '
\   },
\   'clojure/lein/eastwood': {
\     'type': 'watchdogs_checker/eastwood'
\   },
\   'clojure/lein/deps': {
\     'command': 'lein',
\     'exec': '%c deps %a'
\   },
\   'clojure/neoclojure': {
\     'runner': 'neoclojure',
\     'command': 'dummy',
\     'tempfile'  : '%{tempname()}.clj'
\   },
\   'lisp/sbcl': {
\     'command': 'sbcl',
\     'cmdopt': '--script',
\   },
\   'json/elasticsearch-curl': {
\     'command': '$HOME/script/dev/elasticsearch/curl',
\     'exec': '%c %s',
\     'outputter': 'error',
\     'outputter/buffer/filetype': 'json',
\     'outputter/error/success': 'buffer',
\     'outputter/error/error': 'message'
\   },
\   'json/elasticsearch-search': {
\     'command': expand('~/script/dev/elasticsearch/search-with-json'),
\     'exec': '%c %a %s',
\     'outputter': 'error',
\     'outputter/buffer/filetype': 'json',
\     'outputter/error/success': 'buffer',
\     'outputter/error/error': 'message'
\   },
\   'haskell': {'type': 'haskell/runghc'},
\   'haskell/cabal': {
\     'command': 'cabal',
\     'exec': '%c build %o',
\     'cmdopt': ''
\   },
\   'markdown': {
\     'command': '$HOME/bin/preview-markdown',
\     'exec': '%c %s',
\     'outputter': 'error',
\     'outputter/error/success': 'message',
\     'outputter/error/error': 'buffer',
\   },
\   'nox': {'type': 'nox/preview'},
\   'nox/preview': {
\     'command': '$HOME/bin/preview-nox',
\     'exec': '%c %s',
\     'outputter': 'error',
\     'outputter/error/success': 'message',
\     'outputter/error/error': 'buffer',
\   },
\   'nox/pandoc/markdown/html': {
\     'command': 'pandoc',
\     'exec': '%c --from markdown --to html %s'
\   },
\   'nox/remark.js': {
\     'command': '$HOME/script/markdown/remark.js',
\     'exec': '%c %s'
\   },
\   'text': {
\     'type': 'text/split-sentences-jp'
\   },
\   'text/split-sentences-jp': {
\     'runner': 'vimscript',
\     'outputter': 'message',
\     'exec': '%%s/。/\r/g'
\   },
\   'vim/watchdogs_checker': {
\     'type': executable('vint') ? 'watchdogs_checker/vint' : '',
\   },
\   'rust': {
\     'type': 'rust/cargo/quickfix'
\   },
\   'rust/watchdogs_checker': {
\     'type': 'rust/cargo/quickfix',
\     'outputter': 'quickfix',
\   },
\   'rust/rustc': {
\     'command': 'rustc',
\     'exec': ['RUST_LOG=error %c %o %s -o %s:p:r', '%s:p:r %a'],
\     'tempfile': '%{tempname()}.rs',
\     'hook/sweep/files': '%S:p:r',
\   },
\   'rust/cargo/quickfix': {
\     'command': 'cargo',
\     'exec': 'RUST_LOG=error %c quickfix %o',
\   },
\   'rust/cargo/build': {
\     'command': 'cargo',
\     'exec': 'RUST_LOG=error %c build %o',
\   },
\   'rust/cargo/run': {
\     'command': 'cargo',
\     'exec': '%c run %o',
\   },
\   'rust/cargo/script': {
\     'command': 'cargo',
\     'exec': '%c script %s %a',
\   },
\   'rust/clippy': {
\     'command': 'cargo',
\     'exec': ['RUST_LOG=error %c clean --target=debug', 'RUST_LOG=error %c +nightly clippy'],
\   },
\   'sh/watchdogs_checker': {
\     'type': 'watchdogs_checker/shellcheck',
\   },
\	  'watchdogs_checker/_' : {
\     'outputter': 'quickfix',
\	  	'outputter/quickfix/open_cmd': 'HierStart',
\     'hook/echo/enable': 1,
\     'hook/echo/output_failure': '> Some Errors Found!!!!',
\     'hook/echo/output_success': '> No Errors Found.',
\     'hook/qfstatusline_update/enable_exit': 1,
\     'hook/qfstatusline_update/priority_exit': 4,
\	  },
\   'watchdogs_checker/vint' : {
\     'command': 'vint',
\     'exec': '%c %o %s:p',
\   },
\   'watchdogs_checker/eastwood' : {
\     'command': 'lein',
\     'exec': '%c eastwood %a',
\     'hook/nuko/enable' : 1,
\   },
\   'watchdogs_checker/shellcheck' : {
\     'command': 'shellcheck',
\     'exec': '%c %s'
\   },
\ }

command! -bar -range QuicKill call quickrun#sweep_sessions()
command! -bar InitQuickRun call quickrun#get_module('runner')

let g:Qfstatusline#UpdateCmd = function('lightline#update')

" http://d.hatena.ne.jp/osyo-manga/20120919/1348054752 - shabadou.vim を使って quickrun.vim をカスタマイズしよう - C++でゲームプログラミング

let g:watchdogs_check_BufWritePost_enables = {'sh': 1, 'scala': 0, 'rust': 1}
let g:watchdogs_check_CursorHold_enable = 0
call watchdogs#setup(g:quickrun_config)


" quickrun のバッファ毎の設定をしてみる
function! s:set_quickrun_config()
  if filereadable('Cargo.toml')
    let l:name = 'rust/cargo/quickfix'
  elseif filereadable('Makefile')
    let l:name = 'make'
  else
    return
  endif

  let b:quickrun_config = {'type': l:name}
endfunction
autocmd Meowrc BufReadPost * call s:set_quickrun_config()


" from ~/.vim/part/plugin/lexima.vim
"================================
" |\  |\  /|   |   | |\  /| |\
" | \ | \/ |   |   | | /\ | |\ \
" |   |    |  /|\  | |/  \| |  \
" |   |    | / | \ | |    | |
"================================

" Pasco http://www.pasconet.co.jp/

let g:lexima_enable_basic_rules = 0

let s:sixima = [
\   {'char': '(', 'input_after': ')'},
\   {'char': '(', 'at': '\\\%#'},
\   {'char': ')', 'at': '\%#)', 'leave': 1},
\   {'char': '<BS>', 'at': '(\%#)', 'delete': 1},
\   {'char': '{', 'input_after': '}'},
\   {'char': '}', 'at': '\%#}', 'leave': 1},
\   {'char': '<BS>', 'at': '{\%#}', 'delete': 1},
\   {'char': '[', 'input_after': ']'},
\   {'char': '[', 'at': '\\\%#'},
\   {'char': ']', 'at': '\%#]', 'leave': 1},
\   {'char': '<BS>', 'at': '\[\%#\]', 'delete': 1},
\ ]

let s:sixima += [
\   {'char': '"', 'input_after': '"'},
\   {'char': '"', 'at': '\%#"', 'leave': 1},
\   {'char': '"', 'at': '\\\%#'},
\   {'char': '"', 'at': '^\s*\%#', 'filetype': 'vim'},
\   {'char': '"', 'at': '\%#\s*$', 'filetype': 'vim'},
\   {'char': '<BS>', 'at': '"\%#"', 'delete': 1},
\   {'char': '"', 'at': '""\%#', 'input_after': '"""'},
\   {'char': '"', 'at': '\%#"""', 'leave': 3},
\   {'char': '<BS>', 'at': '"""\%#"""', 'input': '<BS><BS><BS>', 'delete': 3},
\   {'char': "'", 'input_after': "'"},
\   {'char': "'", 'at': '\%#''', 'leave': 1},
\   {'char': "'", 'at': '\w\%#''\@!'},
\   {'char': "'", 'at': '\\\%#'},
\   {'char': "'", 'at': '\\\%#', 'leave': 1, 'filetype': ['vim', 'sh', 'csh', 'ruby', 'tcsh', 'zsh']},
\   {'char': "'", 'filetype': ['haskell', 'lisp', 'clojure', 'ocaml', 'scala']},
\   {'char': '<BS>', 'at': "'\\%#'", 'delete': 1},
\   {'char': "'", 'at': "''\\%#", 'input_after': "'''"},
\   {'char': "'", 'at': "\\%#'''", 'leave': 3},
\   {'char': '<BS>', 'at': "'''\\%#'''", 'input': '<BS><BS><BS>', 'delete': 3},
\   {'char': '`', 'input_after': '`'},
\   {'char': '`', 'at': '\%#`', 'leave': 1},
\   {'char': '<BS>', 'at': '`\%#`', 'delete': 1},
\   {'char': '`', 'filetype': ['ocaml']},
\   {'char': '`', 'at': '``\%#', 'input_after': '```'},
\   {'char': '`', 'at': '\%#```', 'leave': 3},
\   {'char': '<BS>', 'at': '```\%#```', 'input': '<BS><BS><BS>', 'delete': 3},
\ ]

" Beautiful fuck for &'lifetime
let s:sixima += [
\   {'char': "'", 'input_after': '', 'filetype': 'rust', 'priority': 666},
\ ]


for s:rule in s:sixima
  call lexima#add_rule(s:rule)
endfor


" from ~/.vim/part/gui.vim
"==================
"  \    / |\__   |
"    \/   |   \  |
"   /  \  |    | |
" /     \ |    | |
"==================


if !has('gui_running')
  finish
endif

" Options {{{

set guioptions=gitc

"  1 hoge.vim
set guitablabel=%N:\ %f

" }}}

" フォント {{{

let s:fonts = {
\   'nerd': {
\     'font': 'Droid Sans Mono for Powerline Plus Nerd File Types 10',
\     'wide': 'Ricty 10'
\   },
\   'source code pro': {
\     'font': 'Source Code Pro SemiBold 12'
\   },
\   'ricty': {
\     'font': 'Ricty 12'
\   },
\   'runez': {
\     'font': 'RUNEZ 12',
\     'wide': 'Ricty 12'
\   },
\   'vl gothic': {
\     'font': 'VL Gothic 12'
\   }
\ }

function! s:set_font (setting)
  let &guifont = a:setting.font
  if has('gui_gtk')
    let &guifontwide = get(a:setting, 'wide', '')
  endif
endfunction

function! s:complete_font (...)
  return join(keys(s:fonts), "\n")
endfunction

command! -nargs=* -complete=custom,s:complete_font Font call s:set_font(s:fonts[<q-args>])

" Defaont
Font nerd

" }}}


" from ~/.vim/part/last.vim
"===================
" |\  |\   |    /|\
" | \ |\ \ | /|  |
" |   |  \ |/ |  |
" |   |       |  |
"===================


" カレーを零しても大丈夫
if $PWD == expand('~') && isdirectory('/tmp/xmosh')
  cd /tmp/xmosh
endif

if filereadable(expand('~/.vimrc.local')) | source ~/.vimrc.local | endif

 " iceberg anekos japanesque tender solarized8_light_low gruvbox lucius sprint-night
colorscheme spring-night
if exists('g:lightline')
  let g:lightline.colorscheme = 'solarized'
endif

" あぱ
filetype plugin indent on
syntax enable

"                                -*- coding: utf-8 -*-
