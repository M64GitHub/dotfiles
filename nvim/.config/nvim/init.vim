set exrc                        
set guicursor=                  
set number
"set rnu
"set nohlsearch
set hidden
set noerrorbells
set nocompatible
set updatetime=200
syntax on
set mouse=a
" set mouse=n
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noswapfile
set nobackup
set backspace=indent,eol,start
set signcolumn=yes " number
"set nowrap
set wrap
set encoding=utf-8
set cmdheight=1
set previewheight=10
" set completeopt-=preview 
set shortmess+=c
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set termguicolors
set noshowmode
set nomodeline
set splitright

call plug#begin('~/.vim/plugged')
Plug 'nvim-lualine/lualine.nvim'



Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'tpope/vim-fugitive'
Plug 'sharkdp/fd'
Plug 'machakann/vim-highlightedyank'

Plug 'KabbAmine/zeavim.vim'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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


" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'

Plug 'liuchengxu/vista.vim'

" Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
" Plug 'ray-x/navigator.lua'
" Plug 'ray-x/lsp_signature.nvim'

" dap
" Plug 'mfussenegger/nvim-dap'
" Plug 'nvim-telescope/telescope-dap.nvim'
" Plug 'theHamsta/nvim-dap-virtual-text'
" Plug 'rcarriga/nvim-dap-ui'
" Plug 'leoluz/nvim-dap-go'

Plug 'airblade/vim-gitgutter'
"Plug 'simrat39/symbols-outline.nvim'

" trouble
Plug 'folke/trouble.nvim'

" comments
Plug 'numToStr/Comment.nvim'

" firenvim
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'PhilRunninger/nerdtree-visual-selection'

" tab related
Plug 'webdevel/tabulous' " -- provides: Tabrename, and 1/2/3..gt
Plug 'kien/tabman.vim' "   -- provides: mt tab tree  ,mt

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mzlogin/vim-markdown-toc'

" scrollbar
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }

" themes
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'flazz/vim-colorschemes'
Plug 'shaunsingh/nord.nvim'
Plug 'ishan9299/nvim-solarized-lua'
Plug 'olimorris/onedarkpro.nvim'
Plug 'fatih/molokai'
Plug 'bluz71/vim-moonfly-colors'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" emojis
Plug 'kyuhi/vim-emoji-complete'
Plug 'xiyaowong/telescope-emoji.nvim'


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

" m64

" coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" TAB between buffers
nnoremap <Tab> <c-w><c-w>

" C-W
nnoremap <leader>w <C-w>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>

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
" let g:NERDTreeFileExtensionHighlightFullName = 1

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"   \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" -- treeshitter
lua <<EOF
require'nvim-treesitter.configs'.setup({
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",

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
})
require('telescope').load_extension('env')
require('telescope').load_extension('gh')
require("telescope").load_extension('media_files')
-- require('telescope').load_extension('dap')
EOF

lua <<EOF
require('trouble').setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
})
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

let g:tokyonight_style = "storm"
" let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = "false"
" let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
let g:tokyonight_sidebars = [ "qf", "vista", "terminal", "packer", "NERD_tree_1" ]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

colorscheme tokyonight
" colorscheme gruvbox

au ColorScheme * hi Normal ctermbg=None

" let g:rehash256 = 1 " not required

set cursorline
set clipboard=unnamedplus
set colorcolumn=80
"

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" scrollbar highlight clear SignColumn
let scrollview_current_only=1

" gc comments
lua require('Comment').setup()

" LspKeyMap


function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

lua << END
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'nerdtree', 'fugitive'}
})
END

"zeavim
"nmap <leader>zz <Plug>ZVKeyDocset

