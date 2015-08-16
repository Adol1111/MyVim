"====================================================================
" （中文）帮助文档下载地址为: http://vimdoc.sourceforge.net/
" 插件管理位于170行			
" 快捷键配置位于100行
"====================================================================

"==================    VIM本身配置    ====================="{{{

set nocompatible							" 禁止vi兼容模式
" set backspace=2								" set backspace=indent,eol,start
											" 修复mac下遇到部分字符无法退格错误

if has("syntax")
	syntax on								" 语法高亮
endif

colorscheme mycolor							" 设置配色方案，vim自带的配色方案保存在/usr/share/vim/vim74/colors目录下
set guifont=Lucida\ Console\ Italic\ 10		" 设置字体"

" 开启文件类型检查
filetype on
filetype plugin on

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 
	" have Vim load indentation rules and plugins according to the detected filetype
	filetype plugin indent on
endif


" 部分内容被注释掉，因为这些选项和Vi有冲突，可以根据自身需要修改
"set ignorecase					" 搜索模式里忽略大小写
"set smartcase					" 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
set autowrite					" 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、
								" :!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
set autoindent					" 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
"set smartindent				" 智能对齐方式
set tabstop=4					" 设置制表符(tab键)的宽度
set softtabstop=4				" 设置软制表符的宽度    
set shiftwidth=4				" (自动) 缩进使用的4个空格
set cindent						" 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     "设置C/C++语言的具体缩进方式
"set backspace=2				" 设置退格键可用
"set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set showmatch					" 设置匹配模式，显示匹配的括号
set linebreak					" 整词换行
set whichwrap=b,s,<,>,[,]		" 光标从行首和行末时可以跳到另一行去
"set hidden						" Hide buffers when they are abandoned
set mouse=a						" Enable mouse usage (all modes)	使用鼠标
set number						" Enable line number    "显示行号
"set previewwindow				" 标识预览窗口
set history=50					" set command history to 50    "历史记录50条

"设置xterm下色彩
if &term =~ "xterm"
	if has("terminfo")
		set t_Co=8
		set t_Sf=[3%p1%dm
		set t_Sb=[4%p1%dm
	else
		set t_Co=8
		set t_Sf=[3%dm
		set t_Sb=[4%dm
	endif
endif

"这告诉 Vim 当覆盖一个文件的时候保留一个备份。
"但 VMS 系统除外，因为 VMS 系统会自动产生备份文件。
"备份文件的名称是在原来的文件名上加上 "~" 字符。
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

"--状态行设置--
set laststatus=2	" 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set ruler           " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。

"--命令行设置--
set showcmd         " 命令行显示输入的命令
set showmode        " 命令行显示vim当前模式

"--find setting--
set incsearch		" 输入字符串就显示匹配点
set hlsearch

set fencs=utf-8,gbk	" 设置字符集支持

"au FocusGained * !wmctrl -r " - gvim" -b add,maximized_vert,maximized_horz		" 窗口最大化

set fdm=marker       " 设置折叠类型
"set fdm=indent

" 在不保存的情况下，可以利用DiffOrig命令讲当前文件与缓冲区里的历史文件做对比，查看修改
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

"}}}

"==================      快捷键       ====================="{{{
"			   常用（原始）命令快捷键映射
"				 插件相关命令看后续配置
"==========================================================
map <Esc><Esc> :noh<CR>
let mapleader=","
" 不同模式下的复制、黏贴、剪切操作
map	 <C-c> "+yy
vmap <C-c> "+y
imap <C-c> <Esc>"+yyi
map <C-x> "+dd
vmap <C-x> "+d
imap <C-x> <Esc>"+ddi
" Command模式下，保留原始的Ctrl V块选择功能，黏贴改成double <C-V>
map <C-v><C-V> "+p
imap <C-v> <Esc>"+pi
" 撤销、重复、全选操作
imap <C-z> <Esc>u
map <C-z> u
imap <C-y> <Esc><C-R>
map <C-y> <C-R>
map <C-a> ggVG
imap <C-a> <Esc>ggVG
" 保存
map  <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>
vmap <C-s> <ESC>:w<CR>






"}}}



"============================================================================================================
"														
"												Vim插件管理						
"														
"============================================================================================================


"=========================================================
"						_Vundle
"=========================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" 需要安装的插件请位于#begin和#end之间

"----------------------使用教程--------------------
"
" Plugin 'tpope/vim-fugitive'					" plugin on GitHub repo
" Plugin 'L9'									" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'git://git.wincent.com/command-t.git'	" Git plugin not hosted on GitHub
" Plugin 'file:///home/gmarik/path/to/plugin'	" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}	" The sparkup vim script is in a subdirectory of this repo called vim.
												" Pass the path to set the runtimepath properly.
" Plugin 'user/L9', {'name': 'newL9'}			" Avoid a name conflict with L9
"
"--------------------------------------------------

"----------------------我的插件--------------------						 搜索词
Plugin	'gmarik/Vundle.vim'			" 用Vundle管理Vundle自身			:_Vundle
Plugin	'tpope/vim-fugitive'		" git插件							
"Plugin	'Align'						" 排版插件
"Plugin	'a.vim'						" 头文件自动跳转					
Plugin	'ctrlp.vim'					" 文件查找							:_CtrlP
Plugin	'Shougo/vimproc.vim'		" VimShell必备组件
Plugin	'Shougo/vimshell.vim'		" Vim下命令行插件					:_VimShell
Plugin	'Lokaltog/vim-powerline'	" 状态栏美化		
Plugin	'delimitMate.vim'			" 自动补齐括号引号等						
"Plugin	'fholgado/minibufexpl.vim'	" Buffer导航条Mini版				:_MiniBuffer		
Plugin	'bufexplorer.zip'			" Buffer导航条完整版				:_BUffer
Plugin	'scrooloose/nerdcommenter'	" 代码注释插件
Plugin	'tpope/vim-repeat'			" 用.代替相同命令
Plugin	'Valloric/YouCompleteMe'	" 自动补全							:_YCM
Plugin	'UltiSnips'					" 常用模板(配合YCM)					:_UltiSnips
Plugin	'honza/vim-snippets'		" 同Ultisnips
Plugin	'The-NERD-tree'				" 导航树							:_Tree
Plugin	'majutsushi/tagbar'			" tags列表（显示函数、变量等)		:_Tagbar
Plugin	'Lokaltog/vim-easymotion'	" 快速跳转可见范围的任意位置		:_EasyMontion
Plugin	'TaskList.vim'				" TODO等任务列表					:_TaskList
Plugin	'DoxygenToolkit.vim'		" 生成Doxygen模板					:_Doxygen
Plugin	'Mark--Karkat'				" 标记不同词高亮					:_Mark
Plugin	'vhdirk/vim-cmake'			" CMake插件							:_CMake


"--------------------------------------------------

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" 帮助文档
" :help vundle 或 :h vundle 或 wiki（https://github.com/gmarik/Vundle.vim/wiki）


"===================    _CtrlP     ======================"{{{
let g:ctrlp_map = '``'						" 启动按键
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip	" 设置MacOSX/Linux忽略文件格式
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(log|jpg|jpeg|png)$',
  \ }
"}}}

"===================   _VimShell   ======================"{{{
map <C-F3> <Esc>:VimShellCurrentDir -split -toggle<CR><Esc><C-W>r
"}}}

"===================    _BUffer    ======================"{{{
map <c-Tab> :bn<CR>
map <c-s-Tab> :bp<CR>
map <F2> :BufExplorer<CR>
"}}}

"===================  _MiniBUffer  ======================"{{{
"let g:miniBufExplUseSingleClick=1
"hi MBENormal               guifg=#bbbbbb guibg=fg
"hi MBEChanged              guifg=#CD5907 guibg=fg
"hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
"hi MBEVisibleChanged       guifg=#F1266F guibg=fg
"hi MBEVisibleActiveNormal  guifg=#FFFF37 guibg=fg
"hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
"}}}

"===================     _YCM      ======================"{{{
nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_invoke_completion = '<C-j>'
let g:ycm_key_list_select_completion = ['<Down>']				" 解除Tab绑定,默认为tab\down

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'		" 配置文件路径
let g:syntastic_always_populate_loc_list = 1					" syntastic功能启动

let g:ycm_error_symbol = '>>'                                   " 编译错误标识符
let g:ycm_warning_symbol = '**'                                 " 编译警告标识符
let g:ycm_confirm_extra_conf=0                                  " 关闭加载.ycm_extra_conf.py提示
let g:ycm_collect_identifiers_from_tags_files=1                 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2                     " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                                      " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1                        " 语法关键字补全
let g:ycm_complete_in_comments = 1                              " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                               " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0     " 注释和字符串中的文字也会被收入补全
" let g:ycm_semantic_triggers = {}
" let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&']
set completeopt=longest,menu                                    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif         " 离开插入模式后自动关闭预览窗口

" YCM 配色
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#000000 guibg=#FFCCFF    " 菜单
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#000000 guibg=#00CCFF " Select
highlight YcmErrorSection guifg=#FFFFFF guibg=#FF3300
"}}}

"===================   _UltiSnips  ======================"{{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}

"===================     _Tree     ======================"{{{
map <C-F9> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 23
"}}}

"===================    _Tagbar    ======================"{{{
map <C-F10> :Tagbar<CR>
let g:tagbar_left = 0
let g:tagbar_width = 30

highlight TagbarKind guifg=#FFFF66 
highlight TagbarSignature guibg=bg guifg=#33FFFF
highlight TagbarVisibilityPublic guifg=#7FFF00
highlight TagbarVisibilityProtected guifg=#00FFFF

"------------整合NERDTree 和 Tagbar到自定义按键-----------"{{{"}}}
function! Tagbar_Tree_Toggle()
	NERDTreeToggle
	TagbarToggle
endfunction

command! -nargs=0 -bar TagbarAndTreeToggle
    \ call Tagbar_Tree_Toggle()

map <F10> <Esc>:TagbarAndTreeToggle<CR>
"}}}

"===================  _EasyMontion ======================"{{{
nmap <leader><leader>. <Plug>(easymotion-W)
nmap <leader><leader>m <Plug>(easymotion-b)
nmap <leader><leader>s <Plug>(easymotion-s)
nmap <leader><leader>t <Plug>(easymotion-t)
nmap <leader><leader><leader>s <Plug>(easymotion-s2)
nmap <leader><leader><leader>t <Plug>(easymotion-t2)
"}}}
					
"===================   _TaskList   ======================"{{{
map <C-F2> :TaskList<CR>
let g:tlTokenList = ["FIXME", "TODO", "ToDo", "todo","XXX"]

"}}}

"===================   _Doxygen    ======================"{{{
map /// <Esc>:Dox<CR>
map //a :DoxAuthor<CR>
let g:DoxygenToolkit_commentType = "C"
"}}}

"===================     _Mark     ======================"{{{
map <C-Esc> :MarkClear<CR>	
"}}}

"===================     _CMake    ======================"{{{
map <F6> <Esc>:cw<CR>
map <C-Up> <Esc>:cn<CR>
map <C-down> <Esc>:cp<CR>
map <F5> <Esc>:make<CR>
map <C-F5> <Esc>:CMake<CR>
map <S-F5> <Esc>:CMakeClean<CR>
"}}}
