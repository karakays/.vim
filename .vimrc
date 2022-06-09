let s:uname = system("echo -n $(uname -s)")

""" UI settings

" turn on relative line numbers
set number relativenumber

" enable access to system clipboard
if s:uname == "Darwin"
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

set encoding=utf-8

" break lines after 120 columns
set textwidth=120

" use 4 spaces to represent tab
set tabstop=4

set softtabstop=4

" number of spaces to use for auto-indent
set shiftwidth=4

" copy indent from current line when starting a new line
set autoindent

" use smart indent if there's no indent file
set smartindent

" enter "spaces" "when" tab is pressed
set expandtab

" toggle paste mode
set pastetoggle=<F10>                                   

" always show status bar
set laststatus=2

" visual auto-complete menu
set wildmenu

" swap directory
set directory=~/.vim/swap//

" backup directory
set backupdir=~/.vim/backup//

set history=200

" new vwin on right
set splitright

" new swin on below
set splitbelow

"set wildchar=<Tab> wildmenu wildmode=full

""" Colorscheme

syntax enable
set background=dark
" hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
" hi TabLine ctermfg=Blue ctermbg=Yellow
" hi TabLineSel ctermfg=Red ctermbg=Yellow
"
" Apply default highlights with autocmd whenever colorscheme is sourced
augroup DefaultColors
    autocmd!
    autocmd ColorScheme * highlight Search cterm=NONE ctermbg=Yellow ctermfg=Black ctermul=Red
                      \ | highlight IncSearch cterm=NONE ctermbg=Yellow ctermfg=Red ctermul=Black
                      \ | highlight Visual cterm=NONE ctermbg=159 ctermfg=16
augroup END

let g:solarized_termtrans=1

colorscheme desert

" Maintain default colors with ++nested flag
autocmd FileType java ++nested colorscheme zellner

""" Searching

" highlight searching
set hlsearch

" case insensitive searching
set ignorecase

" unless uppercase letters are used in the regex.
set smartcase

" enable incremental searching
set incsearch

" let &grepprg="grep -Iin $* /dev/null"

let &grepprg = 'rg -i --vimgrep'
let &grepformat = '%f:%l:%c:%m'

" detect file type and indent
filetype plugin indent on

" show title in console bar
set title

" indicate cursor line
set cursorline

set ruler

" lines of context around cursor position
set scrolloff=3

set viminfo+=n~/.vim/.viminfo

set updatetime=750

""" Mappings

nnoremap <Left>  <nop>
nnoremap <Right> <nop>
nnoremap <Up>    <nop>
nnoremap <Down>  <nop>

" scroll down/up
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>

" start/end of line
nnoremap 0 ^
nnoremap $ g_

" toggle mode
inoremap jk    <esc>
inoremap <esc> <nop>

" windows navigation
" nnoremap <C-J> <C-W>J
" nnoremap <C-K> <C-w>K
" nnoremap <C-L> <C-W>L
" nnoremap <C-H> <C-W>H

" Save
nnoremap s :w<CR>

" Quit
nnoremap q :q<CR>

" Soft quit
" nnoremap Q :q!<CR>

" Blank lines on enter
nnoremap <CR> o<esc>

" However, in the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" swap direction word occr
nnoremap * #
nnoremap # *

" open all folds
nnoremap zO zR

" tab mappings
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap t0  :tabfirst<CR>
nnoremap t9  :tablast<CR>
nnoremap tn  :tabedit<CR>
nnoremap tq  :tabclose<CR>

" copy to clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>

" paste
inoremap <C-v> :r !pbpaste<CR><CR>

" clear hlsearch
nnoremap <Space> :noh<CR><CR>

nnoremap D d$

" list marks
nnoremap ` :<C-u>marks<CR>:normal! `

""" Leader
let mapleader="\\"

nnoremap <leader>gr :silent execute "grep! " . shellescape(expand("<cword>")) . " ."<CR>:copen<CR>

" edit .vimrc
nnoremap <leader>ve :split $MYVIMRC<CR>
" source .vimrc and clear caches
nnoremap <leader>vs :source $MYVIMRC<CR> <Bar>:AirlineRefresh<CR> <Bar>:CtrlPClearAllCaches<CR> <Bar>:NERDTreeFocus<cr>gg:NERDTreeRefreshRoot<CR><c-w><c-p>

""" Syntax check
nnoremap <leader>C :SyntasticCheck<CR>

""" %% expands active directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%h').'/' : '%%'

" NERD Tree {{{
noremap  <leader>nt :NERDTreeToggle<CR>
inoremap <leader>nt <esc>:NERDTreeToggle<CR>
noremap  <leader>nf :NERDTreeFind<CR>
inoremap <leader>nf <esc>:NERDTreeFind<CR>

let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['\~$', '.*\.pyc$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let NERDTreeWinSize = 21

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

" }}}

" Python-Mode {{{
let g:pymode_rope = 0
let g:pymode = 0
" }}}

" Fugitive {{{
nnoremap <leader>g :Git<CR>
nnoremap <leader>gci :Gcommit<CR>

" }}}

""" Abbreviations
iabbrev @@ skarakayali@gmail.com
iabbrev nname Selçuk Karakayalı

autocmd InsertLeave * :echo 'Left insert mode'
" ctags
set tags=./tags;/

" set cursor based on mode
"if exists('$TMUX')
"  let &t_SI = "\ePtmux;\e\e[3 q\e\\"
"  let &t_EI = "\ePtmux;\e\e[0 q\e\\"
"else
"  let &t_SI = "\e[5 q"
"  let &t_EI = "\e[2 q"
"endif

let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
                 
" CtrlP settings ---------------------- {{{
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*.so,*.swp,*.class,*/public/*,*/target/*,*/build/*,*/.idea/*,*/.git/*.*/*.egg-info/*,*/.ropeproject/*
" search by filename rather than path
let g:ctrlp_by_filename = 1
" disable working directory auto-discovery
let g:ctrlp_working_path_mode = 0
" unlimited number of files to scan
let g:ctrlp_max_files = 0
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
" }}}

" Syntastic settings ---------------------- {{{
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
"let g:syntastic_mode_map={ 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_kotlin_checkers = ['ktlint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" }}}
"
" Airline settings ---------------------- {{{
let g:airline#extensions#tabline#enabled = 1"
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='base16_gruvbox_dark_hard'
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
