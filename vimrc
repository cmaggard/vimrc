set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Themes
Plugin 'nanotech/jellybeans.vim'
Plugin 'brendonrapp/smyck-vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'Yggdroot/indentLine' " Shows vertical lines on indentations


" General-Use Plugins
Plugin 'wincent/command-t' " File Search
Plugin 'tpope/vim-fugitive' " Git
Plugin 'scrooloose/nerdcommenter' " Comment Toggling
Plugin 'majutsushi/tagbar' " CTags
Plugin 'bling/vim-airline' " Status Bar
Plugin 'mtth/scratch.vim' " Scratchpad

Plugin 'tpope/vim-endwise' "Auto-'end' bits for Ruby,Lua,C/C++
Plugin 'tmhedberg/matchit' " % Matching for HTML/XML/etc
Plugin 'tpope/vim-unimpaired' " General-use bracket mappings

Plugin 'sjl/vitality.vim' " iTerm2/Tmux niceties


" Language Support
Plugin 'kchmck/vim-coffee-script' " CoffeeScript
Plugin 'elixir-lang/vim-elixir' " Elixir
Plugin 'lambdatoast/elm.vim' " Elm
Plugin 'leafo/moonscript-vim' " MoonScript
Plugin 'cakebaker/scss-syntax.vim' " SCSS
Plugin 'tpope/vim-fireplace' " Clojure REPL
Plugin 'ledger/vim-ledger' " Ledger data files
Plugin 'plasticboy/vim-markdown' " Markdown
Plugin 'tpope/vim-ragtag' " XML/HTML
Plugin 'tpope/vim-rails' " Rails
Plugin 'tpope/vim-rake' " vim-rails for non-rails ruby projects
Plugin 'vim-ruby/vim-ruby' " Ruby
Plugin 'ecomba/vim-ruby-refactoring' " Ruby refactoring
Plugin 'slim-template/vim-slim' " Slim
Plugin 'skalnik/vim-vroom' " Rspec Test runner
Plugin 'vim-scripts/VimClojure' " Clojure


call vundle#end()
filetype plugin indent on


" Window setup

set autoindent
set backspace=indent,eol,start
"set cursorline
set expandtab
set hidden
set history=10000
set ignorecase smartcase
set number
set scrolloff=3
set shiftwidth=2
set showcmd
set smartcase
set smarttab
set t_ti= t_te=
set tabstop=2
set cmdheight=2
set switchbuf=useopen
set title
set wildmenu
set ruler
set wildmode=longest,list
"set winwidth=79
set hlsearch
set incsearch
syntax enable
autocmd FileType make		set noexpandtab
autocmd FileType python set shiftwidth=4
autocmd FileType python set softtabstop=4
autocmd FileType python set tabstop=4

set background=light
"colorscheme solarized
colorscheme jellybeans
set background=dark

" Set leader key
let mapleader = ","

"Map ESCAPE into something within reach
" (remap Caps-Lock to Control for maximum punch)
" Linux note: On linux, <C-Space> == <Nul>
if has('unix') && !has('gui_running')
    imap <Nul> <Esc>
    vmap <Nul> <Esc>
else
    imap <C-space> <Esc>
    vmap <C-space> <Esc>
endif

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif


set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_branch_prefix = '⎇ '
let g:airline_symbols#branch= '⎇ '
"let g:airline_branch_prefix = ' '
let g:airline_symbols#readonly= ''
"let g:airline_linecolumn_prefix = ' '
let g:airline_symbols#linenr = ' '


set foldmethod=indent
autocmd Syntax * normal zR

set backupdir=~/.vim/.backup,.,/tmp
set directory=.,~/.vim/.backup,/tmp

map <Leader>s :%s/\s\+$//<Enter><Enter>
map <leader>o :!open %<CR><CR>

