set nocompatible              " required
filetype off                  " required


" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'
Plug 'moll/vim-bbye'
Plug 'morhetz/gruvbox'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'wakatime/vim-wakatime'
Plug 'gioele/vim-autoswap'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

" Change leader key mapping to more convenient Spacebar and é keys
let mapleader = "é"
nmap <Space> é

" This file
" Open and edit this file in split pane
cnoreabbrev rc sp ~/.vimrc

" Automatically reload this file when it is modified
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Misc
syntax enable
set encoding=utf-8
set foldmethod=marker
" Unmap the annoying F1 help shortcut
map <F1> <Esc>
imap <F1> <Esc>

" Set command-line history size to more than the default 20
set history=200

" Auto read when a file is changed on disk
set autoread

" %% is an alias that points to the directory containing the file in the
" buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" allow saving a sudo file if forgot to open as sudo
cmap w!! w !sudo tee % >/dev/null

" no text wrapping by default
set nowrap

" Autowrap text to 80 chars for certain filetypes
" autocmd BufRead,BufNewFile *.md setlocal textwidth=80
" autocmd BufRead,BufNewFile *.txt setlocal textwidth=80
autocmd FileType gitcommit setlocal textwidth=80

" Don't break words in the middle to wrap a line
set linebreak

" Movement
nnoremap zj zt
nnoremap zk zb

" Buffer / pane mangement

" Allow hidden buffer
set hidden

" Simplified buffer switching
nnoremap <F5> :buffers<CR>:buffer<Space>

" Go to next/previous buffer
nnoremap <C-m> :bnext<CR>
nnoremap <C-n> :bprevious<CR>

" C-^ is not possible on my keyboard layout
" Remap last buffer switching to something else
nnoremap <leader><F5> <C-^>

" Define splitting behavior and how to move between panes
set splitbelow
set splitright

" Force vertical split when using vimdiff or Gdiff
set diffopt+=vertical

" vim-tmux-navigator mappings
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>

" open Scratch buffer
nnoremap <leader>s :Scratch<CR>

" }}}
" Copy / paste {{{
" Synchronize yanks and pastes with system clipboard
set clipboard=unnamedplus

" Make delete really delete, and not cut
nnoremap d "_d
vnoremap d "_d

" Saner copy/cut/paste register, uses the system clipboard, also avoids that
" deleting overwrites the default register
noremap  yy "+yy
noremap  y "+y
noremap  Y "+Y
noremap  p "+p
noremap  P "+P
vnoremap y "+y
vnoremap Y "+Y
vnoremap p "+p
vnoremap P "+P}}}
" SEARCH {{{

" Set default search behavior to highlight matches, allow incremental
" search and ignore case unless a capital letter is included in the search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Key binding to toggle search highlighting
nnoremap <silent> <leader>l :<C-u>nohlsearch<CR><C-l>

" Key binding to count number of matches for current pattern
nmap <leader>c :%s///gn<CR>

" make regexp search not suck by default -
nnoremap / /\v
vnoremap / /\v"}}}
" #### APPEARANCE ####{{{

" Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Make it so the screen will always display that many lines above or below the
" cursor
set scrolloff=4

" Show cursor row/col on the bottom right
set ruler

" Display line on column 80
set cc=119

" Line numbers
set number
set relativenumber

" Shortcut to rapidly toggle `set list`
nmap <leader>L :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Colorscheme
" Ensure True Colors if the terminal uses them
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Theme
set background=dark
colorscheme gruvbox

" Make vim transparent
hi Normal guibg=NONE ctermbg=NONE

"}}}
" #### LaTeX ####{{{

" Markdown support for Latex math
function! MathAndLiquid()
	"" Define certain regions
	" Block math. Look for "$$[anything]$$"
	syn region math start=/\$\$/ end=/\$\$/
	" inline math. Look for "$[not $][anything]$"
	syn match math_block '\$[^$].\{-}\$'

	" Liquid single line. Look for "{%[anything]%}"
	syn match liquid '{%.*%}'
	" Liquid multiline. Look for "{%[anything]%}[anything]{%[anything]%}"
	syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
	" Fenced code blocks, used in GitHub Flavored Markdown (GFM)
	syn region highlight_block start='```' end='```'

	"" Actually highlight those regions.
	hi link math Statement
	hi link liquid Statement
	hi link highlight_block Function
	hi link math_block Function
endfunction

" Avoid crazy indent behavior in Vimtex
autocmd Filetype tex setlocal expandtab

" Assume a .tex file is LaTeX
let g:tex_flavor = "latex"

au BufRead,BufNewFile *.tex
			\ set syntax=tex

" vimtex configuration
let g:vimtex_view_method = 'zathura'
"}}}
" #### MARKDOWN ####{{{

au BufRead,BufNewFile *.md setlocal textwidth=80

" Detect and highlight any *.md file as Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Allow fenced code block syntax in Markdow files
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Call everytime we open a Markdown file
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()

" vim-instant-markdown configuration
let g:instant_markdown_autostart = 0

"}}}
" #### PYTHON ####{{{

" Set autoindentation and whitespace for Python files
au BufNewFile,BufRead *.py
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix |
			\ set nowrap

let python_highlight_all=1


" ##############
" #### JSON ####
" ##############

" Key binding to prettify JSON. Second part is to convert unicode escaped
" chars to their glyph.
map <leader>jt  <Esc>:%!python -m json.tool<CR>:%s/\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1),1)/g<CR>

"}}}
"
" #### Swift #### {{{

" Set autoindentation and whitespace for Swift files
au BufNewFile,BufRead *.swift
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix |
			\ set nowrap
" }}}
" #### YouCompleteMe ####{{{

" Better autocomplete behavior
let g:ycm_autoclose_preview_window_after_completion=1
" leader+g means goto definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"}}}
" #### NERDTree ####{{{

" Open NERDTree if starting Vim with no file specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" toggle NERDTree drawer
map <leader>d :NERDTreeToggle<CR>

"ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Refresh directory listing
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"}}}
" vim-bbye {{{
nnoremap <Leader>q :Bdelete<CR>

" }}}
" Custom text mappings {{{
map <leader>a <esc>ggVG<CR>
" }}}
" #################################################


" remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" auto remove whitespace on buffer save
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''

" Turn on spell check for certain filetypes automatically
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell spelllang=en_us


" vim-slime configuration
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
" let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.2"}


" UltiSnips config
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

