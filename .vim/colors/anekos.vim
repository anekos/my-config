" Maintainer:   anekos <anekos@snca.net>
" Original:     wombat - Lars H. Nielsen (dengmao@gmail.com)
" Last Change:  Sun Dec 21 06:52:42     2008

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "anekos"

" Vim >= 7.0 specific colors
if version >= 700
endif

" General colors ( )
hi Cursor           guifg=#000000 guibg=#b0e0e6 gui=none
hi Normal           guifg=#f6f3e8 guibg=#242424 gui=none
hi NonText          guifg=#808080 guibg=#303030 gui=none
hi LineNr           guifg=#857b6f guibg=#202020 gui=none
hi StatusLine       guifg=#f6f3e8 guibg=#444444 gui=none
hi StatusLineNC     guifg=#857b6f guibg=#444444 gui=none
hi VertSplit        guifg=#444444 guibg=#444444 gui=none
hi Folded           guibg=#384048 guifg=#a0a8b0 gui=none
hi Title            guifg=#f6f3e8 guibg=NONE    gui=bold
hi Visual           guifg=#f6f3e8 guibg=#444444 gui=none
"hi LineNr          guifg=#857b6f guibg=#000000 gui=none

" Tab
hi SpecialKey       guifg=#553353 guibg=#242424 gui=none

" Syntax highlighting
hi Comment          guifg=#99968b gui=none
hi Todo             guifg=#8f8f8f gui=italic
hi Constant         guifg=#e5786d gui=none
hi String           guifg=#95e454 gui=none
hi Identifier       guifg=#cae682 gui=none
hi Function         guifg=#cae682 gui=none
hi Type             guifg=#cae682 gui=none
hi Statement        guifg=#8ac6f2 gui=none
hi Keyword          guifg=#8ac6f2 gui=none
hi PreProc          guifg=#e5786d gui=none
hi Special          guifg=#e7f6da gui=none
hi Conceal          guifg=Yellow  guibg=#242424 gui=bold
"hi Number          guifg=#e5786d gui=none

" Links
hi! link FoldColumn LineNr

" Misc
hi Pmenu            guibg=black
hi PmenuSBar        guibg=black
hi PmenuSel         guifg=#000000 guibg=#cae682
hi SpellErrors      guifg=yellow
hi CursorLine       guibg=#202020
hi SpellBad         guisp=yellow
hi SpecialKey       guifg=#606060
hi CursorColumn     guibg=#2d2d2d
hi MatchParen       guifg=#f6f3e8 guibg=#800080 gui=bold
