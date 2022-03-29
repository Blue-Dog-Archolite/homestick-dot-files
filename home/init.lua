vim.call('plug#begin', '~/.config/nvim/plugged')

vim.cmd([[

 " let g:python3_host_prog='/Users/rmeyer/.local/share/virtualenvs/vim3/bin/python3'
 " let g:python3host_prog='/Users/rmeyer/.local/share/virtualenvs/vim3/bin/python3'
 " let g:black_virtualenv=$HOME.'/.local/share/virtualenvs/vim3/'
 " let g:black_virtualenv='/Users/rmeyer/.local/share/virtualenvs/vim_env-C6wbvWfk-RV8du6qt'

  ]])


-- Plugs-Start
local Plug = vim.fn['plug#']

Plug 'tpope/vim-sensible'

Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

-- GoLang
Plug('fatih/vim-go', {['do'] = ':GoUpdateBinaries' })

-- Yarp for text wrapping and pull
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
Plug 'ntpeters/vim-better-whitespace'
Plug 'folke/which-key.nvim'
Plug 'b0o/mapx.nvim'


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
Plug 'junegunn/fzf.vim'
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
-- Plug('psf/black') --, {'tag', '*'})
Plug('neoclide/coc.nvim', {['do'] ='yarn install --frozen-lockfile'})

vim.call('plug#end')

--Plugs-end

vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true

vim.g.mapleader = ","

vim.opt.wrap = false
vim.opt.shell = "/bin/bash"
vim.opt.filetype = "off"

vim.opt.autowrite = true    -- Writes on make/shell commands

-- "Before merge of files these existed
vim.cmd("set cf")  -- set cf " Enable error files & error jumping.

vim.cmd("syntax enable")
vim.cmd("set timeoutlen=250")
vim.cmd("set history=1024")        -- Number of things to remember in history.

require'mapx'.setup{ global = true, whichkey = true }

-- Hard to type *****************************************************************
imap("jj", "<ESC>", "Exit insert mode")
imap("kk", "->", "Arrow")
imap("aa", "@", "At Sign")
imap("zz", "binding.pry", "Setup binding.pry for ruby")
-- imap("zz", "import pudb<CR>pudb.set_trace()", "Set up debugging for python")
nnoremap("Q", "<nop>", "Don't let Q do ANYTHING")
nnoremap("q", "<nop>", "Don't let Q do ANYTHING")

-- TODO Add WhichKey Group Names
local noremap_functions = {
  f = ":GFiles<CR> ",
  t = ":Tags<CR>",
  j = ":TagbarToggle<CR>",
  c = ":Commentary<CR>",
  b = ":Buffers<CR>",
  g = ":Find ",
  w = ":WhichKey ",
  r = ":edit!<CR>",
  v = ":vsp^M^W^W<cr>",
  h =  ":split^M^W^W<cr>",
  rs = ":Gsearch "
}

for key, command in pairs(noremap_functions) do
  nnoremap( string.format('<Leader>%s', key), command, command)
end

--which_key: health#which_key#check
--
--========================================================================
--## WhichKey: checking conflicting keymaps
--  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **"gc"**
--  - INFO: rhs: `<Plug>Commentary`
--  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **"yS"**
--  - INFO: rhs: `<Plug>YSurround`
--  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **"ys"**
--  - INFO: rhs: `<Plug>Ysurround`
--  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **",m"**
--  - INFO: rhs: `:TmuxNavigateDown<CR>`
--  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **",w"**
--  - INFO: rhs: `:WhichKey `
--  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **",n"**
--  - INFO: rhs: `:NERDTreeToggle<CR>`
--  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **",b"**
--  - INFO: rhs: `:Buffers<CR>`
--  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **",t"**
--  - INFO: rhs: `:Tags<CR>`
--  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **",c"**
--  - INFO: rhs: `:Commentary<CR>`
--  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **",r"**
--  - INFO: rhs: `:edit!<CR>`
--  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **"L"**
--  - INFO: rhs: ` `
--  - WARNING: conflicting keymap exists for mode **"i"**, lhs: **"<C-X>"**
--  - INFO: rhs: `<C-R>=<SNR>126_ManualCompletionEnter()<CR>`
--  - WARNING: conflicting keymap exists for mode **"o"**, lhs: **",n"**
--  - INFO: rhs: `:NERDTreeToggle<CR>`
--  - WARNING: conflicting keymap exists for mode **"v"**, lhs: **",s"**
--  - INFO: rhs: `:StripWhitespace<CR>`
--  - WARNING: conflicting keymap exists for mode **"v"**, lhs: **",n"**
--  - INFO: rhs: `:NERDTreeToggle<CR>`

