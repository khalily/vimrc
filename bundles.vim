set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
Bundle 'gmarik/vundle'

" --------------
" Code Completions
" --------------

Bundle 'vim-ruby/vim-ruby'
Bundle 'honza/vim-snippets'
Bundle 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


Bundle 'Valloric/YouCompleteMe'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0

let g:ycm_semantic_triggers =  {
\   'c' : ['::', '->', '.'],
\   'objc' : ['->', '.'],
\   'ocaml' : ['.', '#'],
\   'cpp,objcpp' : ['->', '.', '::'],
\   'perl' : ['->'],
\   'php' : ['->', '::'],
\   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
\   'ruby' : ['.', '::'],
\   'lua' : ['.', ':'],
\   'erlang' : [':'],
\ }

nnoremap <leader>g :YcmCompleter GoToImprecise<CR>

Bundle 'ervandew/supertab'
" SuperTab
" let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2

"Bundle 'davidhalter/jedi-vim'

"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = "<leader>d"
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"
"let g:jedi#show_call_signatures = "1"
"let g:jedi#popup_select_first = "0"

Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'

"--------------
" IDE features
"--------------

Bundle 'scrooloose/nerdtree'
"工程文件浏览
let NERDTreeWinSize=22
"设置NERDTree子窗口位置
let NERDTreeWinPos="right"
"显示隐藏文件
let NERDTreeShowHidden=0
let NERDChristmasTree=0
let NERDTreeChDirMode=2
"NERDTree子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
"删除文件时自动删除文件对应buffer
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

"Bundle 'humiaozuzu/TabBar'
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white


Bundle 'majutsushi/tagbar'
"标签列表
"设置tagbar子窗口的位置出现在主编辑区的左边
let tagbar_left=1
"设置显示／隐藏标签列表子窗口的快捷键。速记：taglist

"设置标签子窗口的宽度
let tagbar_width=30
"tagbar子窗口中不显示冗余帮助信息
let g:tagbar_compact=1

"设置ctags对哪些代码元素生成标签
let g:tagbar_type_cpp = {
    \'ctagstype' : 'c++',
    \'kinds' : [
    \'d:macros:1',
    \'g:enums',
    \'t:typedefs:0:0',
    \'e:enumerators:0:0',
    \'n:namespaces',
    \'c:classes',
    \'s:structs',
    \'u:unions',
    \'f:functions',
    \'m:members:0:0',
    \'v:global:0:0',
    \'x:external:0:0',
    \'l:local:0:0'
    \],
    \'sro' : '::',
    \'kind2scope' : {
    \'g' : 'enum',
    \'n' : 'namespace',
    \'c' : 'class',
    \'s' : 'struct',
    \'u' : 'union'
    \},
    \'scope2kind' : {
    \'enum' : 'g',
    \'namespace' : 'n',
    \'class' : 'c',
    \'struct' : 's',
    \'union' : 'u'
    \}
    \}

" tag for go
let g:tagbar_type_go = { 
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [ 
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : { 
        \ 'ctype' : 't',
        \ 'ntype' : 'n' 
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }


Bundle 'kien/ctrlp.vim'

set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'"

Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'khalily/cscope.vim-1'

" in case your cscope execute is not in system path.
" let g:cscope_cmd = 'D:/tools/vim/cscope.exe'
" s: Find this C symbol
map <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
map <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
map <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
map <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
map <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
map <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
map <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
map <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
map <leader>l :call ToggleLocationList()<CR>

let g:cscope_preload_path="/usr/include/c++/;"
Bundle 'bronson/vim-trailing-whitespace'

Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>'

Bundle 'terryma/vim-multiple-cursors'

"--------------
" Color Schemes
"--------------
Bundle 'altercation/vim-colors-solarized'
Bundle 'rickharris/vim-monokai'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-vividchalk'


filetype plugin indent on     " required!
