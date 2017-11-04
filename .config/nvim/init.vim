"  _____         _____ _
" |   | |___ ___|  |  |_|_____
" | | | | -_| . |  |  | |     |
" |_|___|___|___|\___/|_|_|_|_|
"
" Plugins:
" -----------------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugins')
" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Hierarchy Tree starting from current directory.
Plugin 'scrooloose/nerdtree'

" Base16 colorschemes:
Plugin 'chriskempson/base16-vim'

" Limelight
Plugin 'itchyny/lightline.vim'

" ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim and Vim 8 while you edit your text files.
Plugin 'w0rp/ale'

"Plugin 'neomake/neomake'

" shows a git diff in the 'gutter'
Plugin 'airblade/vim-gitgutter'

" A collection of language packs for Vim.
Plugin 'sheerun/vim-polyglot'

" fuzzy search
"Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" golang support
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" This is a fast, extensible, async completion framework for neovim.
Plugin 'roxma/nvim-completion-manager'

" async markdown preview
"Plugin 'euclio/vim-markdown-composer'
" formater for markdown
"Plugin 'moorereason/vim-markdownfmt'

" syntax for ansible
"Plugin 'pearofducks/ansible-vim'

" a universal set of defaults
"Plugin 'tpope/vim-sensible'

" automatically adjusts 'shiftwidth' and 'expandtab'
"Plugin 'tpope/vim-sleuth'

" An autocompletion daemon for the Go programming language
Plugin 'nsf/gocode'

call vundle#end()

" Settings
"
syntax on

" ====================================================================
" Be (Vim)proved, required from Vundle
" ====================================================================
set nocompatible
filetype off

" Set SPACE as the leader-key.
let mapleader = " "

filetype plugin indent on
" =============================================================
" Colorscheme
" =============================================================
let base16colorspace=256  	" Access colors present in 256 colorspace
set background=dark         " Use dark theme
colorscheme base16-unikitty-dark " Enable base16 theme
let g:rehash256 = 1

" =============================================================
" Clipboard
" =============================================================
set clipboard^=unnamed
set clipboard^=unnamedplus

" Vim settings
"

" =============================================================
" Visual
" =============================================================
set number 			" Enable line numbering
set ruler			" Enable ruler
set cmdheight=1			" Height of the command bar
set cursorline			" Hightlight line with the cursor on
set showmode 			" Shows the current mode in the modeline
set t_Co=256 			" Enable 256-color mode
set t_ut=			" Dont know
"set term=xterm-256color		" 256-color mode, for windows/cygwin
set visualbell t_vb=		" no visual bell
set novisualbell                " no visual bell
set shortmess=aIoO		" no welcome message
"set wildmenu            	" visual autocomplete for command menu
set wildmode=list:longest,full	" Show vim completion menu

" Statusline
"set showmode			" Show mode
set laststatus=2		" Display statusline
set showcmd     		" show command in bottom bar
set statusline=%<[%02n]\ %F%(\ %m%h%w%y%r%)\ %a%=\ %8l,%c%V/%L\ (%P)\ [%08O:%02B]
set noshowmode 			" Lightline handle this





" =============================================================
" Behaviour
" =============================================================
set nobackup 			" Backup is for pussies.
set noswapfile			" Disable .swp file.
set undolevels=256 		" Undo levels.
set history=256			" How much history to save.
set scrolloff=16			" Number of line to keep above cursor when scrolling
set autoread 			" Auto read when file is changed
set magic  			" Regular expression magic
set nocp 			" no-compatible mode
set backspace=eol,start,indent	" Smarter backspace
set encoding=utf8 		" UTF-8 Encoding
set ttyfast			" faster redrawing
set nowb			" Prevents automatic write backup before overwriting file
set diffopt+=vertical		" Always use vertical diffs
set updatetime=250		" Faster update of internals
set cindent                 	" Automatic program indenting
set cinkeys-=0#             	" Comments don't fiddle with indenting
"set notitle                 	" Don't set the title of the Vim window

" Brackets
set showmatch			" Show matching brackets
set mat=2 			" Bracket matching blinking interval (1/10 sec)

" Indentation
set shiftwidth=8		" Go standard shiftwidth
set smarttab			" Smart tab
set smartindent			" Smart indent
set autoindent			" Autointentation
set textwidth=128		" Cap linewidth at 128
filetype plugin indent on	" Indent for plugins

" Searching
set incsearch			" Show partial matches.
set hlsearch			" Highlight search patterns.
set ignorecase			" Ignore case when searching.
set smartcase			" Dont ignore case if there is capitals in the search pattern

set splitbelow
set splitright

" Keybindings
"
map <C-n> :NERDTreeToggle<CR>	" Toggle NERDTree Window
map <F5> :set paste<CR>		" Set pasta mode
map <F7> :set invnumber<CR>	" Toggle linenumbers

