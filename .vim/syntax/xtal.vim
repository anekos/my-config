" Vim syntax file
" Language: xtal
" Maintainer:	AkumaNekoShogun
" Last Change:	2007 Feb 13
" vim: ts=8 sw=8 et

if exists("b:current_syntax")
  finish
endif

syntax clear

syntax case match

syntax keyword xtalStatement            return break continue
syntax keyword xtalLabel                case
syntax keyword xtalConditional          if else swtich while
syntax keyword xtalException            try throw finally catch
syntax keyword xtalFunction             function method
syntax keyword xtalIdentifier           once
syntax keyword xtalStructure            class

syntax match   xtalLineComment          "\/\/.*" contains=@spell
syntax match   xtalSpecial              "\\." contained
syntax match   xtalNumber               "-\?\(\d\+\.\d\+\|\d\+\|0[xX][0-9a-fA-F]\+\)\>"

syntax region  xtalComment	        start="/\*"  end="\*/" contains=@Spell
syntax region  xtalStringDQ             start=+"+  skip=+\\\\\|\\"+  end=+"\|$+  contains=xtalSpecial
syntax region  xtalStringSQ             start=+'+  skip=+\\\\\|\\'+  end=+'\|$+  contains=xtalSpecial
syntax region  xtalStringS              start="%\z([~`!@#$%^&*_\-+|\:;"',.?/]\)" end="\z1" skip="\\\\\|\\\z1" contains=xtalSpecial


syntax match   xtalBraces	        "[{}\[\]]"
syntax match   xtalParens	        "[()]"


"--------------------------------------------------------------------------------
" highlight
"--------------------------------------------------------------------------------

highlight link xtalStatement            Statement
highlight link xtalConditional          Conditional
highlight link xtalLineComment          Comment
highlight link xtalIdentifier           Identifier
highlight link xtalStringDQ             String
highlight link xtalStringSD             String
highlight link xtalStringS              String
highlight link xtalSpecial              Special
highlight link xtalNumber               Number
highlight link xtalFunction             Function
highlight link xtalStructure            Structure
highlight link xtalException            Exception

