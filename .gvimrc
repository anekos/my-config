"================================================================================
" anekos gvim rc
"                                                         vim: set ts=2 sw=2 et :
"================================================================================

" GUI Options {{{

" �c�[���o�[�폜
set guioptions-=T

" GUI�^�u���g��Ȃ�
set guioptions-=e

" ���j���[�폜
set guioptions-=m

" ���x��
set guitablabel=%N:\ %f

" }}}

" set {{{

" �R�}���h���C���s��
set cmdheight=1

" }}}

if has('win32')
  source ~/.gvimrc_win32
endif

if has('unix')
  source ~/.gvimrc_linux
endif

