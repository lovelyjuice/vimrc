call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree' 
Plug 'bling/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'w0rp/ale'

call plug#end()

set nu"显示行数
set nocompatible
syntax on " 允许用指定语法高亮配色方案替换默认方案
colorscheme onedark "设置主题
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 基于缩进或语法进行代码折叠
"set foldmethod=indent"缩进折叠
set foldmethod=syntax "语法折叠
" 启动 vim 时关闭折叠代码
set nofoldenable
" 用法：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠。

" NerdTree config

" 使用F2调出窗口
map <F2> :NERDTreeToggle<CR>
" 关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"打开vim时如果没有打开某个文件，则自动打开NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 打开文件夹时用NerdTree打开
" autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 打开新的buffer时自动定位到编辑窗口
autocmd VimEnter * wincmd p
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
" let NERDTreeWinSize=31


"Airline Config

"设置airline的主题
let g:airline_theme='onedark'
"设置ALE的错误提示出现在airline
let g:airline#extensions#ale#enabled = 1


"ALE Config

" 使侧边栏始终可见
let g:ale_sign_column_always = 1


"NerdCommenter Config

" 注释符号后面自动增加一个空格
let g:NERDSpaceDelims = 1


" neocomplete config
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" 使用Tab替换Ctrl+N作为补全快捷键
inoremap <expr><TAB>pumvisible() ? "\<C-n>" : "\<TAB>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
