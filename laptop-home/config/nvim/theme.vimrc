"Fix terminal colors
set t_Co=256
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark ='hard'
colorscheme gruvbox

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline_formatter='unique_tail'
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline_powerline_fonts=1
let g:airline_theme='deus'
