syntax on

set laststatus=2

set nocompatible              
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
set t_Co=256
set encoding=utf-8
set number
set cursorline
call vundle#begin()

" General
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Autocompletion
Plugin 'valloric/youcompleteme' 
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" File management
Plugin 'scrooloose/nerdtree'
" Go dev
Plugin 'fatih/vim-go'

" Leader key is space key 
let mapleader = " "
" Search highlight is red instead of yellow for easier viewing
highlight Search ctermfg=15 ctermbg=1

" Statusline
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

" Map vim keys for
" start_of_line
nnoremap 0 $
" end_of_line
nnoremap 1 0

" Map window toggle keys
nnoremap <leader>e <C-w><C-w>
nnoremap <leader>w <C-w><C-k>
nnoremap <leader>s <C-w><C-j>
nnoremap <leader>a <C-w><C-h>
nnoremap <leader>d <C-w><C-l>

" Default auto-completion for C family in .ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" YCM config w UltiSnips, etc.
let g:clang_snippets_engine = "ultisnips"
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion = ['<enter>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '!!' 
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <leader>gd :YcmCompleter GoTo<CR>

" Snippet Trigger Config
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/UltiSnips"

" Nerdtree config
map <F1> :NERDTreeToggle<CR>
" Close if only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '↳'  
let g:NERDTreeDirArrowCollapsible = '↴'

" Python config path
let g:ycm_python_binary_path = '/usr/bin/python3'

" Vim-go config syntax, keys, etc.
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_template_autocreate = 0
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>gd <Plug>(go-doc)
let g:go_list_type = "quickfix"

" Quickfix navigation config
nnoremap <leader>n :cnext<CR>
nnoremap <leader>m :cprevious<CR>
nnoremap <leader>, :cclose<CR>
" Close quickfix if only window left open
aug QFClose
	au!
	au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

call vundle#end()            " required
filetype plugin indent on    " required
