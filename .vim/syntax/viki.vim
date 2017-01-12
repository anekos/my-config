" viki.vim -- the viki syntax file
" @Author:      Thomas Link (samul AT web.de)
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     30-Dez-2003.
" @Last Change: 26-Mar-2006.
" @Revision: 0.590

if !g:vikiEnabled
    finish
endif

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" This command sets up buffer variables and adds some basic highlighting.
let b:vikiEnabled = 0
call VikiDispatchOnFamily("VikiMinorMode", -2)
let b:vikiEnabled = 2

" On slow machine the extended syntax highlighting can cause some major 
" slowdown (I'm not really sure what is causing this, but it can be 
" avoided anyway by highlighting only the basic syntax)
" if g:vikiBasicSyntax
"     finish
" endif

syntax sync minlines=2
" syntax sync maxlines=50
" syntax sync match vikiParaBreak /^\s*$/

syn match vikiEscape /\\/ contained containedin=vikiEscapedChar
syn match vikiEscapedChar /\\\_./ contains=vikiEscape,vikiChar

exe 'syn match vikiAnchor /^\('. escape(b:vikiCommentStart, '\/.*^$~[]') .'\)\?[[:blank:]]*#'. b:vikiAnchorNameRx .'/'
" syn match vikiMarkers /\(\([#?!+]\)\2\{2,2}\)/
syn match vikiMarkers /\V\(###\|???\|!!!\|+++\)/
" syn match vikiSymbols /\(--\|!=\|==\+\|\~\~\+\|<-\+>\|<=\+>\|<\~\+>\|<-\+\|-\+>\|<=\+\|=\+>\|<\~\+\|\~\+>\|\.\.\.\)/
syn match vikiSymbols /\V\(--\|!=\|==\+\|~~\+\|<-\+>\|<=\+>\|<~\+>\|<-\+\|-\+>\|<=\+\|=\+>\|<~\+\|~\+>\|...\)/

syn cluster vikiHyperLinks contains=vikiLink,vikiExtendedLink,vikiURL,vikiInexistentLink

if b:vikiTextstylesVer == 1
    syn match vikiBold /\(^\|\W\zs\)\*\(\\\*\|\w\)\{-1,}\*/
    syn region vikiContinousBold start=/\(^\|\W\zs\)\*\*[^ 	*]/ end=/\*\*\|\n\{2,}/ skip=/\\\n/
    syn match vikiUnderline /\(^\|\W\zs\)_\(\\_\|[^_\s]\)\{-1,}_/
    syn region vikiContinousUnderline start=/\(^\|\W\zs\)__[^ 	_]/ end=/__\|\n\{2,}/ skip=/\\\n/
    syn match vikiTypewriter /\(^\|\W\zs\)=\(\\=\|\w\)\{-1,}=/
    syn region vikiContinousTypewriter start=/\(^\|\W\zs\)==[^ 	=]/ end=/==\|\n\{2,}/ skip=/\\\n/
    syn cluster vikiTextstyles contains=vikiBold,vikiContinousBold,vikiTypewriter,vikiContinousTypewriter,vikiUnderline,vikiContinousUnderline,vikiEscapedChar
else
    syn region vikiBold start=/\(^\|\W\zs\)__[^ 	_]/ end=/__\|\n\{2,}/ skip=/\\_\|\\\n/ contains=vikiEscapedChar
    syn region vikiTypewriter start=/\(^\|[^\w`]\zs\)''[^ 	']/ end=/''\|\n\{2,}/ skip=/\\'\|\\\n/ contains=vikiEscapedChar
    syn cluster vikiTextstyles contains=vikiBold,vikiTypewriter,vikiEscapedChar
endif

syn cluster vikiText contains=@vikiTextstyles,@vikiHyperLinks,vikiMarkers

exe 'syn match vikiComment /\V\^\[[:blank:]]\*'. escape(b:vikiCommentStart, '\/') .'\.\*/ contains=@vikiText'

" syn region vikiString start=+^[[:blank:]]\+"\|"+ end=+"[.?!]\?[[:blank:]]\+$\|"+ contains=@vikiText
syn region vikiString start=+^"\|\s"+ end=+"+ contains=@vikiText

let b:vikiHeadingStart = '*'
if g:vikiFancyHeadings
    let hd=escape(b:vikiHeadingStart, '\/')
    exe 'syn region vikiHeading1 start=/\V\^'. hd .'\[[:blank:]]\+/ end=/\n/ contains=@vikiText'
    exe 'syn region vikiHeading2 start=/\V\^'. hd.hd .'\[[:blank:]]\+/ end=/\n/ contains=@vikiText'
    exe 'syn region vikiHeading3 start=/\V\^'. hd.hd.hd .'\[[:blank:]]\+/ end=/\n/ contains=@vikiText'
    exe 'syn region vikiHeading4 start=/\V\^'. hd.hd.hd.hd .'\[[:blank:]]\+/ end=/\n/ contains=@vikiText'
    exe 'syn region vikiHeading5 start=/\V\^'. hd.hd.hd.hd.hd .'\[[:blank:]]\+/ end=/\n/ contains=@vikiText'
    exe 'syn region vikiHeading6 start=/\V\^'. hd.hd.hd.hd.hd.hd .'\[[:blank:]]\+/ end=/\n/ contains=@vikiText'
else
    exe 'syn region vikiHeading start=/\V\^'. escape(b:vikiHeadingStart, '\/') .'\+\[[:blank:]]\+/ end=/\n/ contains=@vikiText'
endif

syn match vikiList /^[[:blank:]]\+\([-+*#?@]\|[0-9#]\+\.\|[a-zA-Z?]\.\)\ze[[:blank:]]/
syn match vikiDescription /^[[:blank:]]\+\(\\\n\|.\)\{-1,}[[:blank:]]::\ze[[:blank:]]/ contains=@vikiHyperLinks,vikiEscapedChar,vikiComment

syn match vikiPriorityListTodoA /^[[:blank:]]\+\zs#\(T: \+.\{-}A.\{-}:\|\d*A\d*\( \+\(_\|[0-9%-]\+\)\)\?\)\ze /
syn match vikiPriorityListTodoB /^[[:blank:]]\+\zs#\(T: \+.\{-}B.\{-}:\|\d*B\d*\( \+\(_\|[0-9%-]\+\)\)\?\)\ze /
syn match vikiPriorityListTodoC /^[[:blank:]]\+\zs#\(T: \+.\{-}C.\{-}:\|\d*C\d*\( \+\(_\|[0-9%-]\+\)\)\?\)\ze /
syn match vikiPriorityListTodoD /^[[:blank:]]\+\zs#\(T: \+.\{-}D.\{-}:\|\d*D\d*\( \+\(_\|[0-9%-]\+\)\)\?\)\ze /
syn match vikiPriorityListTodoE /^[[:blank:]]\+\zs#\(T: \+.\{-}E.\{-}:\|\d*E\d*\( \+\(_\|[0-9%-]\+\)\)\?\)\ze /
syn match vikiPriorityListTodoF /^[[:blank:]]\+\zs#\(T: \+.\{-}F.\{-}:\|\d*F\d*\( \+\(_\|[0-9%-]\+\)\)\?\)\ze /

syn match vikiPriorityListDoneA /^[[:blank:]]\+\zs#\(T: \+x\([0-9%-]\+\)\?.\{-}A.\{-}:\|\(T: \+\)\?\d*A\d* \+x[0-9%-]*\):\? .*/
syn match vikiPriorityListDoneB /^[[:blank:]]\+\zs#\(T: \+x\([0-9%-]\+\)\?.\{-}B.\{-}:\|\(T: \+\)\?\d*B\d* \+x[0-9%-]*\):\? .*/
syn match vikiPriorityListDoneC /^[[:blank:]]\+\zs#\(T: \+x\([0-9%-]\+\)\?.\{-}C.\{-}:\|\(T: \+\)\?\d*C\d* \+x[0-9%-]*\):\? .*/
syn match vikiPriorityListDoneD /^[[:blank:]]\+\zs#\(T: \+x\([0-9%-]\+\)\?.\{-}D.\{-}:\|\(T: \+\)\?\d*D\d* \+x[0-9%-]*\):\? .*/
syn match vikiPriorityListDoneE /^[[:blank:]]\+\zs#\(T: \+x\([0-9%-]\+\)\?.\{-}E.\{-}:\|\(T: \+\)\?\d*E\d* \+x[0-9%-]*\):\? .*/
syn match vikiPriorityListDoneF /^[[:blank:]]\+\zs#\(T: \+x\([0-9%-]\+\)\?.\{-}F.\{-}:\|\(T: \+\)\?\d*F\d* \+x[0-9%-]*\):\? .*/

syn match vikiTableRowSep /||\?/ contained containedin=vikiTableRow,vikiTableHead
syn region vikiTableHead start=/^[[:blank:]]*|| / skip=/\\\n/ end=/\(^\| \)||[[:blank:]]*$/ contains=ALLBUT,vikiTableRow,vikiTableHead transparent keepend
syn region vikiTableRow  start=/^[[:blank:]]*| / skip=/\\\n/ end=/\(^\| \)|[[:blank:]]*$/ contains=ALLBUT,vikiTableRow,vikiTableHead transparent keepend

syn region vikiMacro matchgroup=vikiMacroDelim start=/{[^:{}]\+:\?/ end=/}/ transparent

syn match vikiCommand /^\C[[:blank:]]*#\([A-Z]\{2,}\)\>\(\\\n\|.\)*/
syn region vikiRegion matchgroup=vikiMacroDelim 
            \ start=/^[[:blank:]]*#\([A-Z]\([a-z][A-Za-z]*\)\?\>\|!!!\).\{-}<<\z(.\+\)$/ end=/^[[:blank:]]*\z1[[:blank:]]*$/ contains=@vikiText
syn region vikiRegionWEnd matchgroup=vikiMacroDelim 
            \ start=/^[[:blank:]]*#\([A-Z]\([a-z][A-Za-z]*\)\?\>\|!!!\).\{-}:[[:blank:]]*$/ end=/^[[:blank:]]*#End[[:blank:]]*$/ contains=@vikiText
syn region vikiRegionAlt matchgroup=vikiMacroDelim 
            \ start=/^[[:blank:]]*\z(=\{4,}\)[[:blank:]]*\([A-Z][a-z]*\>\|!!!\).\{-}$/ end=/^[[:blank:]]*\z1\([[:blank:]].*\)\?$/ contains=@vikiText


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_viki_syntax_inits")
  if version < 508
    let did_viki_syntax_inits = 1
    command! -nargs=+ HiLink hi link <args>
  else
    command! -nargs=+ HiLink hi def link <args>
  endif
  
  if &background == "light"
      let s:cm1="Dark"
      let s:cm2="Light"
  else
      let s:cm1="Light"
      let s:cm2="Dark"
  endif

  if exists("g:vikiHeadingFont")
      let s:hdfont = " font=". g:vikiHeadingFont
  else
      let s:hdfont = ""
  endif
  
  if exists("g:vikiTypewriterFont")
      let s:twfont = " font=". g:vikiTypewriterFont
  else
      let s:twfont = ""
  endif
 
  HiLink vikiEscapedChars Normal
  exe "hi vikiEscape ctermfg=". s:cm2 ."grey guifg=". s:cm2 ."grey"
  exe "hi vikiList term=bold cterm=bold gui=bold ctermfg=". s:cm1 ."Cyan guifg=". s:cm1 ."Cyan"
  HiLink vikiDescription vikiList
  if g:vikiFancyHeadings
      if &background == "light"
          let hdhl="term=bold,underline cterm=bold gui=bold ctermfg=". s:cm1 ."Magenta guifg=".s:cm1."Magenta". s:hdfont
          exe "hi vikiHeading1 ". hdhl ." guibg=#ffff00"
          exe "hi vikiHeading2 ". hdhl ." guibg=#ffff30"
          exe "hi vikiHeading3 ". hdhl ." guibg=#ffff60"
          exe "hi vikiHeading4 ". hdhl ." guibg=#ffff90"
          exe "hi vikiHeading5 ". hdhl ." guibg=#ffffb0"
          exe "hi vikiHeading6 ". hdhl ." guibg=#ffffe0"
      else
          let hdhl="term=bold,underline cterm=bold gui=bold ctermfg=DarkMagenta guifg=DarkMagenta". s:hdfont
          exe "hi vikiHeading1 ". hdhl ." guibg=#ffff00"
          exe "hi vikiHeading2 ". hdhl ." guibg=#aadd00"
          exe "hi vikiHeading3 ". hdhl ." guibg=#88aa00"
          exe "hi vikiHeading4 ". hdhl ." guibg=#558800"
          exe "hi vikiHeading5 ". hdhl ." guibg=#225500"
          exe "hi vikiHeading6 ". hdhl ." guibg=#002200"
      endif
  else
      exe "hi vikiHeading term=bold,underline cterm=bold gui=bold ctermfg=". s:cm1 ."Magenta guifg=".s:cm1."Magenta". s:hdfont
  endif
  
  let vikiPriorityListTodo = ' term=bold,underline gui=bold guifg=Black '
  exec 'hi vikiPriorityListTodoA'. vikiPriorityListTodo  .'guibg=Red'
  exec 'hi vikiPriorityListTodoB'. vikiPriorityListTodo  .'guibg=Orange'
  exec 'hi vikiPriorityListTodoC'. vikiPriorityListTodo  .'guibg=Yellow'
  exec 'hi vikiPriorityListTodoD'. vikiPriorityListTodo  .'guibg=LightMagenta'
  exec 'hi vikiPriorityListTodoE'. vikiPriorityListTodo  .'guibg=LightYellow'
  exec 'hi vikiPriorityListTodoF'. vikiPriorityListTodo  .'guibg=LightGreen'
 
  " let vikiPriorityListDone = ' guifg='. s:cm1 .'Gray '
  " exec 'hi vikiPriorityListDoneA'. vikiPriorityListDone
  " exec 'hi vikiPriorityListDoneB'. vikiPriorityListDone
  " exec 'hi vikiPriorityListDoneC'. vikiPriorityListDone
  " exec 'hi vikiPriorityListDoneD'. vikiPriorityListDone
  " exec 'hi vikiPriorityListDoneE'. vikiPriorityListDone
  " exec 'hi vikiPriorityListDoneF'. vikiPriorityListDone
  HiLink vikiPriorityListDoneA Comment
  HiLink vikiPriorityListDoneB Comment
  HiLink vikiPriorityListDoneC Comment
  HiLink vikiPriorityListDoneD Comment
  HiLink vikiPriorityListDoneE Comment
  HiLink vikiPriorityListDoneF Comment
  
  exe "hi vikiTableRowSep term=bold cterm=bold gui=bold ctermbg=". s:cm2 ."Grey guibg=". s:cm2 ."Grey"
  
  exe "hi vikiSymbols term=bold cterm=bold gui=bold ctermfg=". s:cm1 ."Red guifg=". s:cm1 ."Red"
  hi vikiMarkers term=bold cterm=bold gui=bold ctermfg=DarkRed guifg=DarkRed ctermbg=yellow guibg=yellow
  hi vikiAnchor term=italic cterm=italic gui=italic ctermfg=grey guifg=grey
  HiLink vikiComment Comment
  HiLink vikiString String
  
  if b:vikiTextstylesVer == 1
      hi vikiContinousBold term=bold cterm=bold gui=bold
      hi vikiContinousUnderline term=underline cterm=underline gui=underline
      exe "hi vikiContinousTypewriter term=underline ctermfg=". s:cm1 ."Grey guifg=". s:cm1 ."Grey". s:twfont
      HiLink vikiBold vikiContinousBold
      HiLink vikiUnderline vikiContinousUnderline 
      HiLink vikiTypewriter vikiContinousTypewriter
  else
      " hi vikiBold term=italic,bold cterm=italic,bold gui=italic,bold
      hi vikiBold term=bold cterm=bold gui=bold
      exe "hi vikiTypewriter term=underline ctermfg=". s:cm1 ."Grey guifg=". s:cm1 ."Grey". s:twfont
  endif

  HiLink vikiMacroHead Statement
  HiLink vikiMacroDelim Identifier
  HiLink vikiCommand Statement
  HiLink vikiRegion Statement
  HiLink vikiRegionWEnd vikiRegion
  HiLink vikiRegionAlt vikiRegion
 
  delcommand HiLink
endif

if g:vikiMarkInexistent && !exists("b:vikiCheckInexistent")
    VikiMarkInexistent
endif

