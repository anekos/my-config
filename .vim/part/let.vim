"================
" |\  |\  /| /|\
" | \ | \/ |  |
" |   |    |  |
" |   |    |  |
"================

scriptencoding utf8

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
let g:brightest#enable_filetypes = {'_': 0}

" }}}

" Calendar.vim {{{

let g:calendar_first_day = 'monday'
let g:calendar_time_zone = '+0900'
let g:calendar_date_endian = 'big'

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

" essk.vim {{{

let g:eskk#dictionary = {
\ 'path': $HOME . '/.eskk/dic/SKK-JISYO.L',
\ 'sorted': 0,
\ 'encoding': 'eucjp-ms',
\}

" }}}

" ft-clojure {{{

let g:clojure#indent#definiens = '\%(letfn\|proxy\|reify\)$\|.\+/def.*'
let g:clojure#indent#special = '\%(^\|/\)def'
" }}}

" fontzoom {{{
"
let g:fontzoom_no_default_key_mappings=1
nnoremap <silent> +
\  :<C-u>Fontzoom +<C-r>=v:count1<CR><CR>:XMonadRefreshWindow<CR>
nnoremap <silent> -
\  :<C-u>Fontzoom -<C-r>=v:count1<CR><CR>:XMonadRefreshWindow<CR>

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

autocmd Meowrc FileType J6uil call s:j6uil_init()

" }}}

" lexima {{{

let g:lexima_enable_basic_rules = 1

" }}}

" lisp {{{

let g:lisp_instring = 1
let g:lisp_rainbow = 1

" }}}

" Nox {{{

let g:nox_base_url = 'http://localhost:9199/'
let g:nox_diary_id_base = 'diary/'

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
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#sources#omni#functions.hledger = 'hledger#complete#omnifunc'
let g:neocomplete#force_omni_input_patterns.hledger     = '\w*'

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

imap <C-q>     <Plug>(neosnippet_expand_or_jump)
smap <C-q>     <Plug>(neosnippet_expand_or_jump)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" }}}

" Quickhl {{{

" 1 だと重いョ
let g:quickhl_tag_enable_at_startup = 0
let g:quickhl_manual_keywords = [
\ 'IMPLEMENTME',
\ ]

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

let g:sonictemplate_vim_template_dir = [
\ '$HOME/.vim/template'
\]

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
let g:haskell_conceal      = 0

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
