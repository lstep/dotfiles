" Don't use abbreviations!  Spelling things out makes grepping easy.
" After installing this .vimrc, run vim-update-bundles to install the
" plugins: https://github.com/bronson/vim-update-bundles
" curl -s " https://raw.github.com/bronson/vim-update-bundles/master/vim-update-bundles " | ruby

set nocompatible
set shortmess=atl
"set mouse=a " bah, mouse in every situation
set termencoding=utf-8
set pastetoggle=<F2>
filetype on   " work around stupid osx bug
filetype off

set undodir=~/.vim/tmp
set undofile
set undolevels=1000
set updatetime=1500
set virtualedit=block
set nowritebackup

" Use Vundle to manage runtime paths
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Tell Vim to ignore BundleCommand until vundle supports it
com! -nargs=? BundleCommand
Bundle 'https://github.com/gmarik/vundle'


filetype indent plugin on
syntax on


set encoding=utf-8 fileencodings= " use utf8 by default
set showcmd           " show incomplete cmds down the bottom
set showmode          " show current mode down the bottom
set report=0          " always report # of lines changed

set incsearch         " find the next match as we type the search
set hlsearch          " hilight searches by default
set nowrap            " by default, dont wrap lines (see <leader>w)
set showmatch         " briefly jump to matching }] when typing
set nostartofline     " don't jump to start of line as a side effect (i.e. <<)

set scrolloff=3       " lines to keep visible before and after cursor
set sidescrolloff=7   " columns to keep visible before and after cursor
set sidescroll=1      " continuous horizontal scroll rather than jumpy

set laststatus=2      " always display status line even if only one window is visible.
set updatetime=1000   " reduce updatetime so current tag in taglist is highlighted faster
set autoread          " suppress warnings when git,etc. changes files on disk.
set autowrite         " write buffers before invoking :make, :grep etc.
set nrformats=alpha,hex " C-A/C-X works on dec, hex, and chars (not octal so no leading 0 ambiguity)

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.pyc "stuff to ignore when tab completing

set backspace=indent,eol,start "allow backspacing over everything in insert mode
set history=1000               "store lots of :cmdline history

set hidden          " allow buffers to go into the background without needing to save

let g:is_posix = 1  " vim's default is archaic bourne shell, bring it up to the 90s.

set visualbell      " don't beep constantly, it's annoying.
set t_vb=           " and don't flash the screen either (terminal anyway...
set guioptions-=T   " hide gvim's toolbar by default
" set guifont=Inconsolata\ Medium\ 10
" set guifont=* to bring up a font selector, set guifont? to see result

" search for a tags file recursively from cwd to /
set tags=.tags,tags;/

" Store swapfiles in a single directory.
set directory=~/.vim/swap,~/tmp,/var/tmp/,tmp



" indenting, languages

set expandtab         " use spaces instead of tabstops
set smarttab          " use shiftwidth when hitting tab instead of sts (?)
set autoindent        " try to put the right amount of space at the beginning of a new line
set shiftwidth=4
set softtabstop=4
set splitbelow        " when splitting, cursor should stay in bottom window

" Folding settings
"set foldcolumn=0
set nofoldenable
"set foldlevel=0
"set foldmethod=marker
"set foldtext=FoldText()

" Tab navigation with ctrl + key
nnoremap <S-Left> :tabp<CR>
nnoremap <S-Right> :tabn<CR>
inoremap <S-Left> :tabp<CR>
inoremap <S-Right> :tabn<CR>


" autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
" include ! and ? in Ruby method names so you can hit ^] on a.empty?
"autocmd FileType ruby setlocal iskeyword+=!,?

" TODO? Turn on jquery syntax highlighting in jquery files
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


" TODO?  save: marks from '10 files, "100 lines in each register
"  :20 lines of command history, % the bufer list, and put it all in ~/.viminfo
" set viminfo='10,\"100,:20,%,n~/.viminfo

" wish I could make mapleader be space but vim waits for a second
" every time you hit the space key.
" <Plug>DiscretionaryEnd
let mapleader=" "


