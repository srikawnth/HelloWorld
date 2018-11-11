if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "\n"
      set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Complete.otf:h15
   endif
   set background=light
else
    set background=dark
endif
"************* Misc
set hidden
set showcmd
set backspace=indent,eol,start
set nostartofline
set laststatus=2
set t_vb=
set number
set cmdheight=2
set number
set ignorecase smartcase
set visualbell t_vb=
set title
set titlestring=%f
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent smartindent cindent

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'rking/ag.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'ryanoasis/vim-devicons'    
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin on    " required
filetype indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"**** Tab should complete till longest match and then list the files and then"
"**** cycle through them"
set wildmode=longest,list,full
set wildmenu    " visual autocomplete for command menu
set lazyredraw  " redraw only when we need to.
set showmatch   " highlight matching [{()}]
set incsearch   " search as characters are entered
set hlsearch    " highlight matches
set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\
set encoding=utf-8
set t_Co=256
set term=xterm-256color
set termencoding=utf-8
"let g:airline_powerline_fonts=1
syntax enable
"let g:solarized_termcolors=256
"let g:solarized_termtrans = 1
let g:airline_theme='laederon'

"colorscheme monokai
"colorscheme molokai
color dracula

hi clear VertSplit
hi VertSplit ctermfg=green ctermbg=black

" Easier window navigation
map <C-Up> <C-W>k
map <C-Down> <C-W>j
map <C-Right> <C-W>l
map <C-Left> <C-W>h
map <F2> :NERDTreeToggle<CR>

autocmd FileType cpp set commentstring=\/\/\ %s
autocmd FileType c set commentstring=\/\/\ %s

nnoremap tn  :tabnext<CR>
nnoremap tp  :tabprev<CR>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1

autocmd FileType python let &makeprg='/usr/local/bin/pylint %'
autocmd BufWritePost *.py make
autocmd FileType python let &makeprg='/usr/local/bin/pyflakes %'
autocmd BufWritePost *.py make

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" Try the following if your GUI uses a dark background.
let &colorcolumn="80,".join(range(120,999),",")
