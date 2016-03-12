"====================================================
"   /
"   |     |\    |\  /| |\  /| |\     |   |\  /| |
"  /\     |\ \/ | /\ | | /\ | |\ \  _|_| | \/ | | /|
" |   \   | \/  |/  \| |/  \| |  \ | |   | /\ | |/ |
" /     \ |     |    | |    | |      |   |/  \|    |
"====================================================

scriptencoding utf8

" *.archive に選択範囲を移動 {{{

function! Archive(comment) range
  let l:basefn = expand('%:p')
  if l:basefn ==# ''
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

  " call vimproc#write(l:basefn . '.archive', l:content, 'a')

  let l:file = vimproc#fopen(l:basefn . '.archive', 'O_WRONLY | O_CREAT | O_APPEND')
  call l:file.write(l:content)
  call l:file.close()
endfunction

command! -nargs=* -range Archive <line1>,<line2>call Archive(<q-args>)

" }}}

" chmod {{{
function! s:Chmod(perm)
  let l:perm = len(a:perm) > 0 ? a:perm : '+x'
  let l:res = system('chmod ' . l:perm . ' ' . shellescape(expand('%')))
  write
  edit
endfunction
command! -bar -nargs=* Chmod :call s:Chmod(<q-args>)
" }}}

" Execlip {{{

function! s:Execlip()
  for l:cmd in split(@*, '\n')
    execute l:cmd
  endfor
endfunction
command! -bar Execlip call s:Execlip()

" }}}

" カレントファイルのパスをクリプボぅ! {{{

command! -bang -bar CopyCurrentFilepath :call s:CopyCurrentFilepath('<bang>')
function! s:CopyCurrentFilepath (bang)
  let l:path = expand('%n')
  let l:result = l:path
  if a:bang ==# '!'
    let l:result = printf('L%d@%s', line('.'), l:result)
  endif
  let @* = l:result
endfunction

" }}}

" スクラッチバッファ {{{

function! s:Scratch ()
  new
  setlocal buftype=nowrite
endfunction
command! -bar Scratch :call s:Scratch()

" }}}

" バージョン番号部分を置換 {{{

function! ReplaceVersions ()
  1
  M/\d+\.\d+\.\d+
  let l:current = matchstr(getline('.'), '\d\d*\.\d\d*\.\d\d*')
  let l:new = input('new version number: ', l:current)
  execute '%s/' . l:current . '/' . l:new . '/gc'
endfunction
command! -bar -nargs=0 ReplaceVersions call ReplaceVersions()

" }}}

" ヘルプタグ {{{

" helptag ~/.vim/doc
function! s:MakeHelpTags ()
  echomsg 'Making help tags...'
  for l:path in split(&runtimepath, ',')
    let l:docpath = l:path . '/doc'
    if match(l:path, '^/usr/') < 0 && isdirectory(l:docpath) && len(glob(l:docpath . '/*')) > 0
      try
        echomsg l:path
        execute 'helptags ' . l:docpath
      catch
        echohl Error
        echomsg 'Error (' . v:exception . '): ' . l:path
        echohl None
      endtry
    endif
  endfor
  " No plugins on ~/.vim
  " helptags ~/.vim/doc
  echomsg 'Done.'
endfunction

command! -bar MakeHelpTags :call s:MakeHelpTags()

" }}}

" 一行コマンド {{{

" 再エンコード
command! -bar -nargs=1 Reenco e ++enc=<args>

" 行末の空白をのぞく (space, ideographic-space, tab)
command! -bar RemoveTrailingSpaces %s/[ 　	]\+$//c

" エンコーディング指定オープン
command! -bang -complete=file -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
command! -bang -complete=file -nargs=? Sjis edit<bang> ++enc=cp932 <args>
command! -bang -complete=file -nargs=? Euc edit<bang> ++enc=eucjp <args>
command! -bang -complete=file -nargs=? WUtf8 write<bang> ++enc=utf-8 <args>
command! -bang -complete=file -nargs=? WSjis write<bang> ++enc=cp932 <args>
command! -bang -complete=file -nargs=? WEuc write<bang> ++enc=eucjp <args>

" ファイルリネーム - http://vim-users.jp/2009/05/hack17/
command! -nargs=1 -complete=file Rename save <args>|call delete(expand('#'))

"シンタックスの再同期
command! -bar SSF syntax sync fromstart

" }}}

" 戦闘力 {{{

