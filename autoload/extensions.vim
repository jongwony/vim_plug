set nocompatible
filetype off

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'tmhedberg/SimpylFold'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'python-mode/python-mode'
Plug 'sheerun/vim-polyglot'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'ferrine/md-img-paste.vim'

call plug#end()
filetype plugin indent on

set nu
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set clipboard=unnamed
set mouse=a
set backspace=indent,eol,start
set hlsearch
set cursorcolumn
set shell=zsh\ -l
set nowrap
set splitbelow
set splitright
set completeopt=menuone,noinsert

" Spell bad check
set spell spelllang=en_us
highlight clear SpellBad
highlight SpellBad cterm=underline
highlight BadWhitespace ctermbg=red guibg=darkred

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" onehalf
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'


" Enable folding with the spacebar
nnoremap <space> za

"python-mode :help pymode
let g:pymode_rope = 1
let g:pymode_rope_goto_definition_bind = 'gd'
let g:pymode_rope_rename_module_bind = '<C-r>r'
let g:pymode_syntax = 1

let g:pymode_rope_completion = 1
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_complete_on_dot = 1

" AutoComplete
"let g:ycm_autoclose_preview_window_after_completion=1
"nmap K :YcmCompleter GetDoc<CR>


" NERDTree
" let g:NERDTreeDirArrowExpandable = '>'
" let g:NERDTreeDirArrowCollapsible = 'v'
"let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules']
"map <C-t> :NERDTreeToggle<CR>

" FZF
"map <C-]> :FZF<CR>

" copy all and quit
"nmap cpq :%y+ <Bar> :q!<CR>

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile,CursorMoved * match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.html,*.css,*.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.md
    \ set noswapfile |
    \ set autoread

au FileType markdown map <C-p> :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = '__images'
"let g:mdip_imgname = 'static/images'

au FocusGained,CursorHold,CursorMoved *.md checktime
au BufEnter,CursorHoldI,CursorMovedI *.md update

au FileType python set equalprg=autopep8\ -
au FileType sql set equalprg=sqlformat\ -r\ -k\ upper\ -
" http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
au Filetype python call TextEnableCodeSnip('sql', "'''", "'''", 'SpecialComment')

function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
    let ft=toupper(a:filetype)
    let group='textGroup'.ft
    if exists('b:current_syntax')
        let s:current_syntax=b:current_syntax
        " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
        " do nothing if b:current_syntax is defined.
        unlet b:current_syntax
    endif
    execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
    try
        execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
    catch
    endtry
    if exists('s:current_syntax')
        let b:current_syntax=s:current_syntax
    else
        unlet b:current_syntax
    endif
    execute 'syntax region textSnip'.ft.'
                \ matchgroup='.a:textSnipHl.'
                \ start="'.a:start.'" end="'.a:end.'"
                \ contains=@'.group
endfunction

