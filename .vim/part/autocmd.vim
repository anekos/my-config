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

let s:fcs_kill_targets = {}

function! s:prepare_to_kill_fcs_gopher(pid)
  call system('xgopherc -m Gyaaa')
  let l:timer = timer_start(2000, function('s:kill_fcs_gopher'), {'repeat': 1})
  let s:fcs_kill_targets[l:timer] = a:pid
endfunction

function! s:kill_fcs_gopher(timer)
  call system(printf('kill %s', s:fcs_kill_targets[a:timer]))
  unlet s:fcs_kill_targets[a:timer]
endfunction

function! s:on_file_change_shell(file)
  let v:fcs_choice = ''
  if executable('xgopher')
    let l:pid = system('xgopher & ; echo $!')
    augroup meowrc_fcs
      autocmd!
      execute 'autocmd' 'BufReadPost' escape(a:file, ' ') printf('call s:prepare_to_kill_fcs_gopher(%d)', l:pid)
    augroup END
  else
    call anekos#rainbow#start() " start osyo rainbow
  endif
endfunction

autocmd Meowrc FileChangedShell * call s:on_file_change_shell(expand('<afile>'))

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

autocmd Meowrc BufReadPost * call s:wild_shot()

" }}}
