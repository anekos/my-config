"=================
" |\  /| |\   |_/
" | /\ | |\ \ |_
" |/  \| |  \ | \
" |    | |
"=================

scriptencoding utf8

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
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

" for US KBD
nnoremap <expr> ; quickrun#hook#lightline_quickrun_status#current() ==# '' ? 'q:' : ':'
xnoremap <expr> ; quickrun#hook#lightline_quickrun_status#current() ==# '' ? 'q:' : ':'
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

" inu-operator-surround
map <silent>Sa <Plug>(operator-surround-append)
map <silent>Sd <Plug>(operator-surround-delete)
map <silent>Sr <Plug>(operator-surround-replace)
nmap <silent>Sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
nmap <silent>Srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

" オペレータ実行時にカーソルを移動しないようにする - http://secret-garden.hatenablog.com/entry/2015/03/18/232847
map gu <Plug>(operator-stay-cursor-gu)
map gU <Plug>(operator-stay-cursor-gU)
map <expr> = operator#stay_cursor#wrapper('=')

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

autocmd Meowrc CmdwinEnter * call s:initialize_command_window()

function! s:initialize_command_window()
  if getcmdwintype() ==# ':'
    inoremap <buffer><expr> <C-o>       ambicmd#expand('')
    " inoremap <buffer><expr> <CR>        ambicmd#expand("\<Esc>\<CR>")
  endif

  inoremap <buffer>       <C-g>       <C-c><C-c>
  inoremap <buffer>       <C-k>       <Up><End>
  inoremap <buffer>       <C-l>       <Down><End>
  inoremap <buffer><expr> <C-j>       "\<CR>q" . getcmdwintype()

  " コマンドラインでの挙動をエミュレートする
  inoremap <buffer>       <C-r>%      <C-r>#
  inoremap <buffer>       <C-r><C-w>  <C-c><C-r><C-w><C-f>
  inoremap <buffer>       <C-r><C-a>  <C-c><C-r><C-a><C-f>

  " タブで何かする
  inoremap <buffer>       <C-t>       <Home>tab <End><CR>

  " Abbr
  iabbrev <buffer><expr>  n.          bufname('#')
  iabbrev <buffer><expr>  e.          expand(input('Filename modifier: ', '#:'))
  iabbrev <buffer><expr>  h.          expand('#:h')
  iabbrev <buffer><expr>  /.          @/

  " 閉じる
  nnoremap <buffer>       <C-g>       <C-c><C-c>

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

scriptencoding utf8

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
inoremap ？ ?

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
