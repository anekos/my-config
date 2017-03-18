"=============================================
"                         /
" |\   |\__   /|\ |\      |     |\  /| |\  /|
" |\ \ |   \   |  |\ \/  /\     | /\ | | \/ |
" |  \ |    |  |  | \/  |   \   |/  \| | /\ |
" |    |    |  |  |     /     \ |    | |/  \|
"=============================================

scriptencoding utf8


" 折りたたみの保存 - http://vim-users.jp/2009/10/hack84/
MeowtoCmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
MeowtoCmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif

MeowtoCmd BufNewFile,BufRead *.nox set filetype=nox

" ファイルが他で更新されていないかチェックする
MeowtoCmd WinEnter,FocusGained * if expand('%') != '' && &buftype !~ 'nofile' | checktime | endif

" 自動でプロジェクトのルートを作業ディレクトリにする
MeowtoCmd BufReadPost * silent CdProjectRoot

MeowtoCmd FileType c,cpp,rust,haskell,python nmap <buffer>K <Plug>(devdocs-under-cursor)

" ヘルプ以外の空バッファウィンドウを閉じる
MeowtoCmd BufNewFile,WinEnter,BufEnter,BufWinEnter * KillMeBaby

" ノーマルモードを抜けると、ドブネズミがジャンプ
if executable('xgopherc')
  MeowtoCmd InsertLeave * call system('xgopherc -j')
endif

" 縦タブラインはよこい
if exists('&vtlc')
  MeowtoCmd TabEnter * if 3 <= tabpagenr('$') | set vtlc=20 showtabline=0 | else | set vtlc=0 showtabline=2 | endif
endif

" ftdetect {{{

autocmd BufNewFile,BufRead *vimperatorrc*,*.vimp  setfiletype vimperator
autocmd BufNewFile,BufRead *.csv                  setfiletype csv
autocmd BufNewFile,BufRead liname-*.txt           setfiletype liname
autocmd BufNewFile,BufRead *.ano                  setfiletype arduino
autocmd BufNewFile,BufRead *.rs                   setfiletype rust
" }}}

" ファイルが変更されていたらヤバくなる {{{

let s:fcs_timer_to_file = {}
let s:fcs_file_to_pid = {}
let s:fcs_gophers = {}

function! s:on_fcs_reload()
  let l:file = expand('%:p')
  let l:pid = get(s:fcs_file_to_pid, l:file, '')
  if len(l:pid)
    unlet s:fcs_file_to_pid[l:file]
    unlet s:fcs_gophers[l:pid]
    call system('kill ' . shellescape(l:pid))
  endif
endfunction

function! s:on_fcs_say(timer)
  echomsg string(a:timer)
  let l:file = get(s:fcs_timer_to_file, a:timer, '')
  if len(l:file)
    let l:leaf = fnamemodify(l:file, ':p:h:t') . '/' . fnamemodify(l:file, ':p:t')
    call system('xgopherc -m ' . shellescape(l:leaf))
    unlet s:fcs_timer_to_file[a:timer]
  endif
endfunction

function! s:on_file_change_shell(file)
  let v:fcs_choice = ''

  if !executable('xgopher')
    call anekos#rainbow#start() " start osyo rainbow
    return
  endif

  let l:file = fnamemodify(a:file, ':p')
  let l:pid = systemlist('xgopher & ; echo $!')[0]

  let l:timer = timer_start(2000, function('s:on_fcs_say'), {'repeat': 1})

  let s:fcs_file_to_pid[l:file] = l:pid
  let s:fcs_timer_to_file[l:timer] = l:file
  let s:fcs_gophers[l:pid] = 1
endfunction

function! s:on_fcs_quit()
  for l:pid in keys(s:fcs_gophers)
    call system(printf('kill %s', l:pid))
  endfor
  let s:gophers = {}
endfunction

autocmd Meowrc FileChangedShell * call s:on_file_change_shell(expand('<afile>'))
autocmd Meowrc VimLeave * call s:on_fcs_quit()
autocmd Meowrc BufReadPost * call s:on_fcs_reload()

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

" ポータルが生える {{{

let s:rand = vital#vital#import('Random').range

function! s:wild_shot()
  for color in ['orange', 'blue']
    let line = s:rand(line('$')) + 1
    let col = s:rand(col([line, '$']) - 1) + 1
    call portal#shoot(color, [bufnr('%'), line, col, 0])
  endfor
endfunction

" autocmd Meowrc BufReadPost * call s:wild_shot()

" }}}
