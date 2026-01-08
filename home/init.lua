local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

	if not (vim.uv or vim.loop).fs_stat(pckr_path) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/lewis6991/pckr.nvim",
			pckr_path,
		})
	end

	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require("pckr").add({
	-- Icons
	"echasnovski/mini.nvim",

	-- Trailing whitespace
	"ntpeters/vim-better-whitespace",

	-- Formatting
	"stevearc/conform.nvim",

	-- Rails
	"skalnik/vim-vroom",
	"thoughtbot/vim-rspec",
	"tpope/vim-bundler",
	"tpope/vim-rails",
	"vim-ruby/vim-ruby",

	-- Vim sensible defaults
	"tpope/vim-sensible",

	-- Align text and keys
	"vim-scripts/Align",
	"junegunn/vim-easy-align",

	-- GoLang
	{ "fatih/vim-go", run = ":GoUpdateBinaries" },
	"ray-x/go.nvim",
	"ray-x/guihua.lua",

	-- Nvim statup debugging
	"dstein64/vim-startuptime",

	-- Tags building and running
	"ludovicchabant/vim-gutentags",
	"majutsushi/tagbar",
	"vim-scripts/taglist.vim",

	-- markdown previews
	{ "shime/vim-livedown", run = "npm install -g livedown" },

	-- Read Editor config files
	"editorconfig/editorconfig-vim",

	-- Split join to merge strings
	"AndrewRadev/splitjoin.vim",

	-- FZF Search and replace
	"junegunn/fzf.vim",

	-- Navigation
	-- Z for Vim
	"easymotion/vim-easymotion",

	-- Left bar
	"nvim-neo-tree/neo-tree.nvim",

	-- Tmux Keybindings
	"christoomey/vim-tmux-navigator",
	"knubie/vim-kitty-navigator",

	-- String replacements
	"tpope/vim-abolish",

	-- Editor Layout
	"vim-airline/vim-airline",

	-- Auto Completion
	"kien/ctrlp.vim",
	"ntpeters/vim-better-whitespace",
	"Raimondi/delimitMate",

	-- Nvim diffs
	"sindrets/diffview.nvim",

	-- Vim indent
	"preservim/vim-indent-guides",

	-- Indent colorized
	"luochen1990/rainbow",
	"lukas-reineke/indent-blankline.nvim",

	-- Colors
	"altercation/solarized",
	"chriskempson/base16-vim",
	"chriskempson/tomorrow-theme",
	"freeo/vim-kalisi",
	"mhartington/oceanic-next",
	"twerth/ir_black",
	"vim-scripts/Wombat",
	"w0ng/vim-hybrid",

	-- Searching
	"jlanzarotta/bufexplorer",
	"mileszs/ack.vim",

	-- Git
	"Xuyuanp/nerdtree-git-plugin",
	"rbong/vim-flog",
	"rhysd/committia.vim",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- Selection of text
	"tpope/vim-commentary",
	"gcmt/wildfire.vim",

	-- Copy highlighting
	"machakann/vim-highlightedyank",

	-- Haml highlighter
	"tpope/vim-haml",

	-- Lua key manpping plugin
	"b0o/mapx.nvim",
	"folke/which-key.nvim",

	-- git icons
	"nvim-tree/nvim-web-devicons",

	-- End wrappers for functions and closes
	"rstacruz/vim-closer",
	"tpope/vim-endwise",
	"andymass/vim-matchup",
	"tpope/vim-surround",
	"vim-scripts/matchit.zip",
	"neovim/nvim-lspconfig",

	-- telescope.nvim is a highly extendable fuzzy finder over lists.
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",

	-- Left navigation and return locations
	"scrooloose/nerdtree",
	"tomtom/tlib_vim",
	"farmergreg/vim-lastplace",

	-- Plugins can have post-install/update hooks
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		cmd = "MarkdownPreview",
	},

	-- Post-install/update hook with neovim command
	-- {
	--	'nvim-treesitter/nvim-treesitter',
	--	run = ':TSUpdate'
	-- };

	-- Git display
	{
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	},
})

vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

vim.cmd([[
		let g:better_whitespace_enabled=1
		let g:strip_whitespace_on_save=1
]])

-- require('nvim-treesitter.configs').setup {
--	ensure_installed = "all",
--	-- one of "all", "maintained" (parsers with maintainers), or a list of languages
--	highlight = {
--		enable = true,
--	},
-- }

local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local ok_ibl, hooks = pcall(require, "ibl.hooks")
if ok_ibl then
	-- create the highlight groups in the highlight setup hook, so they are reset
	-- every time the colorscheme changes
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
		vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
		vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
		vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
		vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
		vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
		vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
	end)

	require("ibl").setup({ indent = { highlight = highlight } })
end

-- Setup language servers.
vim.lsp.enable("pyright")

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)

		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
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
vim.cmd("set history=1024") -- Number of things to remember in history.

local ok_mapx, mapx = pcall(require, "mapx")
if ok_mapx then
	mapx.setup({ global = true, whichkey = true })
end

-- Enable error files and error jumping
vim.cmd("set cf")

-- WhichKey Key bindings
-- Hard to type *****************************************************************
local ok_wk, wk = pcall(require, "which-key")
if ok_wk then
	wk.add({
		{
			mode = { "i" },
			{ "QQ", "<ESC>", desc = "Exit insert mode", remap = true, silent = false },
			{ "jj", "<ESC>", desc = "Exit insert mode", remap = true, silent = false },
			{ "kk", "->", desc = "Arrow", remap = true, silent = false },
			{ "qq", "<ESC>", desc = "Exit insert mode", remap = true, silent = false },
		},
	})

	wk.add({
		{ "<Leader>Q", "<nop>", desc = "<nop>", remap = true, silent = false },
		{ "<Leader>b", ":Telescope buffers<CR>", desc = ":Telescope buffers<CR>", remap = true, silent = false },
		{ "<Leader>c", ":Commentary<CR>", desc = ":Commentary<CR>", remap = true, silent = false },
		{ "<Leader>f", ":Telescope find_files<CR>", desc = ":Telescope find_files<CR>", remap = true, silent = false },
		{ "<Leader>fh", ":Telescope help_tags<CR>", desc = ":Telescope help_tags<CR>", remap = true, silent = false },
		{ "<Leader>g", ":Telescope live_grep<CR>", desc = ":Telescope live_grep<CR>", remap = true, silent = false },
		{ "<Leader>h", ":split^M^W^W<CR>", desc = ":split^M^W^W<CR>", remap = true, silent = false },
		{ "<Leader>j", ":TagbarToggle<CR>", desc = ":TagbarToggle<CR>", remap = true, silent = false },
		{ "<Leader>n", ":NERDTreeToggle<CR>", desc = ":NERDTreeToggle<CR>", remap = true, silent = false },
		{ "<Leader>q", "<nop>", desc = "<nop>", remap = true, silent = false },
		{ "<Leader>r", ":edit!<CR>", desc = ":edit!<CR>", remap = true, silent = false },
		{ "<Leader>t", ":Tags<CR>", desc = ":Tags<CR>", remap = true, silent = false },
		{ "<Leader>v", ":vsp^M^W^W<CR>", desc = ":vsp^M^W^W<CR>", remap = true, silent = false },
		{ "<Leader>w", ":WhichKey ", desc = ":WhichKey ", remap = true, silent = false },
		{ "<Leader>z", ":NERDTreeFind<CR>", desc = ":NERDTreeFind<CR>", remap = true, silent = false },
		{ "Q", "<nop>", desc = "Don't let Q do ANYTHING", remap = true, silent = false },
		{ "q", "<nop>", desc = "Don't let Q do ANYTHING", remap = true, silent = false },
	})
end

-- Formatting
local ok_conform, conform = pcall(require, "conform")
if ok_conform then
	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
			ruby = { "rufo" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	})

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			conform.format({ bufnr = args.buf })
		end,
	})
end

-- Required Indent for file type
vim.cmd("filetype plugin indent on")

-- Global Options
vim.g.mapleader = ","
vim.hlsearch = true
vim.o.incsearch = true
vim.o.number = true
vim.o.smartcase = true
vim.opt.autoindent = false
vim.opt.autowrite = true -- Writes on make/shell commands
vim.opt.cindent = false
vim.opt.expandtab = false
vim.opt.filetype = "off"
vim.opt.ignorecase = true
vim.opt.shell = "/bin/bash"
vim.opt.shiftwidth = 4
vim.opt.smartindent = false
vim.opt.smarttab = false
vim.opt.tabstop = 2
vim.opt.wrap = false

-- System properties
vim.cmd("syntax enable")
vim.cmd("set timeoutlen=250")
vim.cmd("set history=1024") -- Number of things to remember in history.

-- Visual
vim.opt.list = false
vim.opt.mat = 5 -- Bracket blinking.

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

-- NERDTree
vim.cmd([[
:noremap <Leader>z :NERDTreeFind<CR>
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

-- TODO: fix this crap

vim.cmd([[
			" Find files using Telescope command-line sugar.
			nnoremap <leader>f <cmd>Telescope find_files<cr>
			nnoremap <leader>g <cmd>Telescope live_grep<cr>
			nnoremap <leader>b <cmd>Telescope buffers<cr>
			nnoremap <leader>fh <cmd>Telescope help_tags<cr>
			]])

-- for key, command in pairs(noremap_functions) do
--	nnoremap( string.format('<Leader>%s', key), command, command)
-- end

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

				let g:airline_extensions = ['hunks']

				set cinoptions=:0,p0,t0
				set cinwords=if,else,while,do,for,switch,case
				set formatoptions=tcqr
				]])
