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
Bundle 'Valloric/YouCompleteMe'
Bundle 'ervandew/supertab'
"Bundle 'davidhalter/jedi-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'

"--------------
" IDE features
"--------------

Bundle 'scrooloose/nerdtree'
"Bundle 'humiaozuzu/TabBar'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'khalily/cscope.vim-1'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'terryma/vim-multiple-cursors'

"--------------
" Color Schemes
"--------------
Bundle 'altercation/vim-colors-solarized'
Bundle 'rickharris/vim-monokai'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-vividchalk'


filetype plugin indent on     " required!
