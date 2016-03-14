"==========================================
" |\  /| |\   |_/ |_/ |   |    \    / |
" | /\ | |\ \ |_  |_  |  _|_|    \/   | /|
" |/  \| |  \ | \ | \ | | |     /  \  |/ |
" |    | |            |   |   /     \    |
"==========================================

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

" コマンドモード時にカーソル移動するのに便利ー
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>

" 検索時に結果が中央に来るようにする
noremap n nzzzv
noremap N Nzzzv

" incsearch.vim FIXME
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" nnoremap /  /\v
" nnoremap ?  /\v

" 検索のハイライト
noremap <silent> <Plug>(vimrc-searchafter) Nzz:set hlsearch<CR>
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
nnoremap <silent> <ESC><ESC> :<C-u>set hlsearch!<CR>

" for US KBD
nnoremap ; :
xnoremap ; :
nnoremap : ;
xnoremap : ;

" クリップボードから貼り付け
inoremap <C-r>* <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>

" kk Escape
inoremap kk <Esc>
inoremap jj <Esc>

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

" error
nnoremap [c :cprevious<CR>
nnoremap ]c :cnext<CR>
nnoremap [C :cfirst<CR>
nnoremap ]C :clast<CR>
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>

" }}}

" map {{{

" Save like Emacs
inoremap <C-x><C-s> <ESC>:<C-u>w<CR>a
inoremap <C-x>s <ESC>:<C-u>w<CR>a

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
"   ウィンドウを作成しているときに切り替えると、
"   描画がおかしい問題があるので、<C-l> で再描画する。
nnoremap <C-n> :tabnext<CR><C-l>
nnoremap <C-p> :tabprev<CR><C-l>

" window walker
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-h> <C-w>h
nnoremap <M-l> <C-w>l
inoremap <M-j> <Esc><C-w>j
inoremap <M-k> <Esc><C-w>k
inoremap <M-h> <Esc><C-w>h
inoremap <M-l> <Esc><C-w>l

" Emacs ライクなキャンセル
cnoremap <C-g> <C-c>

" like ranger
nnoremap <expr> cd ":\<C-u>cd\<Space>" . fnamemodify(get(t:, 'cwd', '~/'), ':~:.')

" 改行
nnoremap <CR> A<CR><ESC>
inoremap <S-CR> <C-o>O

" Co Pi Pe
if has('gui_running')
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" }}}

" <Leader> {{{

" Leaders
nmap s <Leader>
xmap s <Leader>

" Migemo 検索
noremap <Leader>/ :<C-u>Migemo<Space>

" buffer
nnoremap <Leader>x :<C-u>wincmd c<CR>

" ref.vim
nnoremap <Leader>R :<C-u>Ref<Space>

" QuickRun
nnoremap <Leader>r :<C-u>QuickRun<CR>
vnoremap <Leader>r :<C-u>'<,'>QuickRun<CR>

" tagbar
nnoremap <Leader>tb :<C-u>Tagbar<CR>

" tab
nnoremap <Leader>tn :<C-u>tabnew<CR>
nnoremap <Leader>te :<C-u>tabedit<Space>
nnoremap <Leader>tx :<C-u>tabclose<CR>
nnoremap <Leader>tt :<C-u>Unite -immediately tab:no-current<CR>
nnoremap <Leader>tm :<C-u>tabnew<Bar>Unite -unique -buffer-name=files file_mru<CR>

