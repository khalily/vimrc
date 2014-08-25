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

Bundle 'Shougo/neocomplete'
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

Bundle 'honza/vim-snippets'
Bundle 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"Bundle 'Valloric/YouCompleteMe'
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_complete_in_comments = 1
"let g:ycm_confirm_extra_conf = 0

"let g:ycm_semantic_triggers =  {
"\   'c' : ['::', '->', '.'],
"\   'objc' : ['->', '.'],
"\   'ocaml' : ['.', '#'],
"\   'cpp,objcpp' : ['->', '.', '::'],
"\   'perl' : ['->'],
"\   'php' : ['->', '::'],
"\   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
"\   'ruby' : ['.', '::'],
"\   'lua' : ['.', ':'],
"\   'erlang' : [':'],
"\ }

"nnoremap <leader>g :YcmCompleter GoToImprecise<CR>

Bundle 'ervandew/supertab'
" SuperTab
" let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2

Bundle 'davidhalter/jedi-vim'

let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
let g:jedi#popup_select_first = "0"
let g:jedi#auto_vim_configuration = "0"


Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'

"--------------
" IDE features
"--------------
"
Bundle 'wting/rust.vim'

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

Bundle 'humiaozuzu/TabBar'
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
