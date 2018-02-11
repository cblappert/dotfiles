set nocompatible              " be iMproved, required
filetype off                  " required

" Initialize VimPlug
" ----------------------------------
call plug#begin('~/.vim/bundle')
" Vim Plug
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-syntastic/syntastic'
Plug 'craigemery/vim-autotag'
Plug 'flowtype/vim-flow'
call plug#end()


" Now Perform The Installation Check:
" ----------------------------------
let everythingInstalled = !len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
if everythingInstalled || 2==confirm("Download and Install Plugins (Restart Afterwards To Take Effect)?", "&Yes\n&No", 1)
  " Place all the rest of your `~/.vimrc` config HERE!
else
  autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | echomsg "Restart Vim Now!" | let xx=confirm("Restart For Plugins to Take Effect.")
    \| endif
endif

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')

" set colors
syntax enable
set background=dark
colorscheme solarized

" AirlineTheme solarized if refresh needed
let g:airline_solarized_bg='dark'

" Airline
" show open buffers

" ctrlp
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
 \ 'dir': '\v[\/](\.(git|hg|svn)|\_site)$',
 \ 'file': '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$',
 \}

" remap some keys
nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
" Buffer remaps
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<cr>

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_javascript_checkers = ['eslint', 'flow']

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" tab config
set shiftwidth=2 " the distance to shift text when using < and >
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in tab while editing
set expandtab " tabs are spaces
set autoindent " when making a new line, preserve the indentation from the previous line

" UI Config
set number " line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line

filetype indent on " lode filetype specific indent files
" add to ~/.vim/indent/LANGUAGE.vim

set wildmenu " visual autocomplete for command menu
set wildmode=longest,list,full
set lazyredraw " redraw only when necessary (fast macros)
set showmatch " highlight matching braces
set incsearch " search as characters entered
set hlsearch " highlight matches
":highlight Search ctermfg=White ctermbg=Green

nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight with \<space>

" Folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " max nesting level
" open/close folds with za
set foldmethod=indent " fold based on indent level

" Movement
" move by visual line not wrapped line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`] 


" load .bashrc when executing commands
:set shellcmdflag=-ic

" sets colors to cater to a dark background
:set background=dark

" start scrolling when the cursor gets within 3 lines of the top or bottom of
" the screen
:set scrolloff=3
" don't jump to the start of line when jumping to a new location
:set nostartofline

" info bar at bottom of screen
:set ruler

" makes the formatter use a line length limit of 80, rather than the width of
" the screen
:set textwidth=80

" when formatting text:
" r = insert comment header in newlines in insert mode
" o = insert comment header in newlines when using o or O
" q = allow formatting of comments with gq
" l = don't break long lines in insert mode
" j = remove comment header when joining
:set formatoptions=roql
:autocmd BufEnter * set formatoptions=roql

" TODO put this in a ftplugin file
:autocmd FileType ocaml setlocal comments=s1:(*,mb:*,ex:*)

" when splitting the screen, put the new window at the bottom
:set splitbelow

" when splitting the screen vertically, put the new window at the right
:set splitright

" always display the filename bar
:set laststatus=2

" disable the audible warning bell
:set visualbell

" disable the visual bell
:set t_vb=

" allow the mouse to be used
:set mouse=a

" set enter to make a new line below the current line without entering insert
" mode, and set space to do the same except on the line above the current line
" :nnoremap <Enter> o
" :nnoremap <Space> O
" :nnoremap  :syntax sync fromstart<CR>

" Make shift-K act as just k, instead of doing whatever obnoxious thing it
" usually does.
" :nmap K k

" use control-e for changing windows, as well as control-w
" :nmap <C-e> <C-w>

" saves all buffers before a make. executes make silently -- that is, don't
" prompt before re-entering the vim buffer. Because doing that messes up the
" screen, redraw with CTRL+L
" :cabbrev make wa <BAR> silent make <BAR> :normal 

" wsh saves and opens a shell
" :cabbrev wsh w <BAR> sh

" turn spelling on and off
" :cabbrev ss set spell
" :cabbrev sns set nospell

" set X to delete the contents of a line without deleting the line itself,
" instead of deleting the character to the left of the cursor.
" :nnoremap X 0d$

" as of vim 7.4 this seems to be needed in order to backspace through whitespace
" at the beginning of a line
" set backspace=indent,eol,start

" set the contents of the "r register to a ruler at startup
" :let @r="--------------------------------------------------------------------------------"

" set the contents of the t register to add todo boxes
" :let @t='{j}kI[ ] {jV}k:s/\[ \] \[/[/
" :noh


" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
au ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" make the 81st column dark gray
set colorcolumn=81
highlight ColorColumn ctermbg=DarkGray

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

" configure syntax highlighting for thrift
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/syntax/thrift.vim

au BufRead,BufNewFile *.ru set filetype=ruby

" use only a single space when joining lines
set nojoinspaces

inoremap <C-h> <C-n>
inoremap <S-Tab> <Esc>