" fixes

" Make the escape key bigger, keyboards move it all over.
map <F1> <Esc>
imap <F1> <Esc>

" <C-L> redraws the screen and also turns off highlighting the current search
" NO, it conflicts with moving to different windows.
" nnoremap <C-L> :nohlsearch<CR><C-L>

" add a keybinding to toggle paste mode
nnoremap <leader>p :set paste!<CR>:set paste?<CR>

" make ' jump to saved line & column rather than just line.
" http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

" make Y yank to the end of the line (like C and D).  Use yy to yank the entire line.
" Upside: feels more natural.  Downside: not stock vi/vim.
nmap Y y$

" don't complain on some obvious fat-fingers
nmap :W :w
nmap :W! :w!
nmap :Q :q
nmap :Q! :q!
nmap :Qa :qa
nmap :Wq! :wq!
nmap :WQ! :wq!

" Make the quickfix window wrap no matter the setting of nowrap
autocmd BufWinEnter * if &buftype == 'quickfix' | setl wrap | endif
" 'q' inside quickfix window closes it (like nerdtree, bufexplorer, etc)
autocmd BufWinEnter * if &buftype == 'quickfix' | map q :cclose<CR> | endif


" quicker to navigate the quickfix window, just control-n, control-p
nmap <silent> <C-n> :cn<CR>
nmap <silent> <C-p> :cp<CR>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nmap <F6> <C-W>w

" Plugins:

Bundle 'myusuf3/numbers.vim'
nnoremap <F5> :NumbersToggle<CR>

"Bundle 'https://github.com/Lokaltog/powerline'
"let g:Powerline_symbols='fancy'
"set laststatus=2

Bundle 'bling/vim-airline'
if !exists('g:airline_symbols')
       let g:airline_symbols = {}
   endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"Bundle 'bling/vim-bufferline'

autocmd FileType go setlocal tabstop=4
Bundle 'https://github.com/fatih/vim-go.git'
Bundle 'https://github.com/Blackrush/vim-gocode'
Bundle 'https://github.com/Valloric/YouCompleteMe.git'
au BufRead,BufNewFile *.go set filetype=go
au BufWritePost *.go silent! !ctags -R &
let g:go_fmt_command = "goimports"

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)


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

let g:tagbar_width = 50

Plugin 'marijnh/tern_for_vim'

Bundle 'sunetos/vim-session'
Bundle 'xolox/vim-misc'

let g:session_autosave = 0
let g:session_autosave_periodic = 5


" JAVASCRIPT
"Bundle 'https://github.com/Shutnik/jshint2.vim'
Bundle 'https://github.com/moll/vim-node'
Bundle 'mustache/vim-mustache-handlebars'
let g:mustache_abbreviations = 1

Bundle 'https://github.com/Lokaltog/vim-easymotion'


Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\.orig$']
nmap <F3> :NERDTreeToggle<cr>
nmap <Space>D :NERDTreeFind<cr>

Bundle 'https://github.com/scrooloose/nerdcommenter'
" Use Control-/ to toggle comments
map <C-/> <plug>NERDCommenterToggle<CR>
" And Command-/ works on the Mac
map <D-/> <plug>NERDCommenterToggle<CR>
" And C-/ produces C-_ on most terminals
map <C-_> <plug>NERDCommenterToggle<CR>

"Bundle 'https://github.com/tpope/vim-surround'
"autocmd VimEnter * xunmap s

Bundle 'groenewege/vim-less'

Bundle 'https://github.com/majutsushi/tagbar'
nmap <F4> :TagbarToggle<cr>

"Bundle 'https://github.com/vim-scripts/bufexplorer.zip'
"nmap <Space>b :BufExplorer<cr>

Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'

Bundle 'https://github.com/vim-scripts/IndexedSearch'
Bundle 'Jinja'

"Bundle 'https://github.com/nvie/vim-flake8'
"let g:flake8_max_line_length=99
"autocmd BufWritePost *.py call Flake8()

