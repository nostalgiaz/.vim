" Vundle and bundles configuration
source ~/.vim/bundles.vim

" Syntax highlighting and color scheme
syntax enable

set showcmd
set autowrite                       " save a file when switching to another
set number                          " enable line numbers
nmap j gj
nmap k gk
set scrolloff=3

" solarized
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
  let g:solarized_termcolors=256
  color solarized                 " Load a colorscheme
endif
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
set showmode                    " Display the current mode

set cursorline                  " Highlight current line

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Sensible splits
set splitbelow
set splitright

" White space
set nowrap                          " don't wrap lines
set expandtab                       " expand tabs to spaces
set tabstop=2 shiftwidth=2          " a tab is 2 spaces
                                    " unless overridden by plugin
set autoindent                      " infer identation from near lines
set backspace=indent,eol,start      " backspace through everything in insert

set mouse=a

" Searching
set incsearch                       " incremental search
set ignorecase                      " ignore the case
set smartcase                       " unless search terms contain a capital

" Syntax checking
let g:syntastic_quiet_warnings=1    " don't display warinigs, only errors
let g:syntastic_check_on_open=1
let g:syntastic_python_checker="flake8"

" Tweaking autocompletion (Wildmenu)
if has("wildmenu")
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildmenu
    set wildmode=longest,list
endif

" backup to ~/.tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" Make vim position the cursor at the old position when reopening a file
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END
