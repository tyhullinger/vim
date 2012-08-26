set number
set nocompatible
set linebreak
" set showbreak=.... 
set encoding=utf-8
set fileencoding=utf-8
"set bomb "see help bomb for complications
set backspace=indent,eol,start
set cpoptions-=n
set showcmd
set ruler
set visualbell "don't beep at me
set display=lastline
set laststatus=2 "Always show the statusline
set title "set terminal title to filename
set mouse=a "enable the mouse! at least in iterm
set splitright "create new vsplits to right instead of left by default
set splitbelow "create new splits to bottom instead of top
"set scrolloff=3 "keep 3 lines context when scrolling
"searching
set wildmode=list:longest " for bash-like tab-completion
set showmatch
set magic "regex mode: http://stackoverflow.com/questions/1058246
set hlsearch
set incsearch "highlight search matches as you type
set ignorecase
set smartcase "case insensitive only when searching lowercase letters
set path+=** "use :find filename to open files in enclosing folders
set wildignore+=*.pyc,*.aux,*.aux.bak,*.bbl,*.blg,*.log,*.out,*.toc,*.lof
"indenting & tabs
set autoindent
set smartindent
set hidden "allow switch away from unsaved buffers
set smarttab
set clipboard=unnamed "y puts text in OS X clipboard
set expandtab "uses spaces instead of tabs
set tabstop=2
set softtabstop=2 "lets vim treat spaces as tabs
set shiftwidth=2 "When auto-indenting, indent by this much.
let g:indent_guides_start_level=2 "vim-indent-guides plugin
let g:indent_guides_guide_size=1 "vim-indent-guides plugin
map <Leader>g :IndentGuidesToggle<CR>
set scroll=1 "ctrl-d and crtl-u go down/up 1 line at a time
" for word-wrap:
"set formatoptions=l
"set lbr
"set formatoptions=tcroqan
"set backupcopy=yes  " Turn this on if crontab -e isn't working
                     " Update - added autocmd to do this instead
autocmd FileType crontab set backupcopy=yes

" always use command editing window
"nnoremap : q:i
" or try:
nnoremap q: q:i
"nnoremap / q/i
"nnoremap ? q?i

call pathogen#runtime_append_all_bundles() 

" when using ':sb' switch to tab if it's open
set switchbuf=usetab

" shortcuts for swapping splits
nmap <Leader>s <C-w>r
"nmap <Leader>h <C-w>H
"nmap <Leader>j <C-w>J

" Command-T
nnoremap <silent> <Leader>t :CommandT<CR>
"nnoremap <silent> <Leader>' :CommandTBuffer<CR>
" swap <CR> and <C-t> for command-t
"let g:CommandTAcceptSelectionMap = '<C-t>'
"let g:CommandTAcceptSelectionTabMap = '<CR>'
"
" Command-T experiment: turn off tabs
nnoremap <silent> <Leader>b :CommandTBuffer<CR>
nnoremap <silent> <Leader>j :CommandTJump<CR>
"let g:CommandTMaxFiles = 6000

" Buffergator
"let g:buffergator_suppress_keymaps = 1
"noremap <silent> <Leader>z :BuffergatorTabsOpen<CR>
"noremap <silent> <Leader>b :BuffergatorToggle<CR>
"let g:buffergator_viewport_split_policy = "T"
"let g:buffergator_split_size = 15
"let g:buffergator_display_regime = "bufname"
"let g:buffergator_sort_regime = "filepath"
"

" fix terminal escape 
" https://wincent.com/blog/tweaking-command-t-and-vim-for-use-in-the-terminal-and-tmux
set ttimeoutlen=50
if &term =~ "xterm"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

" for filetype-specific plugins
filetype plugin on

" blogvim stuff
let g:blogconfig = "~/.vim/bloginfo"
if !exists('*Wordpress_vim')
    runtime vimblog.vim
endif

"temp directory for swap
set directory=/tmp//

" Navigation mappings
map j gj
map k gk
" some handy emacs-style insert mode keybindings:
""imap <C-a> <Esc>g0i
""imap <C-e> <Esc>g$a
"imap <C-f> <Esc>f<Space>li
""imap <C-f> <Esc>la
"imap <C-b> <Esc>bi
""imap <C-b> <Esc>ha
"imap <C-d> <Esc>ldwi
"imap <C-k> <Esc>d$a

" autocomplete and dictionary
set dictionary=/usr/share/dict/words
set complete+=k

" let 'W' work for save too:
cab W w

" Syntax 
syntax enable

" switch to skinny cursor on insert,
" works in iterm, but kind of buggy
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" light bg in gui, dark in term
if has('gui_running')
  "set background=light
else
  "set background=dark
endif
set background=dark

" for NERDTree
"hi link treeDir Identifier
let NERDTreeMouseMode=3
let NERDTreeWinSize=25
map <Leader>n :NERDTreeToggle<CR>

" markdown folding
au FileType mkd syn region myMkdHeaderFold
        \ start="\v^\s*\z(\#{1,6})"
        \ skip="\v(\n\s*\z1\#)\@="
        \ end="\v\n(\s*\#)\@="ms=s-1,me=s-1
        \ fold contains=myMkdHeaderFold

au FileType mkd syn sync fromstart
au FileType mkd set foldmethod=syntax

" open file in Marked.app
nnoremap <leader>m :silent !open -a Marked.app %:p<cr>

