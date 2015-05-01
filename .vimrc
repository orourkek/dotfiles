
" CTERM COLORS
" --------------------------------
"
" NR-16   NR-8    COLOR NAME
" 0       0       Black
" 1       4       DarkBlue
" 2       2       DarkGreen
" 3       6       DarkCyan
" 4       1       DarkRed
" 5       5       DarkMagenta
" 6       3       Brown, DarkYellow
" 7       7       LightGray, LightGrey, Gray, Grey
" 8       0*      DarkGray, DarkGrey
" 9       4*      Blue, LightBlue
" 10      2*      Green, LightGreen
" 11      6*      Cyan, LightCyan
" 12      1*      Red, LightRed
" 13      5*      Magenta, LightMagenta
" 14      3*      Yellow, LightYellow
" 15      7*      White

" Basic Configuration
" --------------------------------
set encoding=utf-8

" activate pathogen
execute pathogen#infect()

" enable syntax highlighting
syntax on

filetype plugin indent on

" show line numbers
set number

" highlight current line
set cursorline

" show whitespace characters
"set listchars=eol:↵,tab:⇥,trail:~,extends:⤵,precedes:⤷,nbsp:․
set listchars=tab:⇥\ ,extends:⤵,precedes:⤷,trail:␣
set list

" size of a hard tabstop
set tabstop=2
" size of an "indent"
set shiftwidth=2
" a combination of spaces and tabs are used to simulate tab stops at a width other than the (hard)tabstop
set softtabstop=2
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
" always uses spaces instead of tab characters
set expandtab
" This is required after I compiled vim 7.4 from source, otherwise the
" backspace key doesn't work
set backspace=2

" whitespace highlight group settings
highlight SpecialKey cterm=none ctermfg=1 ctermbg=0
highlight NonText ctermfg=1 ctermbg=1 guifg=red


" NERDTree
" --------------------------------

" open NERDTree when vim starts up (& switch to other pane)
" autocmd vimenter * NERDTree | wincmd p
" close vim if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" bind tilde "~" to open NERDTree
nmap <F5> :NERDTreeToggle<CR>


" Solarized color scheme
" --------------------------------

set background=dark
colorscheme solarized
set t_Co=16
let g:solarized_termcolors=16


" vim-airline
" --------------------------------

let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_iminsert=0
let g:airline_exclude_preview = 0
" always show vim-airline
set laststatus=2


" git-gutter
" --------------------------------

highlight GitGutterAdd guifg=#22dd22 guibg=NONE ctermfg=2 ctermbg=0
highlight GitGutterChange guifg=#dddd22 guibg=NONE ctermfg=3 ctermbg=0
highlight GitGutterDelete guifg=#dd2222 guibg=NONE ctermfg=1 ctermbg=0
highlight GitGutterChangeDelete guifg=#dd2222 guibg=NONE ctermfg=1 ctermbg=0

let g:gitgutter_sign_added =                '⊕'
let g:gitgutter_sign_modified =             '⁂' "'✳'
let g:gitgutter_sign_removed =              '_'
let g:gitgutter_sign_removed_first_line =   '‾'
let g:gitgutter_sign_modified_removed =     '✳_'


" ctrl-p
" -------------------------------

nmap <F6> :CtrlPMixed<CR>
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
  \ }

" vim-indent-guides
" --------------------------------

