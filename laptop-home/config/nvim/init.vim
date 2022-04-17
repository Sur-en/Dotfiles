"Common settings
set encoding=UTF-8
set number
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set mouse=a
set winbl=10 " Set floating window to be slightly transparent
set termguicolors " Enable true color support
set ignorecase " Ignore case when searching
set smartcase " If the search string has an upper case letter in it, the search will be case s>
set autoread " Automatically re-read file if a change was detected outside of vim
set cursorline
set clipboard=unnamedplus " This changes the default Vim register to the + register

source $XDG_CONFIG_HOME/nvim/plugins.vimrc
source $XDG_CONFIG_HOME/nvim/keys.vimrc
source $XDG_CONFIG_HOME/nvim/theme.vimrc

autocmd BufRead,BufNewFile *.md setlocal spell " Enable spellcheck for markdown files

" === ntpeters/vim-better-whitespace === "
let g:strip_whitespace_on_save=1 " Delete empty space
let g:strip_whitelines_at_eof=1 " Delete last empty line
let g:strip_whitespace_confirm=0 " Dont ask