" text wrapping
map \p mp<Esc>vipgq`p

" to enable openssl.vim backups:
let g:openssl_backup = 1 

" Folding
"set foldenable " Turn on folding
"set foldmethod=indent " Make folding indent sensitive
"set foldlevel=100 " Don't autofold anything 
"set foldopen-=search " Don't open folds when you search into them
"set foldopen-=undo " Don't open folds when you undo stuff
let php_folding = 1
let g:EnableFastPHPFolds = 0
let g:DisableAutoPHPFolding = 0
map zz za
au FileType php map zd <Esc>:DisablePHPFolds<Cr>
au FileType php map ze <Esc>:EnableFastPHPFolds<Cr>
au FileType php map zr <Esc>:DisablePHPFolds<Cr><Esc>:EnableFastPHPFolds<Cr>
" make latex folding match:
au FileType tex map ze \rf
" snipmate, use php and html (and cakephp) for php files
au BufRead,BufNewFile *.php set ft=php.cakephp.html
autocmd BufRead,BufNewFile *.ctp set filetype=php.cakephp.html

" sparkup/zen 
let g:sparkupExecuteMapping = "<c-z>"

"""" LaTeX mappings 
" to make sure all *.tex files are filetype=tex
let g:tex_flavor = "latex"
"" save and (re)load views automatically for latex files
"autocmd FileType tex,bib au BufWinLeave * mkview
"autocmd FileType tex,bib au BufWinEnter * silent loadview
"
"" enable semi-smart quotes for latex files, Ctrl-V to bypass
autocmd FileType tex,bib imap "<Space> ''<Space>
autocmd FileType tex,bib imap " ``
autocmd FileType tex,bib set timeoutlen=15000
"" run xelatex on file
autocmd FileType tex,bib map <D-S-l> :w<CR> :!/usr/texbin/pdflatex %<CR><CR>
autocmd FileType tex,bib map <D-S-b> :w<CR> :!/usr/texbin/bibtex %<CR><CR>
"" command mode shortcuts
autocmd FileType tex,bib map \b a\textbf{}<Esc>ba
autocmd FileType tex,bib map \e a<C-V>\emph{}<Esc>ba
autocmd FileType tex,bib map \w i{<Esc>ea}<Esc>
autocmd FileType tex,bib map \i i\begin<C-V>{itemize}<CR>\item <CR>\end<C-V>{itemize}<Esc>kA
autocmd FileType tex,bib map \k i\begin<C-V>{enumerate}<CR>\item <CR>\end<C-V>{enumerate}<Esc>kA
autocmd FileType tex,bib map \f a\footnote<C-V>{}<Esc>ba
"" insert mode autocompletes: (Turned off for now -- kind of annoying actually
"autocmd FileType tex,bib imap { {}<Esc>ba
"autocmd FileType tex,bib imap \emph \emph<C-V>{}<Esc>ba
"autocmd FileType tex,bib imap \bf \textbf<C-V>{}<Esc>ba
"autocmd FileType tex,bib imap \foot \footnote<C-V>{}<Esc>ba
"" insert mode control keys
"autocmd FileType tex,bib imap <F5> \begin<C-V>{itemize}<CR>\item <CR>\end<C-V>{itemize}<Esc>kA
"autocmd FileType tex,bib imap <C-K> \begin<C-V>{enumerate}<CR>\item <CR>\end<C-V>{enumerate}<Esc>kA
"autocmd FileType tex,bib imap <C-F> \footnote<C-V>{}<Esc>ba
"autocmd FileType tex,bib imap <C-B> \textbf<C-V>{}<Esc>ba
"autocmd FileType tex,bib imap <C-E> <C-V>\emph<C-V>{}<Esc>ba
" added for vim-latex suite
set grepprg=grep\ -nH\ $*
filetype indent on
" to turn off placeholders, uncomment this:
let g:Imap_UsePlaceHolders = 0

let g:Tex_Folding = 1
let g:Tex_AutoFolding = 1
let g:Tex_FoldedSections = "part,chapter,section,%%fakesection,subsection,subsubsection,paragraph"
let g:Tex_FoldedEnvironments = "verbatim,comment,eq,gather,align,figure,table,thebibliography,keywords,abstract,titlepage"
let g:Tex_FoldedMisc = "comments,item,preamble,<<<"

" HTML mappings
"" autocompletes:
"autocmd FileType html imap <b> <b></b><Esc>bba
"autocmd FileType html imap <i> <i></i><Esc>bba
"autocmd FileType html imap <ul> <ul><CR><C-V><li></li><CR></ul><Esc>5ba
"autocmd FileType html imap <li> <li></li><Esc>bba

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

" to read word files in vim
autocmd BufReadPre *.doc set ro
autocmd BufReadPost *.doc %!antiword "%"

" set tabs to 2 spaces for ruby files
autocmd FileType ruby set shiftwidth=2

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
 
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif


" bracketed paste mode
" see: http://stackoverflow.com/questions/5585129/pasting-code-into-terminal-window-into-vim-on-mac-os-x
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif


" see :h macvim-shift-movement for explanation:
    if has("gui_macvim")
		let macvim_hig_shift_movement = 1
	endif

" turn off toolbar mods by the HTML plugin
let g:no_html_menu = 'yes'

" Folding and unfolding
map ,f :set foldmethod=indent<cr>zM<cr>
map ,F :set foldmethod=manual<cr>zR<cr>

colorscheme vividchalk 