" Command-T
map <leader>t <Esc>:CommandT<CR>
map <leader>T <Esc>:CommandTFlush<CR>
map <leader>m <Esc>:CommandTBuffer<CR>
map <leader>y "*y
"map <leader>z <Esc>:!rails runner %<CR>
" Rails ignores
set wildignore+=public/assets/*
set wildignore+=app/assets/fonts/*
set wildignore+=app/assets/images/*
set wildignore+=log/*
set wildignore+=tmp/*
set wildignore+=doc/*
set wildignore+=public/images/*
" Homeroom ignore
set wildignore+=public/course/*
set wildignore+=db/migrate/archive/*
set wildignore+=vendor/assets/bower_components/*
" Node ignore
set wildignore+=node_modules/*
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Can't be bothered to understand ESC vs <c-c> in insert mode
vmap <C-c> <Esc>
imap <C-c> <Esc>
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
nnoremap <leader><leader> <c-^>
set wildignore+=*.o,*.obj,.git,coverage
map <leader>w <Esc>:!powder restart<CR>

map <leader>c <Esc>:bp\|bd #<CR>

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
"function! InsertTabWrapper()
    "let col = col('.') - 1
    "if !col || getline('.')[col - 1] !~ '\k'
        "return "\<tab>"
    "else
        "return "\<c-p>"
    "endif
"endfunction
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>


" 120-col gutter
if exists('+colorcolumn')
  "set colorcolumn=121
  "let &colorcolumn=join(range(81,999),",")
  "let &colorcolumn="80,".join(range(120,999),",")
  "let &colorcolumn="80,120,200"
  let &colorcolumn="120,200"
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
"hi ColorColumn ctermbg=233 guibg=#1c1c1c


" vitality.vim
"let g:vitality_fix_cursor = 0
let g:vitality_fix_focus = 0

" vim-vroom
let g:vroom_use_bundle_exec=1
map <leader>f :VroomRunTestFile<cr>
map <leader>F :VroomRunNearestTest<cr>
let g:vroom_clear_screen=0
"map <leader>a :VroomRunTests('')<cr>:

" vim-ruby-refactoring
let g:ruby_refactoring_map_keys=0

cnoremap %% <C-R>=expand('%:h').'/'<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass 

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Indent p tags
  autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()
augroup END

if exists('$TMUX')
  let &t_SI = "\<Esc>[3 q"
  let &t_EI = "\<Esc>[0 q"
endif

" RENAME CURRENT FILE
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
nnoremap <leader>a :cp<cr>
nnoremap <leader>s :cn<cr>

" ctags
"let g:tagbar_ctags_bin='/usr/local/bin/ctags'
"let g:tagbar_width=26
"let g:tagbar_usearrows = 1
noremap <silent> <leader>d :TagbarToggle<CR>


" indentLine
"let g:indentLine_color_term = 235
"let g:indentLine_color_gui = '#CCCCCC'

" Split keymappings
set splitbelow
set splitright
nnoremap <M-right> <C-w>l
nnoremap <M-left> <C-w>h
nnoremap <M-down> <C-w>j
nnoremap <M-up> <C-w>k
nnoremap <M-,> :split<CR><C-w>j " Horizontal split
nnoremap <M-.> :vsplit<CR><C-w>l " Vertical split
nnoremap <M-/> :close<CR>
nnoremap <M-<> <C-w>K " Convert vertical to horizontal split
nnoremap <M->> <C-w>L " Convert horizontal to vertical split
"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k
"nnoremap <c-h> <c-w>h
"nnoremap <c-l> <c-w>l




let g:html_indent_tags = 'nav'

set list
set listchars=tab:»·,trail:·

augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

"if executable('coffeetags')
  "let g:tagbar_type_coffee = {
        "\ 'ctagsbin' : 'coffeetags',
        "\ 'ctagsargs' : '--include-vars',
        "\ 'kinds' : [
        "\ 'f:functions',
        "\ 'o:object',
        "\ ],
        "\ 'sro' : ".",
        "\ 'kind2scope' : {
        "\ 'f' : 'object',
        "\ 'o' : 'object',
        "\ }
        "\ }
"endif
