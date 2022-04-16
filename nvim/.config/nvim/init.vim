set exrc                        " load external .vimrcs
set guicursor=                  " keep block cursor always

set number
set rnu
set nohlsearch
set hidden
set noerrorbells
" set nocompatible

set updatetime=100
syntax on
set mouse=a

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set noswapfile
set nobackup
set backspace=indent,eol,start
set signcolumn=yes " number
set nowrap
set encoding=utf-8

set cmdheight=1
set previewheight=10
set completeopt-=preview 
set shortmess+=c

set undodir=~/.vim/undodir
set undofile
set incsearch

set scrolloff=8

set termguicolors

set noshowmode

set splitright

call plug#begin('~/.vim/plugged')

" basic
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'sharkdp/fd'
Plug 'machakann/vim-highlightedyank'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope-fzy-native.nvim', { 'do': 'make' }

Plug 'nvim-telescope/telescope-github.nvim'
Plug 'LinArcX/telescope-env.nvim'
Plug 'TC72/telescope-tele-tabby.nvim'
" Plug 'fannheyward/telescope-coc.nvim'

Plug 'folke/trouble.nvim'

" treesitter
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
" Plug 'ray-x/navigator.lua'
" Plug 'ray-x/lsp_signature.nvim'

"" Plug 'hrsh7th/nvim-compe' and other plugins you commenly use...

" optional, if you need treesitter symbol support
Plug 'nvim-treesitter/nvim-treesitter-refactor'

" firenvim
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" themes
Plug 'tomasiser/vim-code-dark'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'flazz/vim-colorschemes'
Plug 'projekt0n/github-nvim-theme'
Plug 'shaunsingh/nord.nvim'
Plug 'ishan9299/nvim-solarized-lua'
Plug 'olimorris/onedarkpro.nvim'
Plug 'fatih/molokai'
Plug 'bluz71/vim-moonfly-colors'
" Plug 'kien/rainbow_parentheses.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Emojis
Plug 'kyuhi/vim-emoji-complete'
Plug 'xiyaowong/telescope-emoji.nvim'

"  nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
"
Plug 'airblade/vim-gitgutter'
"
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }

" Tab.....rename
Plug 'webdevel/tabulous' " -- provides: Tabrename, and 1/2/3..gt
" tab tree ,mt
Plug 'kien/tabman.vim' " -- provides: mt tab tree

" autosession
" Plug 'rmagatti/auto-session'
" Plug 'rmagatti/session-lens'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mzlogin/vim-markdown-toc'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'simrat39/symbols-outline.nvim'

" comments
Plug 'numToStr/Comment.nvim'

" dap
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'
" Plug 'leoluz/nvim-dap-go'

call plug#end()
"
" handy mapping function
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

nnoremap ; :

let mapleader = ","

" -- Renes awesome umlauts
inoremap <leader><leader>a ä
inoremap <leader><leader>o ö
inoremap <leader><leader>u ü
inoremap <leader><leader>A Ä
inoremap <leader><leader>O Ö
inoremap <leader><leader>U Ü
inoremap <leader><leader>s ß

" -- mario stuff

" session bam
let g:sesssionsdir = '~/nvim-sessions'
 
exec 'nnoremap <Leader>ss :mks! ' . g:sesssionsdir . '/\<tab>\<tab>'
exec 'nnoremap <Leader>sr :so ' . g:sesssionsdir . '/\<tab>\<tab>'

nnoremap <leader>0 '0

autocmd filetype markdown set tw=120
au filetype markdown noremap <c-m> <cmd>:MarkdownPreviewToggle<cr>

nnoremap <leader>v <cmd>:vnew<cr>
nnoremap <leader>jq <cmd>:%!jq<cr>

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk

noremap j gj
nnoremap k gk

" TAB  between buffers
nnoremap <Tab> <c-w><c-w>

" C-W
nnoremap <leader>w <C-w>
" resize window
" nnoremap <C-h> <C-w><
" nnoremap <C-j> <C-w>+
" nnoremap <C-k> <C-w>-
" nnoremap <C-l> <C-w>>


nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>


" telescope and beyound ...
nnoremap <leader><leader> <cmd>Telescope find_files<cr>
nnoremap <leader>h <cmd>Telescope command_history<cr>

map <C-p> <cmd>Telescope live_grep<cr>

" -- Telescope find, git
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fm <cmd>Telescope man_pages<cr>
nnoremap <leader>fs <cmd>Telescope symbols<cr>
nnoremap <leader>g <cmd>Telescope git_files<cr>
nnoremap <leader>gv <cmd>Gvdiffsplit<cr>
nnoremap <leader>gg <cmd>Telescope git_commits<cr>
nnoremap <leader>ggg <cmd>Telescope git_branches<cr>

nnoremap <leader>s <cmd>SymbolsOutline<cr>

" -- tab stuff
nnoremap <leader>t <cmd>tabnew<cr>
nnoremap <leader>tt <cmd>lua require('telescope').extensions.tele_tabby.list()<cr>
nnoremap <leader>tr :TabulousRename
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt

function! NTClose_COCDiagnostics()
    NERDTreeClose
    CocDiagnostics
endfunction

function! NTClose_GOMetalinter()
    NERDTreeClose
    GoMetaLinter
endfunction

function! SON ()
    TSEnableAll highlight
endfunction

" -- general stuff

" allow Q to q uit
call SetupCommandAbbrs('Q', 'q')


" -- nerdtree stuff
nnoremap <C-g> :NERDTreeToggle<cr>
let g:NERDTreeWinPos = "right"
let NERDTreeMinimalMenu=1
let NERDTreeMinimalUI=1

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusUseNerdFonts = 1

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"   \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" -- treeshitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
      enable = true,
--      disable = { "" },
  }
}
EOF

lua <<EOF
require('telescope').load_extension('env')
require('telescope').load_extension('gh')
require("telescope").load_extension('media_files')
require('telescope').load_extension('dap')
EOF

lua <<EOF
require('trouble').setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
EOF

" telescope
lua << EOF
require('telescope').setup({
  defaults = {
      cache_picker = false,
    layout_config = {
      vertical = { width = 0.5 },
      -- other layout configuration here
      horizontal = { preview_width = 0.7, width = 0.9, },
      prompt_position = "bottom",
    },
    -- other defaults configuration here
    -- winblend=10,
  },
  -- other configuration values here
  extensions = {
      media_files = {
        find_cmd = 'rg',
      },
      tele_tabby = {
           use_highlighter = true,
      },
  },
})
EOF


" let g:gruvbox_contrast_dark='soft'
" let g:gruvbox_bold=0
" let g:gruvbox_contrast_dark='medium'
" let g:gruvbox_contrast_dark='hard'
" colorscheme gruvbox

" let g:tokyonight_style = "storm"
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = "false"
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

colorscheme tokyonight
" colorscheme gruvbox

au ColorScheme * hi Normal ctermbg=None

let g:rehash256 = 1

set cursorline
set clipboard=unnamedplus
set colorcolumn=80
"
" -- airline
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'codedark'

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" scrollbar highlight clear SignColumn
let scrollview_current_only=1



" LspKeyMap
" SymbolsOutline

" -- gd comments
lua require('Comment').setup()

