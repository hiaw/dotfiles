" Options
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
" set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
" set cursorline " Highlights the current line in the editor
" set hidden " Hide unused buffers
" set autoindent " Indent a new line
" set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
" set number " Shows the line numbers
" set splitbelow splitright " Change the split screen behavior
" set title " Show file title
" set wildmenu " Show a more advance menu
" set cc=80 " Show at 80 column a border for good code style
" filetype plugin indent on   " Allow auto-indenting depending on file type
syntax enable
" set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim

"set ignorecase
"set smartcase


if exists('g:vscode')
"	xmap gc  <Plug>VSCodeCommentary
"	nmap gc  <Plug>VSCodeCommentary
"	omap gc  <Plug>VSCodeCommentary
"	nmap gcc <Plug>VSCodeCommentaryLine

	nnoremap <silent> za <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
	nnoremap <silent> zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
	nnoremap <silent> zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
	nnoremap <silent> zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
	nnoremap <silent> zO <Cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>
	nnoremap <silent> zc <Cmd>call VSCodeNotify('editor.fold')<CR>
	nnoremap <silent> zC <Cmd>call VSCodeNotify('editor.foldRecursively')<CR>

	nnoremap <silent> z1 <Cmd>call VSCodeNotify('editor.foldLevel1')<CR>
	nnoremap <silent> z2 <Cmd>call VSCodeNotify('editor.foldLevel2')<CR>
	nnoremap <silent> z3 <Cmd>call VSCodeNotify('editor.foldLevel3')<CR>
	nnoremap <silent> z4 <Cmd>call VSCodeNotify('editor.foldLevel4')<CR>
	nnoremap <silent> z5 <Cmd>call VSCodeNotify('editor.foldLevel5')<CR>
	nnoremap <silent> z6 <Cmd>call VSCodeNotify('editor.foldLevel6')<CR>
	nnoremap <silent> z7 <Cmd>call VSCodeNotify('editor.foldLevel7')<CR>

	xnoremap <silent> zV <Cmd>call VSCodeNotify('editor.foldAllExcept')<CR>

	nnoremap <silent> s <Cmd>call VSCodeNotify('whichkey.show')<CR>
endif

" Plugins here
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'phaazon/hop.nvim'
" Plug 'tpope/vim-surround'
call plug#end()

" Hop
map <Space> <Cmd>HopWord<CR>
" omap s v<Cmd>HopWord<CR>

lua << EOF
local hop = require'hop'
hop.setup {
	create_hl_autocmd  = false,
	uppercase_labels = true,
}
EOF
