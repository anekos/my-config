

set t_Co=256
set term=screen

hi clear

"set background&
hi Normal         cterm=NONE       ctermfg=grey
hi LineNr         cterm=NONE       ctermfg=darkred
hi ModeMsg        cterm=NONE       ctermfg=brown
hi Pmenu          cterm=NONE       ctermfg=gray           ctermbg=black 
hi PmenuSbar      cterm=NONE       ctermbg=darkred
hi PmenuSel       cterm=bold       ctermfg=yellow
hi PmenuThumb     cterm=reverse    ctermfg=gray
hi Statement      cterm=bold       ctermfg=yellow
hi StatusLine     cterm=bold       ctermfg=darkyellow
hi StatusLineNC   cterm=NONE       ctermfg=darkyellow
hi TabLine        cterm=NONE       ctermfg=brown
hi TabLineSel     cterm=NONE       ctermfg=brown
hi WildMenu                        ctermfg=white
hi Search         cterm=underline  ctermfg=red            ctermbg=yellow


finish
hi Function ctermfg=darkgreen
hi Repeat ctermfg=darkgreen
hi String ctermfg=darkmagenta
hi Number ctermfg=darkmagenta
hi Boolean ctermfg=darkmagenta
hi Normal ctermfg=gray ctermbg=black
hi Cursor ctermfg=gray
hi Comment ctermfg=darkcyan
hi Constant term=underline ctermfg=blue
hi Special ctermfg=blue
hi Identifier term=underline ctermfg=white
hi Statement ctermfg=blue
hi PreProc term=underline ctermfg=darkgreen
hi Type term=underline ctermfg=darkgreen
hi Underlined term=underline cterm=underline ctermfg=darkcyan
hi Ignore ctermfg=blue
hi Error term=bold ctermbg=darkmagenta ctermfg=black
hi Todo term=bold ctermfg=black ctermbg=darkcyan
hi Pmenu ctermbg=black ctermfg=gray
hi PmenuSel ctermbg=darkcyan ctermfg=black
hi PmenuSbar ctermbg=darkred
hi PmenuThumb cterm=reverse ctermfg=gray
hi TabLine term=underline cterm=underline ctermfg=gray ctermbg=darkred
hi TabLineSel term=bold
hi TabLineFill term=reverse cterm=reverse
hi MatchParen term=reverse ctermfg=brown ctermbg=darkcyan
hi SpecialKey term=bold ctermfg=gray
hi NonText term=bold ctermfg=blue
hi Directory term=bold ctermfg=brown
hi ErrorMsg ctermbg=darkmagenta ctermfg=black
hi IncSearch term=reverse cterm=reverse ctermfg=brown ctermbg=black
hi Search term=reverse ctermfg=black ctermbg=brown
hi MoreMsg term=bold ctermfg=darkgreen
hi ModeMsg term=bold ctermfg=darkmagenta
hi LineNr term=underline cterm=underline ctermfg=blue ctermbg=black
hi Question term=bold ctermfg=blue
hi StatusLine term=bold,reverse cterm=reverse ctermfg=blue ctermbg=black
hi StatusLineNC term=bold,reverse cterm=reverse ctermfg=blue ctermbg=black
hi VertSplit ctermfg=black ctermbg=darkred term=reverse cterm=reverse
hi Title ctermfg=gray
hi Visual term=reverse cterm=reverse ctermfg=darkcyan ctermbg=black
hi VisualNOS term=bold,underline ctermfg=darkcyan ctermbg=black
hi WarningMsg term=bold ctermfg=darkmagenta
hi WildMenu term=bold ctermfg=black ctermbg=darkcyan
hi Folded ctermbg=darkcyan ctermfg=black
hi FoldColumn ctermbg=darkcyan ctermfg=black
hi DiffAdd term=bold ctermbg=brown ctermfg=black
hi DiffChange term=bold ctermbg=darkred
hi DiffDelete term=bold ctermfg=black ctermbg=brown
hi DiffText term=reverse ctermbg=darkmagenta ctermfg=black
hi SignColumn term=bold ctermfg=black ctermbg=darkcyan


" color terminal definitions
"hi SpecialKey    ctermfg=darkgreen
"hi NonText       cterm=bold ctermfg=darkblue
"hi Directory     ctermfg=darkcyan
"hi ErrorMsg      cterm=bold ctermfg=7 ctermbg=1
"hi IncSearch     cterm=NONE ctermfg=yellow ctermbg=green
"hi Search        cterm=NONE ctermfg=grey ctermbg=blue
"hi MoreMsg       ctermfg=darkgreen
"hi ModeMsg       cterm=NONE ctermfg=brown
"hi LineNr        ctermfg=3
"hi Question      ctermfg=green
"hi StatusLine    cterm=bold ctermfg=yellow ctermbg=darkyellow
"hi StatusLineNC  ctermfg=darkyellow ctermbg=darkyellow
"
"hi VertSplit     cterm=reverse
"hi Title         ctermfg=5
"hi Visual        cterm=reverse
"hi VisualNOS     cterm=bold,underline
"hi WarningMsg    ctermfg=1
"hi WildMenu      ctermfg=0 ctermbg=3
"hi Folded        ctermfg=darkgrey ctermbg=NONE
"hi FoldColumn    ctermfg=darkgrey ctermbg=NONE
"hi DiffAdd       ctermbg=4
"hi DiffChange    ctermbg=5
"hi DiffDelete    cterm=bold ctermfg=4 ctermbg=6
"hi DiffText      cterm=bold ctermbg=1
"hi Comment       ctermfg=darkcyan
"hi Constant      ctermfg=brown
"hi Special       ctermfg=5
"hi Identifier    ctermfg=6
"hi Statement     ctermfg=3
"hi PreProc       ctermfg=5
"hi Type          ctermfg=2
"hi Underlined    cterm=underline ctermfg=5
"hi Ignore        ctermfg=darkgrey
"hi Error         cterm=bold ctermfg=7 ctermbg=1
"hi TabLine       ctermfg=grey
"hi TabLineSel    cterm=bold ctermfg=grey
"
"" vim: set fdl=0 fdm=marker:
