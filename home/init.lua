require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


	-- Rails
  use 'skalnik/vim-vroom'
  use 'thoughtbot/vim-rspec'
  use 'tpope/vim-bundler'
  use 'tpope/vim-rails'
  use 'vim-ruby/vim-ruby'

	-- Vim sensible defaults
	use 'tpope/vim-sensible'

	-- Align text and keys
	use 'vim-scripts/Align'
  use 'junegunn/vim-easy-align'

	-- Spell checking help
	use 'kamykn/spelunker.vim'

	-- GoLang
	use{'fatih/vim-go', run = ':GoUpdateBinaries'}
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

	-- Nvim statup debugging
	use 'dstein64/vim-startuptime'

	-- Tags building and running
  use 'ludovicchabant/vim-gutentags'
  -- use 'skywind3000/gutentags_plus'
  use 'majutsushi/tagbar'
	use 'vim-scripts/taglist.vim'

	-- markdown previews
	use{'shime/vim-livedown', run = "npm install -g livedown"}

	-- Read Editor config files
	use 'editorconfig/editorconfig-vim'

	-- Split join to merge strings
  use 'AndrewRadev/splitjoin.vim'

	-- FZF Search and replace
  use 'junegunn/fzf.vim'
  use{'junegunn/fzf', run = 'fzf#install'}

	-- Navigation
	-- Z for Vim
	use 'easymotion/vim-easymotion'


	-- Left bar
	use 'nvim-neo-tree/neo-tree.nvim'

	-- Searching
	use 'haya14busa/incsearch.vim'
  use 'haya14busa/incsearch-fuzzy.vim'

	-- Tmux Keybindings
  use 'christoomey/vim-tmux-navigator'
  use 'knubie/vim-kitty-navigator'

	-- String replacements
	use 'tpope/vim-abolish'

	-- Editor Layout
	use 'vim-airline/vim-airline'

	-- Auto Completion
	use 'kien/ctrlp.vim'
  use 'ntpeters/vim-better-whitespace'
	use 'Raimondi/delimitMate'

	-- Nvim diffs
	use 'sindrets/diffview.nvim'

  -- Vim indent
  use 'preservim/vim-indent-guides'


	-- Indent colorized
  use 'luochen1990/rainbow'
	use "lukas-reineke/indent-blankline.nvim"

  -- Colors
  use 'altercation/solarized'
  use 'chriskempson/base16-vim'
  use 'chriskempson/tomorrow-theme'
  use 'freeo/vim-kalisi'
  use 'mhartington/oceanic-next'
  use 'twerth/ir_black'
  use 'vim-scripts/Wombat'
  use 'w0ng/vim-hybrid'

	-- Background libraries
	-- TODO: Need to get this installed
	-- use 'ns9tks/vim-l9'

	-- Searching
	-- TODO: Fix this
	-- use 'vim-scripts/FuzzyFinder'
	use 'jlanzarotta/bufexplorer'
	use 'mileszs/ack.vim'


	-- Git
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'rbong/vim-flog'
  use 'rhysd/committia.vim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'

	-- CocNvim workers
	use {'neoclide/coc.nvim', run = 'yarn install --frozen-lockfile'}
  use 'antoinemadec/coc-fzf'

	-- Selection of text
  use 'tpope/vim-commentary'
	use 'gcmt/wildfire.vim'

	-- Copy highlighting
  use'machakann/vim-highlightedyank'

	-- Haml highlighter
	use 'tpope/vim-haml'

	-- Lua key manpping plugin
  use 'b0o/mapx.nvim'
  use 'folke/which-key.nvim'


  -- End wrappers for functins and closes
  use 'rstacruz/vim-closer'
  use 'tpope/vim-endwise'
  use 'andymass/vim-matchup'
	use 'tpope/vim-surround'
	use 'vim-scripts/matchit.zip'
  use 'neovim/nvim-lspconfig'

  -- telescope.nvim is a highly extendable fuzzy finder over lists.
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

	-- Left navigation and return locations
	use 'scrooloose/nerdtree'
  use 'tomtom/tlib_vim'
  use 'farmergreg/vim-lastplace'

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex', 'ruby'},
  -- }

  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
    -- use {
    --     'nvim-treesitter/nvim-treesitter',
    --     run = function()
    --         local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    --         ts_update()
    --     end,
    -- }	

  -- Git display
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
end)


