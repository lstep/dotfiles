call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'

Plug 'ervandew/supertab'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
map <C-n> :NERDTreeToggle<CR>

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'majutsushi/tagbar'
let g:tagbar_usearrows = 1
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

Plug 'tpope/vim-fugitive'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

Plug 'myusuf3/numbers.vim'
nnoremap <F5> :NumbersToggle<CR>

Plug 'fatih/vim-go'
autocmd FileType go setlocal tabstop=4
let g:go_fmt_command = "goimports"
"let g:go_fmt_autosave = 0
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <Leader>e <Plug>(go-rename)

if has("autocmd")
    augroup skeleton
        au!
        au BufNewFile *.sh   silent! 0r ~/.nvim/skel/sh
        au BufNewFile *.zsh  silent! 0r ~/.nvim/skel/zsh
        au BufNewFile *.py   silent! 0r ~/.nvim/skel/python
        au BufNewFile *.rb   silent! 0r ~/.nvim/skel/ruby
        au BufNewFile *.html silent! 0r ~/.nvim/skel/html
        au BufNewFile *.go silent! 0r ~/.nvim/skel/go
        au BufNewFile *.c,*.cc,*.cxx,*.cpp silent! 0r ~/.nvim/skel/cc
        au BufNewFile *.h,*.hh,*.hxx,*.hpp silent! 0r ~/.nvim/skel/hh
    augroup end
    au BufNewFile * exe "normal G"
endif


" Colorscheme
set background=dark
""""Plug 'fatih/molokai'
"Plug 'morhetz/gruvbox'
let g:gruvbox_italic=0
Plug 'w0ng/vim-hybrid'

"Plug 'flazz/vim-colorschemes' 


call plug#end()

" General
""set number
filetype indent plugin on
syntax on
let g:go_disable_autoinstall = 0
set nowrap
set expandtab         " use spaces instead of tabstops
set smarttab          " use shiftwidth when hitting tab instead of sts (?)
set autoindent        " try to put the right amount of space at the beginning of a new line
set shiftwidth=4
set softtabstop=4
set splitbelow        " when splitting, cursor should stay in bottom window
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
au FocusLost    * :silent! wall
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


" To run AFTER plug#end
" colorscheme 256-jungle
""color gruvbox
colorscheme hybrid

scriptencoding utf8
set encoding=utf8 fileencoding=utf8 termencoding=utf8 nobomb

let mapleader=','
set nobackup nowritebackup noswapfile

if has('persistent_undo')
      set undofile                "so is persistent undo ...
      set undodir=~/.nvim/.undo
      set undolevels=1000         "maximum number of changes that can be undone
      set undoreload=10000        "maximum number lines to save for undo on a buffer reload
endif

" Key mappings
set pastetoggle=<F2>
nmap <F8> :TagbarToggle<CR>