"Bundle 'klen/python-mode'
" Disable pylint checking every save
let g:pymode_lint_write = 1
" Set key 'R' for run python code
let g:pymode_run_key = 'R'
" Load show documentation plugin
let g:pymode_doc = 1
" Key for show python documentation
let g:pymode_doc_key = 'K'
" Run linter on the fly
let g:pymode_lint_onfly = 1
" Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 0
" Show error message if cursor placed at the error line
let g:pymode_lint_message = 1
" Place error signs
let g:pymode_lint_signs = 1
" Set default pymode python indent options
let g:pymode_options_indent = 1
" Set default pymode python other options
let g:pymode_options_other = 1


" indent text objects: ai, ii, (include line below) aI, iI
"   ai,ii work best for Python, aI,II work best for Ruby/C/Perl
Bundle 'https://github.com/michaeljsmith/vim-indent-object'

Bundle 'https://github.com/godlygeek/tabular'

"Bundle 'https://github.com/tpope/vim-endwise'

Bundle 'https://github.com/tpope/vim-fugitive'
" TODO: this prompt seems to cause huge delays with big repos on MacOS X
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
"set statusline=%F%h%m%w%r\ %Y\ (%{&ff})%=\ %c%V,\ %l/%L\ (%P)

Bundle 'https://github.com/bronson/vim-trailing-whitespace'

""Bundle 'https://github.com/Raimondi/YAIFA'
" verbosity=1 allows you to check YAIFA's results by running :messages
""let g:yaifa_verbosity = 1

Bundle 'ZenCoding.vim'
let g:user_zen_expandabbr_key='<C-e>'

" Syntax Files:
Bundle 'https://github.com/scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_lis=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_exec = 'flake8-python2'
"let g:syntastic_python_checker_args='--ignore=E501'
let g:syntastic_python_checker_args='--max-line-length=99'

"Bundle 'https://github.com/bronson/Arduino-syntax-file'
"""Bundle 'https://github.com/pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'https://github.com/nathanaelkane/vim-indent-guides'
Plugin 'https://github.com/othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'underscore,angularjs,angularui,jasmine'

Plugin 'https://github.com/digitaltoad/vim-jade'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Bundle 'https://github.com/vim-scripts/jQuery'
Bundle 'https://github.com/tpope/vim-git'
" TODO: should move back to hallison or plasticboy markdown when they pick up new changes
Bundle 'https://github.com/gmarik/vim-markdown'
Bundle 'https://github.com/kchmck/vim-coffee-script'

Bundle 'Shougo/unite.vim'
Bundle 'alpaca-tc/vim-unite-watson.vim'
Bundle 'terryma/vim-multiple-cursors'


" Color Schemes:
" To enable 256 colors in vim
set t_Co=256
" Bundle 'molokai'
" colors molokai

"Bundle 'https://github.com/flazz/vim-colorschemes'
Bundle 'https://github.com/chriskempson/base16-vim'

Bundle 'nanotech/jellybeans.vim'
colors jellybeans

if has("autocmd")
    augroup skeleton
        au!
        au BufNewFile *.sh   silent! 0r ~/.vim/skel/sh
        au BufNewFile *.zsh  silent! 0r ~/.vim/skel/zsh
        au BufNewFile *.py   silent! 0r ~/.vim/skel/python
        au BufNewFile *.rb   silent! 0r ~/.vim/skel/ruby
        au BufNewFile *.html silent! 0r ~/.vim/skel/html
        au BufNewFile *.c,*.cc,*.cxx,*.cpp silent! 0r ~/.vim/skel/cc
        au BufNewFile *.h,*.hh,*.hxx,*.hpp silent! 0r ~/.vim/skel/hh
    augroup end
    au BufNewFile * exe "normal G"
endif

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
au FocusLost    * :silent! wall

Bundle 'https://github.com/Valloric/MatchTagAlways.git'
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'template' : 1, 'jinja' : 1, }

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

" Specific tabs
"""autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
let g:indent_guides_auto_colors = 0

hi! IndentGuidesOdd  ctermbg=black
hi! IndentGuidesEven ctermbg=darkgrey