noremap <leader>r :wa<cr>:GoRun<CR>
noremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>
noremap <leader>= gg=G
noremap <leader>n :lnext<cr>
noremap <leader>E :lclose<cr>
noremap <leader>p :lprev<cr>
noremap <leader>t :TagbarToggle<cr>
noremap <leader>g :GoLint<cr>
noremap <leader>gg :GoVet<cr>
noremap <leader>ii :GoImplements<cr>
noremap <leader>cc :GoCallees<cr>
noremap <leader>R :GoRename<cr>
noremap <leader>q :q<cr>
noremap <leader>qq :q!<cr>
noremap <leader>wa :wa<cr>
noremap <leader>w :w<cr>
noremap <leader>h :nohlsearch<CR>
inoremap jk <esc>

" i always, ALWAYS hit ":W" instead of ":w"
command! Q q
command! W w

autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage)
autocmd FileType go nmap <leader>i <Plug>(go-implements)
" autocmd FileType go nmap <leader>d <Plug>(go-doc)
autocmd FileType go nmap <leader>dd <Plug>(go-doc-browser)

" =============================================================
" File Detects
" =============================================================
autocmd BufNewFile,BufRead *.junos set filetype=junos
autocmd BufNewFile,BufRead *.py set filetype=python
autocmd BufNewFile,BufRead *.pl set filetype=perl
autocmd BufNewFile,BufRead *.js set filetype=jquery

autocmd BufNewFile,BufRead *.automount set filetype=systemd
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=8 shiftwidth=8
autocmd BufNewFile,BufRead *.html setlocal noexpandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.tmpl setlocal noexpandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.mount     set filetype=systemd
autocmd BufNewFile,BufRead *.path      set filetype=systemd
autocmd BufNewFile,BufRead *.service   set filetype=systemd
autocmd BufNewFile,BufRead *.socket    set filetype=systemd
autocmd BufNewFile,BufRead *.swap      set filetype=systemd
autocmd BufNewFile,BufRead *.target    set filetype=systemd
autocmd BufNewFile,BufRead *.timer     set filetype=systemd
autocmd BufNewFile,BufRead *.vim setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead */ansible/*.yml set filetype=ansible
autocmd BufNewFile,BufRead */playbooks/*.yml set filetype=ansible

augroup filetypedetect
	autocmd BufNewFile,BufRead nginx.conf www.*.conf sites-enabled/*.conf sites-available/*.conf setf nginx
augroup END

" =============================================================
"HTML Editing
" =============================================================
set matchpairs+=<:>
let g:html_indent_tags = 'li\|p' " Treat <li> and <p> tags like the block tags they are

" =============================================================
" Nerdtree settings
" =============================================================
" Open Nerdtree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if nerdtree is only buffer left when :q
function! s:CloseIfOnlyControlWinLeft()
	if winnr("$") != 1
		return
	endif
	if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
				\ || &buftype == 'quickfix'
		q
	endif
endfunction
augroup CloseIfOnlyControlWinLeft
	au!
	au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeWinPos = 'left'
" show hidden files -> toggle 'I'
" let g:NERDTreeShowHidden = 1

" open file at last opened position
au BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

" Golang:
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'gometalinter']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" =============================================================
" LightLine
" =============================================================
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [['mode', 'paste'], ['filename', 'modified']],
			\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
			\ },
			\ 'component_expand': {
			\   'linter_warnings': 'LightlineLinterWarnings',
			\   'linter_errors': 'LightlineLinterErrors',
			\   'linter_ok': 'LightlineLinterOK'
			\ },
			\ 'component_type': {
			\   'readonly': 'error',
			\   'linter_warnings': 'warning',
			\   'linter_errors': 'error'
			\ },
			\ }

function! LightlineLinterWarnings() abort
	let l:counts = ale#statusline#Count(bufnr(''))
	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors
	return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
	let l:counts = ale#statusline#Count(bufnr(''))
	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors
	return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
	let l:counts = ale#statusline#Count(bufnr(''))
	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors
	return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
	if exists('#lightline')
		call lightline#update()
	end
endfunction

" =============================================================
" GitGutter
" =============================================================
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_map_keys = 0
" Always display gitgutter column. (Prevents movement of the linenumber column)
if exists('&signcolumn')  " Vim 7.4.2201
	set signcolumn=yes
else
	let g:gitgutter_sign_column_always = 1
endif

" =============================================================
" ALE
" =============================================================
let g:ale_sign_warning = '»'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" =============================================================
" Theme Overwrites
" =============================================================
" Search hilight color
hi Search cterm=NONE ctermfg=black ctermbg=red

highlight clear SignColumn
highlight SignColumn ctermbg=black

" LineNumber Background
highlight LineNr ctermfg=gray ctermbg=black
" GitGutter Line Color
highlight GitGutterAdd ctermfg=green ctermbg=black
highlight GitGutterChange ctermfg=yellow ctermbg=black
highlight GitGutterDelete ctermfg=red ctermbg=black
highlight GitGutterChangeDelete ctermfg=yellow ctermbg=black

let g:cm_complete_popup_delay = 1
let g:cm_refresh_length = [[1,2],[7,1]]
