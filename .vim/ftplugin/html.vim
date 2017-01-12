
" |--------------------------------------------------------------------
" |Keys     |Insert   |For  |Comment
" |---------|---------|-----|-------------------------------------------
" |\&       |&amp;    |&    |ampersand
" |\<       |&lt;     |<    |less-than sign
" |\>       |&gt;     |>    |greater-than sign
" |\.       |&middot; |・   |middle dot (decimal point)
" |\?       |&#8212;  |?    |em-dash
" |\2       |&#8220;  |“   |open curved double quote
" |\"       |&#8221;  |”   |close curved double quote
" |\`       |&#8216;  |‘   |open curved single quote
" |\'       |&#8217;  |’   |close curved single quote (apostrophe)
" |\`       |`        |`    |OS-dependent open single quote
" |\'       |'        |'    |OS-dependent close or vertical single quote
" |\<Space> |&nbsp;   |     |non-breaking space
" |---------------------------------------------------------------------
"
" > http://www.stripey.com/vim/html.html

inoremap <buffer> \\ \
inoremap <buffer> \& &amp;
inoremap <buffer> \< &lt;
inoremap <buffer> \> &gt;
inoremap <buffer> \. ・
inoremap <buffer> \- &#8212;
inoremap <buffer> \<Space> &nbsp;
inoremap <buffer> \` &#8216;
inoremap <buffer> \' &#8217;
inoremap <buffer> \2 &#8220;
inoremap <buffer> \" &#8221;