function! s:Scouter(file, ...)
  let l:pat = '^\s*$\|^\s*"'
  let l:lines = readfile(a:file)
  if !a:0 || !a:1
    let l:lines = split(substitute(join(l:lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(l:lines,'v:val !~# l:pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo s:Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
command! -bar -bang -nargs=? -complete=file GScouter
\        echo s:Scouter(empty(<q-args>) ? $MYGVIMRC : expand(<q-args>), <bang>0)

" }}}

" numeronym -> n7m {{{

function! Numeronym(word)
  let l:m = matchlist(a:word, '^\(.\)\(.*\)\(.\)$')
  return l:m[1] . string(len(l:m[2])) . l:m[3]
endfunction

function! ReplaceWithNumeronym()
  let l:word = Numeronym(expand('<cword>'))
  execute 'normal ' . 'caw' . l:word
endfunction

command! -bar Numeronym call ReplaceWithNumeronym()

" }}}

" XMonad xc を使ってウィンドウをリフレッシュ {{{

augroup XMonadRefreshWindow
  autocmd!
augroup END

" 念の為) この関数が実行されるまでに、'updatetime' が変更されても上書きされてしまう問題有り。
function! s:XMonadRefreshWindowDelayed()
  silent call vimproc#system('~/.xmonad/bin/xc command refresh-window')

  let &updatetime = s:xmonad_refresh_window_updatetime_backup
  unlet s:xmonad_refresh_window_updatetime_backup
  autocmd! XMonadRefreshWindow
endfunction

function! s:XMonadRefreshWindow()
  if !has('gui_running')
    return
  endif

  if exists('s:xmonad_refresh_window_updatetime_backup')
    return
  endif

  let s:xmonad_refresh_window_updatetime_backup = &updatetime
  set updatetime=200
  autocmd XMonadRefreshWindow CursorHold * call s:XMonadRefreshWindowDelayed()
endfunction

command! -bar XMonadRefreshWindow call s:XMonadRefreshWindow()

" }}}

" バルーンで Syntax 情報を得てみる {{{

function! s:BallonSyntax(name)
  set ballooneval
  if a:name ==# 'syntax'
    set balloonexpr=synIDattr(synID(v:beval_lnum,\ v:beval_col,\ 1),\ 'name')
  elseif a:name ==# 'fold'
    set balloonexpr=foldballoon#balloonexpr()
  else
    echoerr 'Unknown type: ' . a:name
  endif
endfunction

function! s:BalloonCompl(...)
  return ['syntax', 'fold']
endfunction

command! -bar -nargs=1 -complete=customlist,s:BalloonCompl BallonSyntax call s:BallonSyntax(<q-args>)

" }}}

" 日付挿入 {{{

function! s:InsertDate ()
  let l:text = substitute(system('LANG=ja_JP.UTF-8 date'), '\n', '', '')
  if &filetype ==# 'nox'
    let l:text = '# ' . l:text
  else
    let l:text = '<<' . l:text . '>>'
  endif
  call append(line('.'), [l:text, ''])
  normal! zzG
endfunction

command! -bar Date normal! :call s:InsertDate()<CR>

" }}}

" セッションの保存 {{{

function! s:MkSession(name)
  let l:fn = a:name

  if match(a:name, '\S\+') < 0
    let l:fn = (v:this_session ==# '' ? 'Session.vim' : v:this_session)
  elseif match(a:name, 'Session\.vim$') < 0
    let l:fn = a:name . 'Session.vim'
  else
    let l:fn = a:name
  endif

  let l:fn = fnamemodify(l:fn, ':p')
  let l:hfn = fnamemodify(l:fn, ':~')

  if filereadable(l:fn) && (input('Overwrite to "' . l:hfn . '"? (y/n) ') !=# 'y')
    echoerr 'Canceled!'
    return 0
  endif

  redraw
  echo 'Session has been made: ' . l:hfn
  execute 'mksession! ' . l:hfn
endfunction

command! -bar -complete=file -nargs=* MkSession call s:MkSession(<q-args>)

" }}}

" 下線を引く for rst とか {{{

function! UnderLine(up)
  let l:prev_len = strdisplaywidth(getline('.'))
  let l:char = nr2char(getchar())

  if l:char ==# 'l' && exists('s:previous_underline_char')
    let l:char = s:previous_underline_char
  else
    let s:previous_underline_char = l:char
  endif

  let l:text = ''

  while len(l:text) < l:prev_len
    let l:text .= l:char
  endwhile

  " 改行消さないために a を入れる
  if a:up
    return "o\a\<C-u>" . l:text . "\<Esc>kO\<C-u>" . l:text . "\<Esc>"
  else
    return "o\a\<C-u>" . l:text . "\<Esc>"
  endif
endfunction

" l を押すと最後に使った文字になる
nnoremap <expr> <Leader>l UnderLine(0)
nnoremap <expr> <Leader>L UnderLine(1)
command! -bar UnderLine call UnderLine

" }}}

" 色々なコマンドのメニュー {{{

function! s:InitUniteSomethingMenu()
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
    \   'googlesuggest'           : 'set completefunc=googlesuggest#Complete',
    \   'indent-line'             : 'IndentLinesToggle',
    \   'open-all-project-source' : 'OpenAllProjectSource',
    \   'quickhl'                 : 'QuickhlManualEnable',
    \   'relative-number'         : 'setlocal relativenumber!',
    \   'table-mode'              : 'TableModeToggle',
    \   'unite-zsh-history'       : 'Unite output/shellcmd:~/script/zsh/history-all -default-action=yank',
    \   'write-at-escape'         : 'EscWrite',
    \}

  " 上記で登録したコマンドを評価する関数
  " 最終的にこれで評価した結果が unite に登録される
  function l:commands.map(key, value)
    return {'word' : a:key, 'kind' : 'command', 'action__command' : a:value}
  endfunction

  let g:unite_source_menu_menus['something'] = deepcopy(l:commands)

  " 呼び出しのキーマップ ("I"nstant command)
  nnoremap <silent> <Leader>i :<C-u>Unite -immediately menu:something<CR>
  vnoremap <silent> <Leader>i :<C-u>Unite -immediately menu:something<CR>
endfunction

call s:InitUniteSomethingMenu()

" }}}

" 隠れバッファの削除 {{{

function! s:delete_hidden_buffer()
  let l:list = filter(range(1, bufnr('$')), 'bufexists(v:val) && !buflisted(v:val)')
  for l:num in l:list
    execute 'bw ' . l:num
  endfor
endfunction

command! -bar DeleteHiddenBuffer :call s:delete_Hidden_buffer()

" }}}

" Esc で保存 {{{

let s:write_at_escape = 0
function! s:ToggleWriteAtEscape()
  if s:write_at_escape
    set noautowrite
    autocmd! WriteAtEscape
    echomsg 'write-at-escape: Off'
  else
    set autowrite
    augroup WriteAtEscape
      MeowtoCmd CursorHold *  silent! wall
      MeowtoCmd CursorHoldI *  silent! wall
      MeowtoCmd InsertLeave *  silent! wall
    augroup END
    echomsg 'write-at-escape: On'
  endif
  let s:write_at_escape = !s:write_at_escape
endfunction
command! -bar EscWrite call s:ToggleWriteAtEscape()

" }}}

" mongo のシェルから貼り付けたものを適当に整形する {{{

function! s:ReformMongoPaste()
  %S/ISODate\((.+?)\)/\1
  %S/ObjectId\((.+?)\)/\1
  %G/.*/normal A,
  normal! G$x
  call append('^', '[')
  call append('$', ']')
  %!python -mjson.tool
endfunction
command! -bar ReformMongoPaste :call s:ReformMongoPaste()

" }}}

" エレクチオン {{{

command! -bar Election inoremap ん ン

" }}}

" テンキー表記を矢印に変換 {{{
function! s:KakugeReplace()
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

command! -bar -range=% KakugeReplace call s:KakugeReplace()
" }}}

" 空の隠れバッファを削除 {{{

function! s:KillHiddenEmptyBuffer()
  let l:killed = 0
  for l:nr in range(2, bufnr('$'))
    " echo printf('%d %s %s %s', l:nr, buflisted(l:nr), bufloaded(l:nr), bufname(l:nr))
    if buflisted(l:nr) == 1 && bufloaded(l:nr) == 1 && bufname(l:nr) ==# ''
      let l:killed += 1
      execute 'bdelete!' l:nr
    endif
  endfor
  echomsg printf('%d buffers have been killed!', l:killed)
endfunction

" 空気燃焼
command! -bar Burn call s:KillHiddenEmptyBuffer()

" }}}

" らんらんコマンド (quickrun) {{{

let s:anekos_fixed_run_command = 'QuickRun'

function! s:FixRunCommand(command)
  let l:command = len(a:command) ? a:command : getreg(':')

  let b:anekos_fixed_run_command = l:command
  let s:anekos_fixed_run_command = l:command
  echo 'fixed: ' . l:command
endfunction

function! s:RunRunCommand()
  let l:cmd = get(b:, 'anekos_fixed_run_command', s:anekos_fixed_run_command)
  echo 'RunRun: ' . l:cmd
  execute l:cmd
endfunction

command! -nargs=* -range FixRunCommand call s:FixRunCommand(<q-args>)
command! -bar -range RunRunCommand call s:RunRunCommand()

noremap <Leader>r          :RunRunCommand<CR>
noremap <Leader><Leader>r  :FixRunCommand<CR>

" }}}

" 価格履歴 (price-watcher) {{{

function! s:ExtractAmazonProductId (url)
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

function! s:ShowPriceLog (id)
  let l:id = a:id ==# '' ? s:ExtractAmazonProductId(s:UrlOnCursor()) : a:id
  echo system('price-watcher log ' . shellescape(l:id))
endfunction

function! s:UrlOnCursor ()
  let l:line = getline('.')
  let l:col = col('.')
  let l:left = l:line[0 : l:col - 2]
  let l:right = l:line[l:col - 1 : -1]

  let l:left = substitute(l:left, '^ *', '', '')
  let l:right = matchstr(l:right, '[^() ]\+')
  let l:url = l:left . l:right
  return l:url
endfunction

command! -bar -nargs=* PriceLog call s:ShowPriceLog(<q-args>)

" }}}

" ファイル名っぽいのをカーソル周辺から探してジャンプするんだね {{{

function! s:ExtractCodePath (line)
  let l:match = matchlist(a:line, '\(/\=\([-_.a-z0-9]\+/\)*[-_.a-z0-9]\+\)\(:\(\d\+\)\)\=')
  if len(l:match) > 0
    let l:filepath = l:match[1]
    let l:line = str2nr(l:match[4])

    if filereadable(l:filepath)
      return [1, l:filepath, l:line, 1]
    endif
  endif

  return [0, 0, 0, 1]
endfunction

function! s:JumpToFile (filepath, ln, col)
  let l:filepath = fnamemodify(a:filepath, ':p')
  let l:buf_nr = bufnr(a:filepath)

  if l:buf_nr > -1
    for l:tab_nr in range(1, tabpagenr('$'))
      if index(tabpagebuflist(l:tab_nr), l:buf_nr) >= 0
        execute l:tab_nr . 'tabnext'
        break
      endif
    endfor
  else
    1wincmd w
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
endfunction

function! s:JumpCode ()
  let l:line = line('.')

  for l:i in range(0, 5)

    let l:target_ln = l:line - l:i
    let [l:found, l:filepath, l:ln, l:col] = s:ExtractCodePath(getline(l:target_ln))

    if !l:found
      let l:target_ln = l:line + l:i
      let [l:found, l:filepath, l:ln, l:col] = s:ExtractCodePath(getline(l:target_ln))
    endif

    if l:found
      if l:ln == 0
        let l:matched = matchlist(getline(l:target_ln + 1), '\(\d\+\)\(:\(\d\+\)\)\=')
        if len(l:matched) > 0
          let l:ln = str2nr(l:matched[1])
          let l:col = str2nr(l:matched[3])
        endif
      endif

      call s:JumpToFile(l:filepath, l:ln, l:col)
      return
    end
  endfor
endfunction

command! -bar JumpCode :call <SID>JumpCode()

" }}}

" chdir to project dirctory (git) {{{

function! s:ChDirToPojectDirectory ()
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

command! -bar CdProjectRoot call s:ChDirToPojectDirectory()

" }}}

" ヘルプ以外の空バッファウィンドウを閉じる {{{

function! s:KillMeBaby ()
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

command! -bar KillMeBaby call s:KillMeBaby()

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

function! s:InsertCpo()
  call append(0, ['let s:save_cpo = &cpo', 'set cpo&vim', '', ''])
  call append(line('$'), ['', '', 'let &cpo = s:save_cpo', 'unlet s:save_cpo'])
  normal! gg
  redraw
  sleep 1
  normal! G
endfunction

command! -bar InsertCpo call s:InsertCpo()

" }}}

" バッファを grep {{{

function! s:BufferGrep(query)
  execute 'silent!' 'bufdo' 'vimgrepadd' printf('/%s/', escape(a:query, '/\')) '%'
endfunction

command! -bar -nargs=* BGrep call s:BufferGrep(<q-args>)

" }}}

" figlet {{{

" rc ファイルヘッダ用
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
