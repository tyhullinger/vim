filetype off
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

set number
set encoding=utf-8
set fileencoding=utf-8
set visualbell "don't beep at me
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set foldmethod=indent
set foldlevel=99
set laststatus=2 "Always show the statusline
set title "set terminal title to filename
set mouse=a "enable the mouse! at least in iterm
set splitright "create new vsplits to right instead of left by default
set splitbelow "create new splits to bottom instead of top
set ignorecase
set smartcase "case insensitive only when searching lowercase letters
set autoindent
set smartindent
set hidden "allow switch away from unsaved buffers
set smarttab
set clipboard=unnamed "y puts text in OS X clipboard

set expandtab "uses spaces instead of tabs
set tabstop=2
set softtabstop=2 "lets vim treat spaces as tabs
set shiftwidth=2 "When auto-indenting, indent by this much.
set wildignore+=*.pyc,*.aux,*.aux.bak,*.bbl,*.blg,*.log,*.out,*.toc,*.lof

" Python stuff. See http://www.vex.net/~x/python_and_vim.html
" to remove whitespace from end of lines when saving:
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set nosmartindent
autocmd FileType python set cursorcolumn

" PHP related stuff
set comments=sr:/*,mb:*,ex:*/
autocmd FileType php noremap &lt;C-L&gt; :!/usr/bin/env php -l %&lt;CR&gt;
autocmd FileType phtml noremap &lt;C-L&gt; :!/usr/bin/env php -l %&lt;CR&gt;

" set tabs to 2 spaces for ruby files
autocmd FileType ruby set shiftwidth=2

"temp directory for swap
set directory=/tmp//

" let 'W' work for save too:
cab W w

" fix terminal escape 
" https://wincent.com/blog/tweaking-command-t-and-vim-for-use-in-the-terminal-and-tmux
set ttimeoutlen=50
if &term =~ "xterm"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

" shortcuts for swapping splits
nmap <Leader>s <C-w>r
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
nmap <leader>a <Esc>:Ack!

" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" " cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	sys.path.insert(0, project_base_dir)
	activate_this = os.path.join(project_base_dir,
	'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

set statusline=
" shows the git repo you are working in
set statusline +=%{fugitive#statusline()}

" for NERDTree
"hi link treeDir Identifier
let NERDTreeMouseMode=3
let NERDTreeWinSize=25
map <Leader>n :NERDTreeToggle<CR>

" CtrlP customizations
nmap <leader>p :CtrlP<CR>
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll)$',
			\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
			\ }

" Folding and unfolding
map ,f :set foldmethod=indent<cr>zM<cr>
map ,F :set foldmethod=manual<cr>zR<cr>

"##############################################################################                                                                         
"" Easier split navigation                                                                                                                               
"##############################################################################                                                                         
"
"" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
"nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>

colorscheme relaxedgreen
