set nocompatible
call plug#begin('~/.vim/plugged')

" Theme gruvbox
Plug 'morhetz/gruvbox'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Surround
Plug 'tpope/vim-surround'

" git wrapper
Plug 'tpope/vim-fugitive'

" Nerdcommenter automatically commenter
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
nmap <leader>cc :NERDComComment<CR>

" Nerdtree 
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize=20 
let NERDTreeShowLineNumbers=1                   " display column number
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let g:nerdtree_tabs_open_on_console_startup=1   " When Terminal dispaly vim share same nerdtree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
\ }
map <F2> :NERDTreeToggle<CR>

" Tagbar
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
let g:tagbar_width=20
let g:tagbar_autofocus=1
let g:tagbar_right= 1
nmap <F3> :TagbarToggle<CR>

" Emmet default shortcuts C-Y,
Plug 'mattn/emmet-vim', { 'for': ['css', 'php', 'html'] }
let g:user_emmet_mode='in'

"YCM = YouCompleteMe
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'zxqfl/tabnine-vim'
let g:ycm_max_num_candidates = 50
let g:ycm_show_diagnostics_ui = 1
let g:ycm_max_num_identifier_candidates = 10
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_add_preview_to_completeopt = 1                    " default 0
let g:ycm_autoclose_preview_window_after_completion = 1     " default 0
let g:ycm_autoclose_preview_window_after_insertion = 1      " default 0
let g:ycm_max_diagnostics_to_display = 4                    " default 30
let g:ycm_seed_identifiers_with_syntax = 1                  " default 0
let g:ycm_complete_in_comments=1
let g:ycm_filetype_blacklist = {
    \ 'tagbar': 1,
    \ 'qf': 1,
    \ 'notes': 1,
    \ 'markdown': 1,
    \ 'unite': 1,
    \ 'text': 1,
    \ 'vimwiki': 1,
    \ 'pandoc': 1,
    \ 'infolog': 1,
    \ 'mail': 1
\}

" linting/fixing for Language Server
Plug 'dense-analysis/ale', { 'for': [ 'javascript' ] }
let b:ale_fixers = ['prettier', 'eslint']
let b:ale_linters = ['eslint']
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" Add syntax
" Javascript syntax
Plug 'pangloss/vim-javascript', { 'for': 'Javascript' }
augroup filetype javascript syntax=javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" Typescript syntax
Plug 'leafgarland/typescript-vim', { 'for': 'Typescript' }

" Css postcss
Plug 'alexlafroscia/postcss-syntax.vim', { 'for': 'css' }
autocmd FileType css set iskeyword+=-

" Pug syntax
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }

" End
call plug#end()

filetype on
syntax on

set number
set smartindent
set autoindent
set confirm
set nobackup
set ruler
set showmatch
set noswapfile
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
set hlsearch
set wildmenu
set noexpandtab

set laststatus=2
set fenc=utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,chinese,cp936
set bufhidden=hide
set expandtab tabstop=4
set si ai ci cinkeys-=0# cinoptions=g0,:0
set shiftwidth=2
set softtabstop=2
set tabstop=2
set scrolloff=3
set formatoptions=tcrqn
set mouse-=a
set iskeyword+=_,$,@,%,#,-

set t_Co=256
set background=dark
colorscheme gruvbox

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
