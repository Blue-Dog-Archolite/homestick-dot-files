vim.call('plug#begin', '~/.config/nvim/plugged')

local Plug = vim.fn['plug#']

Plug 'tpope/vim-sensible'

Plug 'Shougo/denite.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

-- Tools
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'

Plug 'vim-airline/vim-airline'
Plug 'janko-m/vim-test'
Plug 'kien/ctrlp.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'majutsushi/tagbar'


Plug 'scrooloose/nerdtree'
Plug 'tomtom/tlib_vim'
Plug 'farmergreg/vim-lastplace'
Plug 'machakann/vim-highlightedyank'


-- Select blocks based on indent
Plug 'gcmt/wildfire.vim'

-- Search and Replace
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-surround'
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})

-- Git
Plug 'rhysd/committia.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'vim-scripts/Align'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/taglist.vim'

-- EditorConfig files
Plug 'editorconfig/editorconfig-vim'

-- Terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'

-- Searching
Plug 'vim-scripts/FuzzyFinder'
Plug 'rking/ag.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'jlanzarotta/bufexplorer'
Plug 'mileszs/ack.vim'
Plug 'skwp/greplace.vim'


-- Z for vim
Plug 'easymotion/vim-easymotion'

-- Networking support and scripting plugin
Plug 'eiginn/netrw'

-- markdown
Plug 'shime/vim-livedown'

-- Color Scheme
Plug 'altercation/solarized'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/tomorrow-theme'
Plug 'freeo/vim-kalisi'
Plug 'twerth/ir_black'
Plug 'mhartington/oceanic-next'
-- "Luxed/ayu-vim"

Plug 'vim-scripts/Wombat'
Plug 'w0ng/vim-hybrid'

-- Vim indent
Plug 'nathanaelkane/vim-indent-guides'
Plug 'luochen1990/rainbow'

-- Linters
Plug 'w0rp/ale'

-- Completion
Plug 'ervandew/supertab'

-- Rails / Ruby
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'skalnik/vim-vroom'
Plug 'tpope/vim-endwise'

-- BUnch of languages
Plug 'sheerun/vim-polyglot'

-- Puppet
Plug 'rodjek/vim-puppet'

-- Chef
Plug 'vadv/vim-chef'

-- Javascript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'

-- Postman replacement
Plug 'iamcco/coc-post'

-- Tmux keybindings
Plug 'christoomey/vim-tmux-navigator'

Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'


