
" REFERENCE: CTERM COLORS
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


" --------------------------------
" Basic Configuration
" --------------------------------

" obviously...
set encoding=utf-8

" activate pathogen
execute pathogen#infect()

"augroup CursorLineFix
  "autocmd VimEnter,BufEnter,WinEnter * setlocal cursorline
"augroup end

" alt + right arrow : go to end of line
inoremap <a-right> <end>
nnoremap <a-right> <end>
" alt + left arrow : go to start of line
inoremap <a-left> <home>
nnoremap <a-left> <home>


" --------------------------------
" general display options
" --------------------------------

" enable syntax highlighting
syntax on

" customize highlighting
"hi javascriptIdentifier ctermfg=DarkMagenta

" Solarized color scheme
colorscheme solarized
set t_Co=16
let g:solarized_termcolors=16

" show line numbers
set number

" highlight current line
set cursorline
"hi CursorLine ctermbg=Black
nnoremap <kPlus> :set cursorline<cr>
inoremap <kPlus> :set cursorline<cr>

" show column highlight @ 80
set colorcolumn=80

" this is required after I compiled vim 7.4 from source, otherwise the
" backspace key doesn't work
set backspace=2

" ignore case in searches excepted if an uppercase letter is used
set ignorecase
set smartcase

" don't soft wrap lines
set nowrap


" --------------------------------
" whitespace characters
" --------------------------------

"set listchars=eol:↵,tab:⇥,trail:~,extends:⤵,precedes:⤷,nbsp:․
set listchars=eol:↵,tab:⇥\ ,extends:⤵,precedes:⤷,trail:•
set list

" NOTE: relevant highlight groups are found
" in either .vimrc-dark or .vimrc-light

" --------------------------------
" indentation
" --------------------------------

" enable file type detection for auto-indent
" @link http://vim.wikia.com/wiki/Indenting_source_code
filetype plugin indent on

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


" --------------------------------
" tabline
" --------------------------------

" tab navigation like firefox
nnoremap <S-tab> :tabprevious<CR>
nnoremap <tab>   :tabnext<CR>
nnoremap <c-t>     :tabnew<CR>
"inoremap <c-s-tab> <Esc>:tabprevious<CR>i
"inoremap <c-tab>   <Esc>:tabnext<CR>i
"inoremap <c-t>     <Esc>:tabnew<CR>

" always show tabs
set showtabline=2

" tabline colors
hi TabLine      cterm=none       ctermfg=Black  ctermbg=Green
hi TabLineFill  cterm=underline  ctermfg=Black  ctermbg=DarkGrey
hi TabLineSel   cterm=bold       ctermfg=White  ctermbg=DarkCyan
hi Title        cterm=none       ctermfg=Cyan   ctermbg=none

" --------------------------------
" --------------------------------
" plugin config/options
" --------------------------------
" --------------------------------

" NERDTree
" --------------------------------

" close vim if NERDTree is the only window left
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" bind key to open NERDTree
"nmap <F5> :NERDTreeToggle<CR>

" NERDTree-Tabs options:
" Open NERDTree on console vim startup
"let g:nerdtree_tabs_open_on_console_startup = 1

" Do not open NERDTree if vim starts in diff mode
"let g:nerdtree_tabs_no_startup_for_diff = 1

" On startup, focus NERDTree if opening a directory, focus file if opening a
" file. (When set to 2, always focus file window after startup)
"let g:nerdtree_tabs_smart_startup_focus = 1

" Automatically find and select currently opened file in NERDTree
"let g:nerdtree_tabs_autofind = 1


" vim-airline
" --------------------------------

" always show vim-airline
set laststatus=2

let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_iminsert=0
let g:airline_exclude_preview = 0
" enable airline's tabline
let g:airline#extensions#tabline#enabled = 1
" disable showing tab type (far right)
let g:airline#extensions#tabline#show_tab_type = 0
" configure whether close button should be shown
let g:airline#extensions#tabline#show_close_button = 0

" configure truncating non-active buffer names to specified length
"let g:airline#extensions#tabline#fnametruncate = 12

" configure collapsing parent directories in buffer name
"let g:airline#extensions#tabline#fnamecollapse = 0

" configure whether buffer numbers should be shown
let g:airline#extensions#tabline#buffer_nr_show = 0

" enable/disable displaying index of the buffer
let g:airline#extensions#tabline#buffer_idx_mode = 0

"let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#fnamemod = ':t'


" git-gutter
" --------------------------------

highlight GitGutterAdd ctermfg=DarkGreen
highlight GitGutterChange ctermfg=DarkYellow
highlight GitGutterDelete ctermfg=DarkRed
highlight GitGutterChangeDelete ctermfg=Red

let g:gitgutter_sign_added =                '⊕'
let g:gitgutter_sign_modified =             '⁂' "'✳'
let g:gitgutter_sign_removed =              '_'
let g:gitgutter_sign_removed_first_line =   '‾'
let g:gitgutter_sign_modified_removed =     '✳_'


" ctrl-p
" -------------------------------

"nmap <F6> :CtrlPMixed<CR>
"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<c-t>'],
"    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"  \ }


" unite
" -------------------------------

" enable history yank source
let g:unite_source_history_yank_enable = 1

" shorten the default update date of 500ms
let g:unite_update_time = 300

" highlight like my vim
let g:unite_cursor_line_highlight = 'CursorLine'

" set up coolguy arrow prompt
let g:unite_prompt = '➜ '

" highlight like my vim
let g:unite_cursor_line_highlight = 'CursorLine'

" use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])

" use ack in unite grep source.
if executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '-i --nogroup --no-color -H --ignore-dir=node_modules --ignore-dir=vendor'
  let g:unite_source_grep_recursive_opt = ''
endif

" set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ 'lib/Cake/',
      \ 'node_modules/',
      \ 'vendor/',
      \ 'Vendor/',
      \ 'app_old/',
      \ 'acf-laravel/',
      \ 'plugins/',
      \ 'bower_components/',
      \ '.sass-cache',
      \ 'web/wp',
      \ ], '\|'))

" KEY BINDINGS
nnoremap <leader>o :Unite file file_rec<cr>
nnoremap <leader>f :Unite grep:.<cr>
nnoremap <C-p> :Unite history/yank<cr>
nnoremap <leader>p :Unite history/yank<cr>

" custom mappings for unite buffer
augroup UniteSettings
  autocmd FileType unite call s:unite_settings()
augroup end

function! s:unite_settings()
  imap <buffer><expr> <tab> unite#do_action('tabopen')
  nmap <buffer><expr> <tab> unite#do_action('tabopen')
  "nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

call unite#custom#profile('default', 'context', {
  \ 'winheight' : 10,
  \ 'start_insert' : 1,
  \ 'prompt_visible': 1,
  \ 'marked_icon': '✓',
  \ })


" delimitMate
" -------------------------------

" expand CR
let delimitMate_expand_cr = 1

" expand spaces
let delimitMate_expand_space = 1


