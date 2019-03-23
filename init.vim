call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer --ts-completer' }
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
Plug 'edkolev/tmuxline.vim'
Plug 'chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'
Plug 'ntpeters/vim-better-whitespace'
Plug 'yggdroot/indentline'
Plug 'ap/vim-css-color'

call plug#end()

syntax enable

if (has("termguicolors"))
    set termguicolors
endif

colorscheme gruvbox
let g:gruvbox_improved_warnings=1
let g:gruvbox_guisp_fallback='bg'

set background=dark
set hidden
set incsearch ignorecase smartcase
set number relativenumber
set nowrap
set backupcopy=yes
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set completeopt=longest,menuone
set mouse=a

let g:airline_theme='gruvbox'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1

if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
    let $FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
endif

let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_detailed_diagnostics = ''

let mapleader = " "

let g:ale_fixers = {
            \   'typescript': ['prettier'],
            \   'javascript': ['prettier'],
            \   'jsx': ['prettier'],
            \   'json': ['prettier'],
            \   'css': ['prettier'],
            \   'scss': ['prettier']
            \}
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'jsx': ['eslint'],
            \   'typescript': ['tsserver']
            \}
let g:ale_linters_explicit = 1

let g:netrw_banner = 1
let g:tmuxline_powerline_separators = 0


imap jj <Esc>

set tabstop=8 softtabstop=0 expandtab shiftwidth=4

nnoremap <Leader>m :match StatusLine /\<<C-R><C-W>\>/<CR>
nnoremap <Leader>n :match none<CR>

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

nnoremap <Leader>e :YcmCompleter RefactorRename<Space>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>

nnoremap <silent> <C-n> :Buffers<CR>
nnoremap <silent> <C-p> :FZF -m<CR>

nmap <F8> :TagbarToggle<CR>

nnoremap <F5> :ALELint<CR>
nnoremap <Leader>b :Autoformat<CR>
nnoremap <Leader>f :ALEFix<CR>
nnoremap <Leader>d :ALEDetail<CR>