require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

vim.opt.termguicolors = true

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },

}

require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
}


-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}


-- Auto Formatting
vim.cmd([[
  autocmd FileType lua nnoremap <buffer> <c-k> :call LuaFormat()<cr>
  autocmd BufWrite *.lua call LuaFormat()
]])


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)

    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- CTags setup
vim.cmd([[
  "Sets the tags directory to look backwards till it finds a tags dir
  set tags=expand('~/.cache/tags/')

  " enable gtags module
  let g:gutentags_modules = ['ctags']
	"" , 'gtags_cscope']

  " config project root markers.
  let g:gutentags_project_root = ['.root', '.git']

  " generate datebases in my cache directory, prevent gtags files polluting my project
  let g:gutentags_cache_dir = expand('~/.cache/tags')

  " change focus to quickfix window after search (optional).
  let g:gutentags_plus_switch = 1
  let g:gutentags_define_advanced_commands = 1
]])


vim.cmd([[
 " Stupid :W
 command WQ wq
 command Wq wq
 command W w
 command Q q
]])

vim.cmd([[
  " Auto resize windows
  set equalalways
]])


vim.cmd([[
 " wildfire  ******************************************************************
 " This selects the next closest text object.
 let g:wildfire_fuel_map = "<TAB>"
]])


vim.cmd("syntax enable")
vim.cmd("set timeoutlen=250")
vim.cmd("set history=1024")        -- Number of things to remember in history.

require'mapx'.setup{ global = true, whichkey = true }
-- Hard to type *****************************************************************
imap("jj", "<ESC>", "Exit insert mode")
imap("kk", "->", "Arrow")
imap("qq", "<ESC>", "Exit insert mode")
imap("QQ", "<ESC>", "Exit insert mode")

-- Enable error files and error jumping
vim.cmd("set cf")



-- TODO Add WhichKey Group Names
local noremap_functions = {

		Q = "<nop>",
		c = ":Commentary<CR>",
		h =  ":split^M^W^W<CR>",
		j = ":TagbarToggle<CR>",
		n = ":NERDTreeToggle<CR>",
		q = "<nop>",
		r = ":edit!<CR>",
		t = ":Tags<CR>",
		v = ":vsp^M^W^W<CR>",
		w = ":WhichKey ",
		z = ":NERDTreeFind<CR>",
    -- Find files using Telescope command-line sugar.
    b = ":Telescope buffers<CR>",
    f = ":Telescope find_files<CR>",
    fh= ":Telescope help_tags<CR>",
    g = ":Telescope live_grep<CR>",
}

-- Map the commands from above
for key, command in pairs(noremap_functions) do
  nnoremap( string.format('<Leader>%s', key), command, command)
end

-- Disable q for recording as we dont care
nnoremap("Q", "<nop>", "Don't let Q do ANYTHING")
nnoremap("q", "<nop>", "Don't let Q do ANYTHING")

-- Coc.vim
vim.cmd([[
" Coc.Vim
let g:coc_global_extensions = [
\ 'coc-diagnostic',
\ 'coc-dictionary',
\ 'coc-docker',
\ 'coc-go',
\ 'coc-html',
\ 'coc-json',
\ 'coc-lua',
\ 'coc-phpls',
\ 'coc-post',
\ 'coc-solargraph',
\ 'coc-syntax',
\ 'coc-tag',
\ 'coc-tsserver',
\ 'coc-ultisnips',
\ 'coc-word'
\ ]
]])


