" Vim color file
" Maintainer:   Hiroshi Funai <hfunai@gmail.com>
" Last Change:  21 Dec 2008
" URL:		    http://blog.monospace.jp/
" Version:      0.1

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors
"
" http://www.bitbucket.org/hfunai/hfunai/src/tip/vim/colors/monochrome.vim

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="monochrome"

hi Normal guifg=#787878 guibg=#000000
hi NonText guifg=#FFFFFF guibg=#000000
hi Cursor guifg=#000000 guibg=#FFFFFF
"hi CursorIM
hi Directory guifg=#FFFFFF
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
"hi VertSplit
"hi Folded
"hi FoldColumn
"hi IncSearch
hi LineNr guifg=#FFFFFF
"hi ModeMsg	
"hi MoreMsg	
"hi NonText	
"hi Question
hi Search guifg=#FFFFFF guibg=#545454
hi SpecialKey guifg=#FFFFFF
"hi StatusLine	
"hi StatusLineNC	
"hi Title
"hi VisualNOS
"hi WarningMsg
"hi WildMenu
"hi Menu
hi PMenu guifg=#FFFFFF guibg=#333333
hi PMenuSel guifg=#FFFFFF guibg=#CCCCCC
"hi Scrollbar
"hi Tooltip	

" syntax highlighting groups
hi Comment guifg=#444444 gui=italic
hi Constant	guifg=#CCCCCC
hi Identifier guifg=#EEEEEE
hi Statement guifg=#FFFFFF gui=bold
hi PreProc guifg=#FFFFFF gui=underline
hi Type	 guifg=#FFFFFF gui=none
hi Special guifg=#545454
hi Underlined guifg=#FFFFFF gui=underline
hi Ignore guifg=#333333
hi Error guifg=#000000 guibg=#333333
hi Todo	 guifg=#545454 guibg=#EEEEEE

