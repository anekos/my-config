"=====================================
" |_/ |\  |\__    \    / |   |   |
" |_  | \ |   \     \/   |  _|_| | /|
" | \ |   |    |   /  \  | | |   |/ |
"     |   |    | /     \ |   |      |
"=====================================

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

" AlterCmd {{{

call altercmd#load()
AlterCommand ag Ag
AlterCommand agit Agit
AlterCommand align Alignta
AlterCommand bg BGrep
AlterCommand burn Burn
AlterCommand cap Capture
AlterCommand co copen
AlterCommand lo lopen
AlterCommand cdp CdProjectRoot
AlterCommand chmod Chmod
AlterCommand date Date
AlterCommand jq %!jq .
AlterCommand execlip Execlip
AlterCommand gita Gita
AlterCommand lein Lein
AlterCommand man Man
AlterCommand mfc MFC
AlterCommand mks MkSession
AlterCommand mkp MarkdownPreview
AlterCommand noxa NoxAttach
AlterCommand noxb NoxBrowserOpen
AlterCommand noxc NoxCat
AlterCommand noxd NoxDiary
AlterCommand noxl NoxLocationOpen
AlterCommand noxm NoxMlt
AlterCommand noxn NoxNew
AlterCommand noxo NoxOpen
AlterCommand noxp NoxPreview
AlterCommand noxs NoxSearch
AlterCommand noxt NoxTagAdd
AlterCommand noxtu NoxTagUpdate
AlterCommand noxu NoxUnugly
AlterCommand nyancat Unite -update-time=50 -winheight=25 nyancat_anim
AlterCommand qr QuickRun
AlterCommand qk QuicKill
AlterCommand rc Rc
AlterCommand ref Ref
AlterCommand res Restart
AlterCommand sorc Sorc
AlterCommand ssf SSF
AlterCommand tm tabmove
AlterCommand w1 w!
AlterCommand w2 w!
AlterCommand w3 w!
AlterCommand vs VimShell
AlterCommand vf VimFiler
AlterCommand vfe VimFileExplorer

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

" colocolo {{{

let g:i_am_not_pika_beast = 1

" }}}

" committia {{{

" " You can get the information about the windows with first argument as a dictionary.
"
"   KEY              VALUE                      AVAILABILITY
"-----------------------------------------------------------------------------------
"   vcs            : vcs type (e.g. 'git')   -> all hooks
"   edit_winnr     : winnr of edit window    -> ditto
"   edit_bufnr     : bufnr of edit window    -> ditto
"   diff_winnr     : winnr of diff window    -> ditto
"   diff_bufnr     : bufnr of diff window    -> ditto
"   status_winnr   : winnr of status window  -> all hooks except for 'diff_open' hook
"   status_bufnr   : bufnr of status window  -> ditto

let g:committia_open_only_vim_starting = 0

let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
  " Additional settings
  setlocal spell

  " If no commit message, start with insert mode
  if a:info.vcs ==# 'git' && (getline(1) ==# '' || getline(1) =~# '-\s*')
    normal! $
    startinsert!
  end

  " Scroll the diff window from insert mode
  " Map <C-n> and <C-p>
  imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)

  let l:windowid = system('2> /dev/null xdotool search --any --onlyvisible --pid $(ps -o ppid --pid $$ | tail -n 1) | head -n 1')
  call system(printf('xc important %d', l:windowid))
endfunction

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

function! s:init_rainbow ()
  let l:bufname = bufname('%')
  bufdo call fancy#enable_when_idle(s:rainbow_interval, "rainbow")
  execute 'buffer ' . l:bufname
  MeowtoCmd BufWinEnter call fancy#enable_when_idle(s:rainbow_interval, "rainbow")
endfunction

command! -bar Rainbow call s:init_rainbow()

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

" lightline {{{

let g:myline = {}

let g:lightline = {
\   'mode_map': {'c': 'NORMAL'},
\   'active': {
\     'left': [
\       ['readonly', 'filename', 'modified'],
\       ['git_branch', 'git_traffic', 'git_status'],
\       ['mode', 'paste'],
\       ['syntaxcheck']
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
\     'pokemon': 'g:myline.pokemon',
\   },
\   'component_expand': {
\     'syntaxcheck': 'qfstatusline#Update',
\   },
\   'component_type': {
\     'syntaxcheck': 'error',
\   },
\   'separator': {'left': '', 'right': ''},
\   'subseparator': {'left': '', 'right': ''},
\   'colorscheme': 'iceberg',
\   'tabline': {
\     'left': [
\       ['tabs']
\     ],
\     'right': [
\       ['close']
\     ]
\   }
\ }

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

if g:plugins_installed
  function! g:myline.git_branch()
    return gita#statusline#preset('branch_fancy')
  endfunction

  function! g:myline.git_traffic()
    return gita#statusline#preset('traffic_fancy')
  endfunction

  function! g:myline.git_status()
    return gita#statusline#preset('status')
  endfunction

  function! g:myline.pokemon()
    return pokemon#getdaze()
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
else
  function! g:myline.git_branch()
    return ''
  endfunction

  function! g:myline.git_traffic()
    return ''
  endfunction

  function! g:myline.git_status()
    return ''
  endfunction

  function! g:myline.mode()
    return winwidth(0) > 60 ? lightline#mode() : ''
  endfunction
endif

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
let $RUST_SRC_PATH = '/usr/src/rust/src'

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

" submode.vim {{{

if 1 || dein#tap('vim-submode')
  " from http://d.hatena.ne.jp/tyru/20100502/vim_mappings

  " マッピングさせないようにする
  let g:wm_move_down  = ''
  let g:wm_move_up    = ''
  let g:wm_move_left  = ''
  let g:wm_move_right = ''

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
  call submode#map       ('scroll', 'n', '', 'j', '<C-d>:redraw<CR>')
  call submode#map       ('scroll', 'n', '', 'k', '<C-u>:redraw<CR>')
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

endif

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

" watchdogs {{{

let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_CursorHold_enable = 0

" }}}

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