" Unite
nnoremap <Space>          :<C-u>Unite -immediately -buffer-name=files -default-action=goto-or-open buffer file_rec/async<CR>
nnoremap <Leader><Space>  :<C-u>Unite -immediately -buffer-name=files -default-action=goto-or-tabopen buffer file_rec/async<CR>
nnoremap <Leader>uu :<C-u>Unite<Space>
nnoremap <Leader>U :<C-u>UniteResume<CR>
nnoremap <Leader>b :<C-u>Unite -immediately -buffer-name=files buffer<CR>
nnoremap <Leader>B :<C-u>Unite tab:no-current<CR>
nnoremap <Leader>ua :<C-u>Unite grep:.<CR>
nnoremap <Leader>uA :<C-U>Unite -auto-preview grep:.<CR>
nnoremap <Leader>ub :<C-u>Unite bookmark<CR>
nnoremap <Leader>uC :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <Leader>uc :<C-u>Unite -default-action=edit command<CR>
nnoremap <Leader>ud :<C-u>Unite -unique -buffer-name=files -default-action=cd<Space>directory_mru<CR>
nnoremap <Leader>uF :<C-u>Unite -unique -buffer-name=files file<CR>
nnoremap <Leader>uf :<C-u>Unite -unique -buffer-name=files file_rec/async<CR>
nnoremap <Leader>ug :<C-u>Unite file_rec/git<CR>
nnoremap <Leader>uh :<C-u>Unite history/command -default-action=edit<CR>
nnoremap <Leader>u: :<C-u>Unite history/command -default-action=edit<CR>
nnoremap <Leader>uj :<C-u>Unite -auto-preview jump<CR>
nnoremap <Leader>ul :<C-u>Unite -no-quit -auto-preview location_list<CR>
nnoremap <Leader>uL :<C-u>Unite line<CR>
nnoremap <Leader>um :<C-u>Unite -unique -buffer-name=files file_mru<CR>
nnoremap <Leader>uM :<C-u>Unite mapping<CR>
nnoremap <Leader>uo :<C-u>Unite outline<CR>
nnoremap <Leader>uq :<C-u>Unite -no-quit -auto-preview quickfix<CR>
nnoremap <Leader>ur :<C-u>Unite quickrun_config -default-action=set_global_quickrun_config<CR>
nnoremap <Leader>uR :<C-u>Unite quickrun_config -default-action=execute<CR>
nnoremap <Leader>us :<C-u>Unite file_rec:~/.vim/part file_rec:~/.vim/dein<CR>
nnoremap <Leader>uS :<C-u>Unite located_session<CR>
nnoremap <Leader>uT :<C-u>Unite tab:no-current<CR>
nnoremap <Leader>ut :<C-u>Unite tag<CR>
nnoremap <Leader>uv :<C-u>Unite variable<CR>
nnoremap <Leader>uw :<C-u>Unite window:no-current<CR>
nnoremap <Leader>uy :<C-u>Unite history/yank<CR>
nnoremap <Leader>u/ :<C-u>Unite -buffer-name=search line:forward<CR>
nnoremap <Leader>u? :<C-u>Unite -buffer-name=search line:backward<CR>

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <Leader>o <Plug>(openbrowser-smart-search)
xmap <Leader>o <Plug>(openbrowser-smart-search)

" QuickHl
nmap <Leader>hh <Plug>(quickhl-manual-this)
nmap <Leader>hr <Plug>(quickhl-manual-reset)
nnoremap <Leader>hd :<C-u>QuickhlManualDelete<CR>
nnoremap <Leader>ha :<C-u>QuickhlManualAdd<Space>

" 保存 ﾎﾟﾗﾎﾟﾗﾎﾟﾗ
nnoremap <Leader>w :<C-u>update<CR>
nnoremap <Leader>W :<C-u>wall<CR>
nnoremap <Leader>z ZZ

" nox
nnoremap <Leader>ns :<C-u>NoxSearch<Space>
nnoremap <Leader>nt :<C-u>Unite nox_tag<CR>
nnoremap <Leader>nm :<C-u>Unite nox_mlt<CR>
nnoremap <Leader>nM :<C-u>Unite nox_mlt_source<CR>
nnoremap <Leader>nl :<C-u>NoxLocationOpen<CR>

" neocomplate
nnoremap <Leader>N :<C-u>NeoCompleteToggle<CR>

" caw - commentout
nmap <Leader>c <plug>(caw:i:toggle)
vmap <Leader>c <plug>(caw:i:toggle)

" }}}

" for plugin {{{

" runes
imap <C-z>z <Plug>(runes_toggle)
imap <C-z><C-z> <Plug>(runes_toggle)
imap <C-z>g <Plug>(runes_start_german)
imap <C-z>a <Plug>(runes_start_anglosaxon)
imap <C-z>d <Plug>(runes_start_denmark)
imap <C-z>s <Plug>(runes_start_sweden)
imap <C-z>u <Plug>(runes_start_new_britannia)

" multiblock
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
xmap ab <Plug>(textobj-multiblock-a)
xmap ib <Plug>(textobj-multiblock-i)

" poslist
map <Leader><C-o> <Plug>(poslist-prev-buf)
map <Leader><C-i> <Plug>(poslist-next-buf)

" ambcmd
cnoremap <expr> <C-o> ambicmd#expand("\<Space>")

" textmanip
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)
xmap <Leader>j <Plug>(textmanip-duplicate-down)
xmap <Leader>k <Plug>(textmanip-duplicate-up)

" vimshell
vnoremap <Leader>> :VimShellJoinedSendString<CR>

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
inoremap 「 [
inoremap 」 ]
inoremap （ (
inoremap ） )
inoremap ｛ {
inoremap ｝ }
inoremap ； ;
inoremap ： :
inoremap ｜ \|
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

function! s:InitStickyShiftBySemiColon ()
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
call s:InitStickyShiftBySemiColon()

" }}}