-- Build Requires
Plug('Shougo/vimproc.vim', {['do']= 'make'})
Plug 'psf/black' --, { 'rev': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1' })
Plug('neoclide/coc.nvim', {['do'] ='yarn install --frozen-lockfile'})

vim.call('plug#end')

vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true


vim.cmd([[
 filetype off                  " required
 set shell=/bin/sh

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required
 filetype plugin indent on
 syntax enable

 "Before merge of files these existed
 set cf                  " Enable error files & error jumping.

 if has('unnamedplus')
   set clipboard=unnamed,unnamedplus
   set clipboard+=unnamed  " Yanks go on clipboard instead.
 endif

 set history=1024        " Number of things to remember in history.
 set autowrite           " Writes on make/shell commands
 set timeoutlen=250      " Time to wait after ESC (default causes an annoying delay)


 " Status Bar
 set laststatus=2  " Always show status line.

 " Editor Config plays nicely with TPope Fugitive
 let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

 " Gutentags
 " enable gtags module
 let g:gutentags_modules = ['ctags', 'gtags_cscope']

 " config project root markers.
 let g:gutentags_project_root = ['.git']

 " generate datebases in my cache directory, prevent gtags files polluting my project
 let g:gutentags_cache_dir = expand('~/tags')

 " change focus to quickfix window after search (optional).
 let g:gutentags_plus_switch = 1
 let g:gutentags_generate_on_new = 1
 let g:gutentags_generate_on_missing = 1
 let g:gutentags_generate_on_write = 1
 let g:gutentags_generate_on_empty_buffer = 0
 " let g:gutentags_trace = 1

 let g:gutentags_ctags_extra_args = [
       \ '--tag-relative=yes',
       \ '--fields=+ailmnS',
       \ ]


 " #######################################################################
 " Airline Vim Tagbar Setup
 " if you want to disable auto detect, comment out those two lines
 "let g:airline#extensions#disable_rtp_load = 1
 let g:airline_extensions = ['branch', 'hunks', 'coc']

 set nocp
 set cinoptions=:0,p0,t0
 set cinwords=if,else,while,do,for,switch,case
 set formatoptions=tcqr
 set cindent
 set autoindent
 set smarttab
 set expandtab
 set wrap

 set smartindent
 set tabstop=4
 set shiftwidth=4
 set expandtab

 " Visual
 " set showmatch  " Show matching brackets.
 set mat=5  " Bracket blinking.
 set list

 " Show $ at end of line and trailing space as ~
 set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
 set novisualbell  " No blinking .
 set noerrorbells  " No noise.

 " -----------------------------------------------------------------------------
 " |                            VIM Settings                                   |
 " |                   (see gvimrc for gui vim settings)                       |
 " |                                                                           |
 " | Some highlights:                                                          |
 " |   jj = <esc>  Very useful for keeping your hands on the home row          |
 " |   ,n = toggle NERDTree off and on                                         |
 " |                                                                           |
 " |   ,f = fuzzy find all files                                               |
 " |   ,b = fuzzy find in all buffers                                          |
 " |   ,p = go to previous file                                                |
 " |                                                                           |
 " |   hh = inserts '=>'                                                       |
 " |   aa = inserts '@'                                                        |
 " |                                                                           |
 " |   ,h = new horizontal window                                              |
 " |   ,v = new vertical window                                                |
 " |                                                                           |
 " |   ,i = toggle invisibles                                                  |
 " |                                                                           |
 " |   enter and shift-enter = adds a new line after/before the current line   |
 " |                                                                           |
 " |   :call Tabstyle_tabs = set tab to real tabs                              |
 " |   :call Tabstyle_spaces = set tab to 2 spaces                             |
 " |                                                                           |
 " | Put machine/user specific settings in ~/.vimrc.local                      |
 " |  CTAGS  C-] - go to definition                                            |
 " |  C-T - Jump back from the definition.                                     |
 " |  C-W C-] - Open the definition in a horizontal split                      |
 " |  C-\ - Open the definition in a new tab                                   |
 " |  A-] - Open the definition in a vertical split                            |
 " |
 " |  After the tags are generated. You can use the following keys to tag into and tag out of functions:
 " |
 " |  Ctrl-Left_MouseClick - Go to definition                                  |
 " |  Ctrl-Right_MouseClick - Jump back from definition                        |

 "Set Mapping to ,
 "**********************************************************
 let mapleader = ","

 "Use jj as escape .. Eaiser?
 imap jj <ESC>
 imap jk <Esc>

 nnoremap <Leader>w :w<CR>
 nnoremap <Leader>r :edit!<CR>

 vmap <Leader>y "+y
 vmap <Leader>d "+d
 nmap <Leader>p "+p
 nmap <Leader>P "+P
 vmap <Leader>p "+p
 vmap <Leader>P "+P

 " Rspec
 map <Leader>t :call RunCurrentSpecFile()<CR>
 map <Leader>s :call RunNearestSpec()<CR>
 map <Leader>l :call RunLastSpec()<CR>
 map <Leader>a :call RunAllSpecs()<CR>

 let g:rspec_command = "bundle exec rspec --drb {spec}"

 " I dont remember what this is for
 map <Leader>l :lopen<CR>

 set listchars=tab:>-

 "improve autocomplete menu color
 highlight Pmenu ctermbg=238 gui=bold

 " Removes trailing spaces
 autocmd BufWritePre *.rb :%s/\s\+$//e
 autocmd BufRead *.py execute ':Black'
 autocmd BufWritePre *.py execute ':Black'
 " 
 "   map <F3> :call FormatJSON()<CR>
 " 
 " 
  " Show quotes in JSON
  set conceallevel=0

  " Format hash
  nnoremap <F8> $v%lohc<CR><CR><Up><C-r>"<Esc>:s/,/,\r/g<CR>:'[,']norm ==<CR>

  set ts=2  " Tabs are 2 spaces
  set bs=2  " Backspace over everything in insert mode
  set shiftwidth=2  " Tabs under smart indenting

  " Set javascript indents for 4
  autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
  autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab
  autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab


  "Ctags and other shortcuts
  "***********************************************
  " map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
  " map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
  map <Leader>rt :!ctags -R --extra=+f --exclude=@/Users/rmeyer/.ctags_ignore .<CR><CR>

  "Sets the tags directory to look backwards till it finds a tags dir
  " set tags=~/.tags;/

 " associate  with ruby filetype
 au BufRead,BufNewFile ^M^W^W    setfiletype ruby
 au BufRead,BufNewFile Guardfile setfiletype ruby
 au BufRead,BufNewFile *.prawn setfiletype ruby

 "Indenting *******************************************************************
 set ai " Automatically set the indent of a new line (local to buffer)
 set si " smartindent (local to buffer)

 " Indents
 let g:rainbow_active = 1
 " au VimEnter * RainbowParentheses
 " au Syntax * RainbowParenthesesLoadRound
 " au Syntax * RainbowParenthesesLoadSquare
 " au Syntax * RainbowParenthesesLoadBraces

 autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
 " for html
 " autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
 autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
 " for css or scss
 autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

 " Scrollbars ******************************************************************
 set sidescrolloff=2
 set numberwidth=4

 " Windows *********************************************************************
 set equalalways " Multiple windows, when created, are equal in size
 set splitbelow splitright

 " Turn off Ex mode forever
 nnoremap Q <nop>

 " Vertical and horizontal split then hop to a new buffer
 :noremap <Leader>v :vsp^M^W^W<cr>
 :noremap <Leader>h :split^M^W^W<cr>

 :noremap <Leader>\ :TagbarToggle<CR>
 :noremap <Leader>j :TagbarToggle<CR>
 " 
 " 
 " 
" Cursor cross-hairs highlights ***********************************************************
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
set cursorline
set cursorcolumn

" Searching *******************************************************************
map <Leader>nh :nohlsearch<CR>

" map <F8> to reindent file
noremap <F8> mzgg=G`z
inoremap <F8> <ESC>mzgg=G`z<Insert>

 " Colors **********************************************************************
 set background=dark
 syntax on " syntax highlighting

 if has('gui_running')
   colorscheme ir_black
   set mouse=a
   set nofoldenable " Turn off folding
   set lazyredraw "faster processing
 else
   " colorscheme kalisi
   colorscheme wombat
   " colorscheme onedark
   " colorscheme ir_black
   " colorscheme tomorrow
   " colorscheme hybrid
   " let ayucolor="mirage"
   " colorscheme ayu

   set termguicolors "Remove this in urxvt
 end


" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
" set ch=2 " Make command line two lines high
" match LongLineWarning '\%120v.*' " Error format when a line is longer than 120


" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word


"Line Number
"*****************************************
set nu  " Line numbers on


" Misc settings ***************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how

set noerrorbells visualbell t_vb=
if has('autocmd')
  "autocmd GUIEnter * set visualbell t_vb=
endif

set noerrorbells
set spell

" File Stuff ******************************************************************
syntax enable
filetype on " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins

" Ruby stuff ******************************************************************
" compiler ruby         " Enable compiler support for ruby
" map <F5> :!ruby %<CR>

" let g:ruby_host_prog = $HOME+'/.asdf/installs/ruby/2.7.2/bin/neovim-ruby-host'
" let g:ruby_host_prog = '/Users/rmeyer/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/neovim-0.8.1/exe/neovim-ruby-host'

" Hard to type *****************************************************************
imap hh =>
imap kk ->
imap aa @
imap zz binding.pry
imap ;; """"<CR><CR>"""
 imap zz import pudb<CR>pudb.set_trace()
 " 
 "   " Change which file opens after executing :Rails command
 "   " ****************************************
 "   " let g:rails_default_file='config/database.yml'
 " 
 "   " Insert New Line *************************************************************
 "   map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
 "   map <Enter> o<ESC>
 " 
 " 
 "   " -----------------------------------------------------------------------------
 "   " |                              Plug-ins                                     |
 "   " -----------------------------------------------------------------------------
 " 
 "   " NERDTree ********************************************************************
 "   :noremap <Leader>n :NERDTreeToggle<CR>
 "   let NERDTreeHijackNetrw=1 " User instead of Netrw when doing an edit /foobar
 "   let NERDTreeMouseMode=1 " Single click for everything
 "   let NERDTreeShowHidden=1
 "   let g:vroom_map_keys = 0
 " 
 "   :noremap <Leader>z :NERDTreeFind<CR>
 "   nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>
 " 
 "   " wildfire  ******************************************************************
 "   " This selects the next closest text object.
 "   let g:wildfire_fuel_map = "<TAB>"
 " 
 "   " This selects the previous closest text object.
 "   let g:wildfire_water_map = "<BS>"
 " 
 "   " SplitJoin ******************************************************************
 "   nmap <Leader>sj :SplitjoinJoin<cr>
 "   nmap <Leader>ss :SplitjoinSplit<cr>
 " 
 "   " Tmux Navigation **********************************************************
 "   let g:tmux_navigator_no_mappings = 1
 " 
 "   nnoremap <silent> <Leader>" :TmuxNavigateLeft<cr>
 "   nnoremap <silent> <Leader>m :TmuxNavigateDown<cr>
 "   nnoremap <silent> <Leader>u :TmuxNavigateUp<cr>
 "   " nnoremap <silent>  :TmuxNavigateRight<cr>
 "   " nnoremap <silent>  :TmuxNavigatePrevious<cr>
 " 
 "   " Plugin key-mappings.
 "   " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
 "   imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 "   smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 "   xmap <C-k>     <Plug>(neosnippet_expand_target)
 " 
 "   " Enable snipMate compatibility feature.
 "   let g:neosnippet#enable_snipmate_compatibility = 1
 " 
 "   " For conceal markers.
 "   " For hiding quotes and double quotes
 "   if has('conceal')
 "     set conceallevel=0 concealcursor=niv
 "   endif
 " 
 "   let g:python_host_prog=$HOME.'/.local/share/virtualenvs/vim2/bin/python2'
 " 
 "   let g:python3_host_prog=$HOME.'/.local/share/virtualenvs/vim3/bin/python3'
 "   let g:python3host_prog=$HOME.'/.local/share/virtualenvs/vim3/bin/python3'
 " 
 "   let g:syntastic_always_populate_loc_list = 1
 "   let g:syntastic_auto_loc_list = 1
 "   let g:syntastic_check_on_open = 1
 "   let g:syntastic_check_on_wq = 0
 " 
 "   " (Optional)Remove Info(Preview) window
 "   set completeopt-=preview
 " 
 "   " (Optional)Hide Info(Preview) window after completions
 "   autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
 "   autocmd InsertLeave * if pumvisible() == 0|pclose|endif
 " 
 "   " (Optional) Enable terraform plan to be include in filter
 "   let g:syntastic_terraform_tffilter_plan = 1
 " 
 "   " Formatting the sucker
 "   let g:terraform_fmt_on_save=1
 " 
 " 
 "   " (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
 "   let g:terraform_completion_keys = 1
 " 
 "   " # END TF Config
 " 
 "   let g:flake8_show_in_file=1  " show
 "   let g:flake8_show_in_gutter=1  " show
 "   let g:flake8_show_quickfix=1  " show (default)
 "   let g:flake8_error_marker='EE'     " set error marker to 'EE'
 "   let g:flake8_warning_marker='WW'   " set warning marker to 'WW
 " 
 "   " Supertab go down not up
 "   let g:SuperTabDefaultCompletionType = "<c-n>"
 " 
 "   " TypeScript
 "   let g:nvim_typescript#javascript_support = 1
 " 
 "   " Turn on line guides
 "   let g:indent_guides_enable_on_vim_startup = 1
 " 
 " 
 "   autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
 " 
 "   " Ale ES Linter
 "   let g:ale_fixers = {
 "         \   'javascript': ['eslint'],
 "         \   'python3': ['black', 'autopep8', 'isort', 'add_blank_lines_for_python_control_statements', 'yapf'],
 "         \   'python': ['black','autopep8', 'isort', 'add_blank_lines_for_python_control_statements', 'yapf'],
 "         \   'ruby': ['remove_trailing_lines', 'rufo', 'sorbet', 'trim_whitespace', 'rubocop'],
 "         \}
 " 
 "   let g:ale_completion_enabled = 0
 "   let g:ale_sign_column_always = 1
 "   let g:ale_lint_on_enter = 1
 "   let g:ale_python_flake8_auto_pipenv = 1
 "   let g:ale_fix_on_save = 1
 " 
 "   let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
 "   let g:ale_sign_error = '✘'
 "   let g:ale_sign_warning = '⚠'
 " 
 "   nmap <silent> <C-e> <Plug>(ale_next_wrap)
 " 
 " 
 "   function! LinterStatus() abort
 "     let l:counts = ale#statusline#Count(bufnr(''))
 "     let l:all_errors = l:counts.error + l:counts.style_error
 "     let l:all_non_errors = l:counts.total - l:all_errors
 "     return l:counts.total == 0 ? 'OK' : printf(
 "           \   '%d⨉ %d⚠ ',
 "           \   all_errors,
 "           \   all_non_errors
 "           \)
 "   endfunction
 " 
 " 
 " " HTML Auto Close
 " let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.ts'
 " let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
 " 
 " :map <Leader>c :Commentary<CR>
 " 
 " " FZF Settings
 " " set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.orig,*/public/assets/*,venv/*,node_modules/*
 " map <Leader>f :GFiles<CR>
 " map <Leader>t :Tags<CR>
 " map <Leader>b :Buffers<CR>
 " 
 " " Define mappings
 " autocmd FileType denite call s:denite_my_settings()
 " function! s:denite_my_settings() abort
 "   nnoremap <silent><buffer><expr> <CR>
 "   \ denite#do_map('do_action')
 " 
 "   nnoremap <silent><buffer><expr> p
 "   \ denite#do_map('do_action', 'preview')
 " 
 "   nnoremap <silent><buffer><expr> q
 "   \ denite#do_map('quit')
 " 
 "   nnoremap <silent><buffer><expr> i
 "   \ denite#do_map('open_filter_buffer')
 " 
 "   nnoremap <silent><buffer><expr> <Space>
 "   \ denite#do_map('toggle_select').'j'
 " endfunction
 " 
 " 
 " " ripgrep
 " set grepprg=rg\ --vimgrep
 " let g:ackprg='rg --vimgrep --no-heading'
 " map <Leader>g :Rg
 " 
 " let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db;.orig;.sql;.doc;*.*.pyc'
 " command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" --glob "!node_modules/*" --glob "!.git/*" --glob "!node_modules" '.shellescape(<q-args>), 1, <bang>0)
 " " command! -bang -nargs=* Find call FZF#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
 " map <Leader>g :Find 
 " 
 " "set Directory for swap and backup files
 " set dir=/tmp
 " 
 " " Put these lines at the very end of your vimrc file.
 " 
 " " Load all plugins now.
 " " Plugins need to be added to runtimepath before helptags can be generated.
 " packloadall

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
]])