-- " Turn off Ex mode forever
 -- Required
vim.cmd("filetype plugin indent on")

vim.opt.ignorecase = true

vim.cmd([[
 "set Directory for swap and backup files
 set dir=/tmp

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " syntax enable

 if has('unnamedplus')
   set clipboard=unnamed,unnamedplus
   set clipboard+=unnamed  " Yanks go on clipboard instead.
 endif
 ]])


-- CoC.vim


vim.cmd([[
 " Coc.Vim
 let g:coc_global_extensions = [
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



-- Global Options
vim.opt.cindent = false
vim.opt.autoindent = false
vim.opt.smarttab = false
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.smartindent = false
vim.opt.shiftwidth=4

-- Visual
vim.opt.mat = 5  -- Bracket blinking.
vim.opt.list = false

--vim.o.novisualbell = false  -- No blinking .
--vim.o.noerrorbells = false  -- No noise.



vim.cmd([[
 " #######################################################################
 " Airline Vim Tagbar Setup
 " if you want to disable auto detect, comment out those two lines
 "let g:airline#extensions#disable_rtp_load = 1
 let g:airline_extensions = ['branch', 'hunks', 'coc']

 set cinoptions=:0,p0,t0
 set cinwords=if,else,while,do,for,switch,case
 set formatoptions=tcqr
 ]])


-------------------------------------------------------------------------------
--|                            VIM Settings                                   |
--|                   (see gvimrc for gui vim settings)                       |
--|                                                                           |
--| Some highlights:                                                          |
--|   jj = <esc>  Very useful for keeping your hands on the home row          |
--|   ,n = toggle NERDTree off and on                                         |
--|                                                                           |
--|   ,f = fuzzy find all files                                               |
--|   ,b = fuzzy find in all buffers                                          |
--|   ,p = go to previous file                                                |
--|                                                                           |
--|   hh = inserts '=>'                                                       |
--|   aa = inserts '@'                                                        |
--|                                                                           |
--|   ,h = new horizontal window                                              |
--|   ,v = new vertical window                                                |
--|                                                                           |
--|   ,i = toggle invisibles                                                  |
--|                                                                           |
--|   enter and shift-enter = adds a new line after/before the current line   |
--|                                                                           |
--|   :call Tabstyle_tabs = set tab to real tabs                              |
--|   :call Tabstyle_spaces = set tab to 2 spaces                             |
--|                                                                           |
--| Put machine/user specific settings in ~/.vimrc.local                      |
--|  CTAGS  C-] - go to definition                                            |
--|  C-T - Jump back from the definition.                                     |
--|  C-W C-] - Open the definition in a horizontal split                      |
--|  C-\ - Open the definition in a new tab                                   |
--|  A-] - Open the definition in a vertical split                            |
--|
--|  After the tags are generated. You can use the following keys to tag into and tag out of functions:
--|
--|  Ctrl-Left_MouseClick - Go to definition                                  |
--|  Ctrl-Right_MouseClick - Jump back from definition                        |

nmap("<Leader>P", "+P")
nmap("<Leader>p", "+p")
vmap("<Leader>P", "+P")
vmap("<Leader>d", "+d")
vmap("<Leader>p", "+p")
vmap("<Leader>y", "+y")

-- Rspec
map("Leader>t", ":call RunCurrentSpecFile()<CR>")
map("Leader>s", ":call RunNearestSpec()<CR>")
map("Leader>l", ":call RunLastSpec()<CR>")
map("Leader>a", ":call RunAllSpecs()<CR>")

vim.g.rspec_command = "bundle exec rspec --drb {spec}"
vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1

map("<Leader>l", ":lopen<CR>")

vim.cmd([[
 set listchars=tab:>-

 "improve autocomplete menu color
 highlight Pmenu ctermbg=238 gui=bold

 " Removes trailing spaces
 " BufWritePre * :%s/\s\+$//e
 " autocmd BufRead *.py execute ':Black'
 " autocmd BufWritePre *.py execute ':Black'

  ]])

vim.g.conceallevel=0

vim.cmd([[
  " Format hash
  nnoremap <F8> $v%lohc<CR><CR><Up><C-r>"<Esc>:s/,/,\r/g<CR>:'[,']norm ==<CR>
]])

vim.opt.ts=2  -- Tabs are 2 spaces
vim.opt.bs="2"  -- Backspace over everything in insert mode
vim.opt.shiftwidth=2  -- Tabs under smart indenting

vim.cmd([[
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
  "set tags=expand('/Users/rmeyer/tmp/tags/')

  " enable gtags module
  let g:gutentags_modules = ['ctags', 'gtags_cscope']

  " config project root markers.
  let g:gutentags_project_root = ['.root']

  " generate datebases in my cache directory, prevent gtags files polluting my project
  let g:gutentags_cache_dir = expand('~/.cache/tags')

  " change focus to quickfix window after search (optional).
  let g:gutentags_plus_switch = 1

 " associate  with ruby filetype
 au BufRead,BufNewFile ^M^W^W    setfiletype ruby
 au BufRead,BufNewFile Guardfile setfiletype ruby
 au BufRead,BufNewFile *.prawn setfiletype ruby

 "Indenting *******************************************************************
 set ai " Automatically set the indent of a new line (local to buffer)
 set si " smartindent (local to buffer)

 " Indents
 let g:rainbow_active = 1

 autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
 " for html
 autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
 " for css or scss
 autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

 " Scrollbars ******************************************************************
 set sidescrolloff=2
 set numberwidth=4

 " Windows *********************************************************************
 set equalalways " Multiple windows, when created, are equal in size
 set splitbelow splitright

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
   " colorscheme ir_black
   colorscheme wombat
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
set ch=2 " Make command line two lines high
match LongLineWarning '\%120v.*' " Error format when a line is longer than 120


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


 " Change which file opens after executing :Rails command
 " ****************************************
 " let g:rails_default_file='config/database.yml'

 " Insert New Line *************************************************************
 map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
 map <Enter> o<ESC>

 " -----------------------------------------------------------------------------
 " |                              Plug-ins                                     |
 " -----------------------------------------------------------------------------

 " NERDTree ********************************************************************
 :noremap <Leader>n :NERDTreeToggle<CR>
 let NERDTreeHijackNetrw=1 " User instead of Netrw when doing an edit /foobar
 let NERDTreeMouseMode=1 " Single click for everything
 let NERDTreeShowHidden=1
 let g:vroom_map_keys = 0

 :noremap <Leader>z :NERDTreeFind<CR>
 nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

 " wildfire  ******************************************************************
 " This selects the next closest text object.
 let g:wildfire_fuel_map = "<TAB>"

 " This selects the previous closest text object.
 let g:wildfire_water_map = "<BS>"

 " SplitJoin ******************************************************************
 nmap <Leader>sj :SplitjoinJoin<cr>
 nmap <Leader>ss :SplitjoinSplit<cr>

 " Tmux Navigation **********************************************************
 let g:tmux_navigator_no_mappings = 1

 nnoremap <silent> <Leader>" :TmuxNavigateLeft<cr>
 nnoremap <silent> <Leader>m :TmuxNavigateDown<cr>
 nnoremap <silent> <Leader>u :TmuxNavigateUp<cr>
 " nnoremap <silent>  :TmuxNavigateRight<cr>
 " nnoremap <silent>  :TmuxNavigatePrevious<cr>

 " Plugin key-mappings.
 " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 xmap <C-k>     <Plug>(neosnippet_expand_target)

 " Enable snipMate compatibility feature.
 let g:neosnippet#enable_snipmate_compatibility = 1

 " For conceal markers.
 " For hiding quotes and double quotes
 if has('conceal')
   set conceallevel=0 concealcursor=niv
 endif

 let g:python_host_prog=$HOME.'/.local/share/virtualenvs/vim2/bin/python2'

 let g:python3_host_prog='/Users/rmeyer/.local/share/virtualenvs/vim3/bin/python3'
 let g:python3host_prog='/Users/rmeyer/.local/share/virtualenvs/vim3/bin/python3'
 " let g:black_virtualenv=$HOME.'/.local/share/virtualenvs/vim3/bin/python3'
 " let g:black_virtualenv='/Users/rmeyer/.local/share/virtualenvs/vim_env-C6wbvWfk-RV8du6qt'

 let g:syntastic_always_populate_loc_list = 1
 let g:syntastic_auto_loc_list = 1
 let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 0

 " (Optional)Remove Info(Preview) window
 set completeopt-=preview

 " (Optional)Hide Info(Preview) window after completions
 autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif

  " (Optional) Enable terraform plan to be include in filter
  let g:syntastic_terraform_tffilter_plan = 1

  " Formatting the sucker
  let g:terraform_fmt_on_save=1


  " (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
  let g:terraform_completion_keys = 1

  " # END TF Config

  let g:flake8_show_in_file=1  " show
  let g:flake8_show_in_gutter=1  " show
  let g:flake8_show_quickfix=1  " show (default)
  let g:flake8_error_marker='EE'     " set error marker to 'EE'
  let g:flake8_warning_marker='WW'   " set warning marker to 'WW

  " Supertab go down not up
  let g:SuperTabDefaultCompletionType = "<c-n>"

  " TypeScript
  let g:nvim_typescript#javascript_support = 1

  " Turn on line guides
  let g:indent_guides_enable_on_vim_startup = 1


  autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

  " Ale ES Linter
  let g:ale_fixers = {
        \   'javascript': ['eslint'],
        \   'python3': ['black', 'autopep8', 'isort', 'add_blank_lines_for_python_control_statements', 'yapf'],
        \   'python': ['black','autopep8', 'isort', 'add_blank_lines_for_python_control_statements', 'yapf'],
        \   'ruby': ['remove_trailing_lines', 'rufo', 'sorbet', 'trim_whitespace', 'rubocop'],
        \}

  let g:ale_completion_enabled = 0
  let g:ale_sign_column_always = 1
  let g:ale_lint_on_enter = 1
  let g:ale_python_flake8_auto_pipenv = 1
  let g:ale_fix_on_save = 1

  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '⚠'

  nmap <silent> <C-e> <Plug>(ale_next_wrap)


    function! LinterStatus() abort
      let l:counts = ale#statusline#Count(bufnr(''))
      let l:all_errors = l:counts.error + l:counts.style_error
      let l:all_non_errors = l:counts.total - l:all_errors
      return l:counts.total == 0 ? 'OK' : printf(
            \   '%d⨉ %d⚠ ',
            \   all_errors,
            \   all_non_errors
            \)
    endfunction


  " HTML Auto Close
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.ts'
  let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'


  " ripgrep
  set grepprg=rg\ --vimgrep
  let g:ackprg='rg --vimgrep --no-heading'
  " map <Leader>g :Rg

  let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db;.orig;.sql;.doc;*.*.pyc,tags'
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" --glob "!node_modules/*" --glob "!.git/*" --glob "!node_modules" '.shellescape(<q-args>), 1, <bang>0)
  " command! -bang -nargs=* Find call FZF#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
  " map <Leader>g :Find

  let g:kite_supported_languages = ['*']

  let g:kite_tab_complete=1
set completeopt+=menuone
set completeopt+=noselect
set completeopt+=preview
autocmd CompleteDone * if !pumvisible() | pclose | endif

  " Put these lines at the very end of your vimrc file.

  " Load all plugins now.
  " Plugins need to be added to runtimepath before helptags can be generated.
  packloadall

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
]])
