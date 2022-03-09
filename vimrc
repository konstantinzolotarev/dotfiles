set nocompatible              " be iMproved, required

" backspace
set backspace=2

set modeline

set number
set expandtab
set tabstop=2
set shiftwidth=2
set sw=2
set smartindent

set hlsearch
set hidden

if has('nvim')
  set clipboard+=unnamedplus
else
  set clipboard=unnamed
endif

" Remove preview window for vim-go
set completeopt-=preview

filetype off

" Plugins
call plug#begin('~/.vim/bundle')

Plug 'editorconfig/editorconfig-vim'

Plug 'matze/vim-move'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sheerun/vim-polyglot'

Plug 'elzr/vim-json'
Plug 'ruanyl/vim-fixmyjs'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'

Plug 'rizzatti/dash.vim'

Plug 'scrooloose/nerdtree'

Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'

" Super awesome search plugin
Plug 'mileszs/ack.vim'

" Markdown support
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Elixir & Phoenix
Plug 'elixir-editors/vim-elixir'
" Plug 'slashmili/alchemist.vim'
Plug 'konstantinzolotarev/elixir-snippets'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}

" Elm plugins
" Plug 'elmcast/elm-vim'

" GO lang plugins
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'tag': '*' }

" Themes
Plug 'konstantinzolotarev/solas.vim'
Plug 'joshdick/onedark.vim'

call plug#end()            " required

"Bind leader
let mapleader=","

" airline
let g:airline_theme='wombat'
" let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

set laststatus=2
set ttimeoutlen=50
" End airline configuration

" Markdown settings
let g:vim_markdown_folding_disabled = 1

" NerdTree Settings
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.swp$']

" NerdComments
let g:NERDSpaceDelims = 1

" Ale configuration
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:syntastic_style_error_symbol = '⁉️'
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_open_list = 0

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'go': ['gofmt', 'go build']
\}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Command-T
" let g:CommandTCancelMap = ['<Esc>']
" let g:CommandTWildIgnore=&wildignore . ",*/bower_components,*/node_modules,*/deps,*/_build,*/vendor,*/bin"

" Ctrl-P plugin
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svni)|bower_components|node_modules|deps|_build|vendor|bin|priv$'

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Elixir
let g:alchemist_tag_map = 'gd'
let g:alchemist_tag_stack_map = ',gf'
let g:alchemist#elixir_erlang_src = '/usr/local/Cellar/elixir/1.7.3/'
"let g:alchemist#elixir_erlang_src = '/usr/local/Cellar/'

" Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
let g:go_doc_keywordprg_enabled = 0
" Enable highlight variable under cursor
" let g:go_auto_sameids = 0
" Show type information in statusbar
let g:go_auto_type_info = 1
" Disable GoDef mappings will remap later
let g:go_def_mapping_enabled = 0
" Run goimports on save
let g:go_fmt_command = "goimports"
let g:go_decls_includes = "func,type"
" Remap key bindings for go
au FileType go nnoremap <buffer> gd :GoDef<CR>
au FileType go nnoremap <buffer> gdd :GoDefPop<CR>
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>gi :GoInfo<CR>
au FileType go nnoremap <leader>ga :GoAlternate<CR>


" deoplate-go
let g:deoplete#sources#go#pointer = 1

" Setting up coc for elixir-ls sudgestions
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Dash docs
nmap <leader>d <Plug>DashSearch
nmap <leader>gd <Plug>DashGlobalSearch

" nmap emt :Mix test<CR>
" Unmapping prev keys
" unmap <C-[>

" NERDTree plugin configs
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-t> :NERDTreeFind<CR>
" map <C-t> :enew<CR>:NERDTreeToggle<CR>

" CtrlP commands
nmap <leader>T :CtrlPDir<CR>

" other mappings
map <C-O> :vs<CR><C-W><C-W>:e .<CR>
map <F10> :set invnumber<CR>
map <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
map .. <Esc>:noh<CR>
map <S-l> <S-Right>
map <S-h> <S-Left>
" map <C-p> :let @/ = ""<CR>

noremap <C-\> :bprev<CR>
noremap <C-]> :bnext<CR>
" nnoremap <tab> <C-w>w
nnoremap <D-]> <C-w>w
nnoremap <D-[> <C-w>p

map tt gg=G
map <Esc><Esc> $a

vmap  *       <Esc>`>a*/<CR><Esc>`<i<CR>/*<Esc>
vmap  (       <Esc>`>a)<Esc>`<i(<Esc>))

noremap <Leader><Leader>f :Fixmyjs<CR>

:command Bd bd
:command BD bd
:command WQ wq
:command Wq wq
:command W w
:command Q q

:command Mt execute "Mix test"
:command Mf execute "Mix format"
:command Mff execute "Mix format %"
:command Mtf execute "Mix test %"
:command Mtt execute "Mix test %:".line(".")

function! XmlIndent()
  set ts=2
  set sw=2
endfunction

function! MakeFileIndent()
  set noexpandtab
endfunction

" filetype directives
au FileType xml call XmlIndent()
au FileType xquery call XmlIndent()
au BufEnter /pintos/src/* call GnuIndent()
au BufEnter makefile call MakeFileIndent()
au BufRead,BufNewFile *bash* let g:is_bash=1

" javasdcript
au BufNewFile,BufRead *.json    set filetype=javascript

" less
au BufNewFile,BufRead *.less set filetype=less

au BufNewFile,BufRead *.ejs set filetype=html
filetype plugin indent on    " required

set regexpengine=1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
" set background=dark
" colorscheme solas
colorscheme onedark

set ruler
set rulerformat=%50(%c%V\ %p%%%)
