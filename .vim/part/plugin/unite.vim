"===========================
" |\__     |   | /|\ |\  /|
" |   \   _|_| |  |  | \/ |
" |    | | |   |  |  |    |
" |    |   |   |  |  |    |
"===========================

scriptencoding utf8

" Unite {{{

let g:unite_enable_start_insert = 1
let g:unite_enable_smart_case = 1

" ファイルリストの生成コマンド
if executable('sfind')
  let g:unite_source_rec_async_command = ['sfind']
endif

" Initialize (マッピングとかする) {{{

function! s:init_unite()
  let l:runrun_register = {'is_selectable': 0}

  function! l:runrun_register.func(candidate)
    execute 'FixRunCommand' a:candidate.action__command
  endfunction

  call unite#custom_action('command', 'runrun-register', l:runrun_register)

  call unite#custom#source('file_mru', 'ignore_pattern', '')
  call unite#custom#source('directory_mru', 'ignore_pattern', '')
  call unite#custom_source('buffer,file,file_rec,file_rec/async', 'sorters', 'sorter_word')
  call unite#custom#source('file,file_rec,directory,directory_rec,neomru,directory_mru,panty_file_mru,panty_directory_mru', 'converters', ['converter_shorten_path'])
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

  inoremap <silent><buffer><expr> <C-j> unite#do_action('execute')
  nnoremap <silent><buffer><expr> <C-j> unite#do_action('execute')
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

nnoremap <Space>          :<C-u>Unite -buffer-name=files -default-action=switch buffer file_rec/async<CR>
nnoremap <Leader><Space>  :<C-u>Unite -buffer-name=files -default-action=tabswitch buffer file_rec/async<CR>
nnoremap <Leader>uu       :<C-u>Unite<Space><C-f>
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
nnoremap <Leader>uk       :<C-u>Unite tag<CR>
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
nnoremap <Leader>ut       :<C-u>Unite sonictemplate<CR>
nnoremap <Leader>uT       :<C-u>Unite tab:no-current<CR>
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

noremap <expr> <Leader>k ":\<C-u>Unite tag -immediately -input=" . escape(expand('<cword>'), ' ') . '<CR>'

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

function! s:menu_scrolloff()
  if &scrolloff == 0
    set scrolloff=666
  else
    set scrolloff=0
  endif
endfunction

command! -bar ScrollOff call s:menu_scrolloff()

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
    \   'brightest'               : 'BrightestToggle',
    \   'scrolloff'               : 'ScrollOff'
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