-- System tooling
vim.cmd([[
"set Directory for swap and backup files
set dir=/tmp

if &compatible
		set nocompatible               " Be iMproved
endif

if has('unnamedplus')
		set clipboard=unnamed,unnamedplus
		set clipboard+=unnamed  " Yanks go on clipboard instead.
endif
]])

-- Required Indent for file type
vim.cmd("filetype plugin indent on")

-- Global Options
vim.g.mapleader = ','
vim.hlsearch = true
vim.o.incsearch = true
vim.o.number = true
vim.o.smartcase = true
vim.opt.autoindent = false
vim.opt.autowrite = true    -- Writes on make/shell commands
vim.opt.cindent = false
vim.opt.expandtab = false
vim.opt.filetype = "off"
vim.opt.ignorecase = true
vim.opt.shell = "/bin/bash"
vim.opt.shiftwidth=4
vim.opt.smartindent = false
vim.opt.smarttab = false
vim.opt.tabstop = 2
vim.opt.wrap = false

-- System properties
vim.cmd("syntax enable")
vim.cmd("set timeoutlen=250")
vim.cmd("set history=1024")        -- Number of things to remember in history.

-- Visual
vim.opt.list = false
vim.opt.mat = 5  -- Bracket blinking.

vim.cmd("colorscheme OceanicNext")


-- Window navigation
vim.cmd([[
 " Tmux Navigation **********************************************************
 let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <Leader>" :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader>m :TmuxNavigateDown<cr>
nnoremap <silent> <Leader>u :TmuxNavigateUp<cr>
nnoremap <silent> <Leader>'  :TmuxNavigateRight<cr>
]])



-- Spelling highlighting
vim.cmd("set spell")

-- -- https://vimawesome.com/plugin/spelunker-vim
-- vim.cmd([[
-- set nospell
-- let g:enable_spelunker_vim = 1
-- let g:enable_spelunker_vim_on_readonly = 1

-- """ Make sure to check anything with prefixed with @
-- let g:spelunker_disable_account_name_checking = 0

-- """ Override highlight setting.
-- highlight SpelunkerSpellBad cterm=underline ctermfg=NONE gui=underline guifg=#9e9e9e
-- highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=#00e1ff
-- ]])


-- Fuck Me here we go again
-- local lspconfig = require('lspconfig')
-- local lsp_defaults = lspconfig.util.default_config

-- lsp_defaults.capabilities = vim.tbl_deep_extend(
--   'force',
--   lsp_defaults.capabilities,
--   require('cmp_nvim_lsp').default_capabilities()
-- )


-- NERDTree
vim.cmd([[
 :noremap <Leader>z :NERDTreeFind<CR>
]])

-- Autocomplete workers
vim.cmd([[
  " AUTO COMPLETION WORK
  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

" set completeopt+=menuone
" set completeopt+=noselect
" set completeopt+=preview
" autocmd CompleteDone * if !pumvisible() | pclose | endif
  inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" use <tab> for trigger completion and navigate to the next complete item

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <Tab>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()

]])


-- TODO: fix this crap

vim.cmd([[
" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  ]])

for key, command in pairs(noremap_functions) do
  nnoremap( string.format('<Leader>%s', key), command, command)
end


-- Easy motion and search
vim.cmd([[
		function! s:config_fuzzyall(...) abort
			return extend(copy({
			\   'converters': [
			\     incsearch#config#fuzzy#converter(),
			\     incsearch#config#fuzzyspell#converter()
			\   ],
			\ }), get(a:, 1, {}))
		endfunction

		noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
		noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
		noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
]])

-- Airline setup
vim.cmd([[
 " #######################################################################
 " Airline Vim Tagbar Setup
 " if you want to disable auto detect, comment out those two lines
 "let g:airline#extensions#disable_rtp_load = 1

 let g:airline_extensions = ['hunks', 'coc']

 set cinoptions=:0,p0,t0
 set cinwords=if,else,while,do,for,switch,case
 set formatoptions=tcqr
 ]])
