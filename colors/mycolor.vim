" Vim color file
" Name:	MyColor

" Init
set background=dark
hi clear
if has("gui_running")
	set cursorline
endif
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "mycolor"

if has("gui_running")
	hi Cursor guifg=Black   guibg=Yellow			  "光标所在的字符
	hi CursorLine guibg=#555555 					  "光标所在的屏幕列
	hi CursorIM	gui=NONE guifg=fg guibg=#FF0000
	hi CursorColumn	gui=NONE guifg=NONE guibg=#001630 "光标所在的屏幕行
	hi Directory gui=BOLD guifg=#20B2AA guibg=BG	  "目录名
	hi DiffAdd	gui=NONE guifg=fg guibg=#0066CC		  "diff: 增加的行
	hi DiffChange gui=NONE guifg=fg guibg=#008B00	  "diff: 改变的行
	hi DiffDelete gui=NONE guifg=#8B3A62 guibg=BG	  "diff: 删除的行
	hi DiffText guifg=#007F00 guibg=grey20 gui=NONE   "diff: 改变行里的改动文本
	hi Folded	gui=BOLD guifg=#E0FFFF guibg=#104E8B  "用于关闭的折叠的行
	hi FoldColumn	gui=BOLD guifg=#1C86EE guibg=#101020
	hi LineNr  guifg=#FFFFFF gui=NONE   "置位number选项时的行号
	hi ModeMsg	gui=NONE guifg=#7CFC00 guibg=#00688B  "showmode 消息(INSERT)
	hi MoreMsg	gui=BOLD guifg=#00FF7F guibg=BG		  "|more-prompt|
	hi NonText	gui=NONE guifg=#191970 guibg=BG		  "窗口尾部的~和@
	hi Normal guifg=White   guibg=#333333			  "Black正常内容
	hi Question	gui=BOLD guifg=#00FF00 guibg=BG		  "提示和 yes/no 问题
	hi IncSearch gui=BOLD guifg=#FF0000 guibg=BG	  
	hi Search guibg=White							  "最近搜索模式的高亮
	hi SpecialKey gui=NONE guifg=#000000 guibg=#191970 "特殊键，字符和'listchars
	hi SpellBad guifg=#FF0000 guibg=grey20 gui=NONE   "拼写检查器不能识别的单词
	hi SpellCap guifg=#BF0000 guibg=grey20 gui=NONE	  "应该大写字母开头的单词
	hi StatusLine	gui=NONE guifg=#FFFFFF guibg=#203080 "当前窗口的状态行
	hi StatusLineNC	gui=NONE guifg=#CDB79E guibg=#102436 "非当前窗口的状态行
	hi Title	gui=BOLD guifg=#1E90FF guibg=BG		  ":set all 等输出的标题
	hi VertSplit	gui=NONE guifg=#CDB79E guibg=#102436 "分离垂直分割窗口的列
	hi Visual	gui=REVERSE guifg=#473C8B guibg=#FFFF00 "可视模式的选择区
	hi WarningMsg guifg=#FF003F guibg=grey20 gui=NONE "警告消息
	hi WildMenu	gui=BOLD guifg=#000000 guibg=#7FFF00  "wildmenu补全的当前匹配
	"========================================================================"	
	hi Comment guifg=#24FF24     "9933CC			"任何注释
	"----------------------------------------------------------"
	hi Constant guifg=#BF007F gui=NONE  "任何常数
	hi String 	guifg=#FF7F7F gui=NONE	"一个字符串常数: "字符串"
	hi Character guifg=#FF3F3F gui=NONE "一个字符常数: 'c'、'\n'
	hi Number   guifg=#FF7F3F gui=NONE  "一个数字常数: 234、0xff
	hi Float  	guifg=#FF7F3F gui=NONE	"一个浮点常数: 2.3e10
	hi Boolean  guifg=#FF7F7F gui=BOLD	"一个布尔型常数: TRUE、false
	"----------------------------------------------------------"
	hi Identifier guifg=#007FBF gui=NONE "任何变量名
	hi Function  guifg=#00BFBF gui=NONE "函数名 (也包括:类的方法名)
	"----------------------------------------------------------"
	"hi Label guifg=#FF8C1A gui=BOLD		  "case、default 等
	hi Statement guifg=#FFFF99"#FFFF33 gui=BOLD	  "任何语句
	"hi Conditional guifg=#FFFF33 gui=BOLD "if、then、else、endif、switch
	"hi Repeat guifg=#FF8C1A gui=BOLD    "for、do、while 等
	hi Operator guifg=#99CCFF"00E6E6 gui=BOLD  "'sizeof'、'+'、'*' 等
	"hi Keyword guifg=#BFBF00 gui=NONE  "任何其它关键字
	hi Exception guifg=#BF7F00 gui=BOLD "try、catch、throw
	"----------------------------------------------------------"
	hi PreProc   guifg=#FF63FF gui=BOLD   "通用预处理命令
	hi Include   guifg=#CC99FF gui=BOLD	  "预处理命令 #include
	hi Define    guifg=#FF63FF gui=BOLD   "预处理命令 #define
	hi Macro     guifg=#FF63FF gui=BOLD   "等同于Define
	hi PreCondit guifg=#FF007F gui=BOLD   "预处理命令 #if、#else、#endif
	"----------------------------------------------------------"
	hi Type		    guifg=#00ffff gui=BOLD 	"int、long、char 等
	hi StorageClass guifg=#7FFF00 gui=BOLD  "static、register、volatile 等
	hi Structure    guifg=#00FF7F gui=BOLD  "struct、union、enum 等
	hi Typedef      guifg=#3FFF3F gui=BOLD  "一个typedef
	"----------------------------------------------------------"
	hi Special     	  guifg=#BFBF3F gui=NONE  "任何特殊符号
	hi SpecialChar	  guifg=#FFBF3F gui=NONE  "常数中的特殊字符
	hi Tag            guifg=#BFFF3F gui=NONE  "这里可以使用 CTRL-]
	hi Delimiter      guifg=#FF3F00 gui=NONE  "需要注意的字符
	hi SpecialComment guifg=#FF00BF gui=NONE  "注释里的特殊字符
	hi Debug          guifg=#BF00FF gui=NONE  "调试语句
	"----------------------------------------------------------"
	hi Underlined  guifg=#3F3FFF  gui=UNDERLINE   "需要突出的文本，HTML 链接
	hi Ignore      guifg=#7F7F7F  gui=NONE        "留空，被隐藏
	hi Error       guifg=#FFFF00  guibg=#FF0000	gui=NONE "任何有错的构造
	hi Todo        guifg=#FFFFFF  guibg=#0000FF	gui=NONE "任何需要特殊注意的部分
else
	set t_Co=256
	hi Cursor ctermfg=Black ctermbg=Yellow 
	hi CursorLine cterm=NONE ctermbg=235
	hi CursorIM cterm=NONE ctermfg=black ctermbg=red
	hi Directory cterm=NONE ctermfg=darkcyan ctermbg=Black
	hi DiffAdd cterm=NONE ctermfg=White ctermbg=darkcyan
	hi DiffChange cterm=NONE ctermfg=White ctermbg=darkgreen
	hi DiffDelete cterm=NONE ctermfg=darkmagenta ctermbg=black
	hi Folded cterm=BOLD ctermfg=white ctermbg=darkblue
	hi FoldColumn cterm=BOLD ctermfg=blue ctermbg=darkgray
	hi IncSearch cterm=BOLD ctermfg=Red ctermbg=Black
	hi ModeMsg cterm=NONE ctermfg=yellow ctermbg=darkcyan
	hi MoreMsg cterm=BOLD ctermfg=darkcyan ctermbg=black
	hi NonText cterm=NONE ctermfg=darkblue ctermbg=black
    hi Normal ctermfg=NONE ctermbg=NONE 
	hi Question cterm=BOLD ctermfg=green ctermbg=black
	hi Search ctermbg=White 
	hi SpecialKey cterm=NONE ctermfg=Black ctermbg=darkblue
	hi SpellBad ctermfg=lightred ctermbg=Black cterm=BOLD
	hi SpellCap ctermfg=lightred ctermbg=Black cterm=BOLD
	hi StatusLine cterm=NONE ctermfg=white ctermbg=darkblue
	hi StatusLineNC cterm=NONE ctermfg=darkgray ctermbg=darkblue
	hi Title cterm=BOLD ctermfg=lightblue ctermbg=black
	hi VertSplit cterm=NONE ctermfg=darkgray ctermbg=darkblue
	hi Visual cterm=REVERSE ctermbg=yellow ctermfg=darkblue
	hi WarningMsg ctermfg=lightmagenta ctermbg=black cterm=BOLD
	hi WildMenu  cterm=BOLD ctermfg=black ctermbg=darkgreen
	""""""""""""""""""""""""""""""""""""""""""""""""""""	
	hi Comment ctermfg=98
	"------------- -------------------------------------"
	hi Constant  ctermfg=brown  	  ctermbg=black cterm=BOLD 
	hi String    ctermfg=lightmagenta ctermbg=black cterm=BOLD 
	hi Character ctermfg=lightmagenta ctermbg=black cterm=BOLD
	hi Number    ctermfg=lightgreen   ctermbg=black cterm=BOLD
	hi Float     ctermfg=lightgreen   ctermbg=black cterm=BOLD
	hi Boolean   ctermfg=lightmagenta ctermbg=black cterm=BOLD
	"---------------------------------------------------"
	hi Identifier ctermfg=lightcyan   ctermbg=black cterm=BOLD
	hi Function   ctermfg=lightcyan   ctermbg=black cterm=BOLD
	"---------------------------------------------------"
	hi Statement 	ctermfg=202
	hi Conditional  ctermfg=yellow    ctermbg=black cterm=BOLD
	hi Repeat       ctermfg=yellow    ctermbg=black cterm=BOLD
	hi Label        ctermfg=yellow    ctermbg=black cterm=BOLD
	hi Operator     ctermfg=yellow    ctermbg=black cterm=BOLD
	hi Keyword      ctermfg=yellow    ctermbg=black cterm=BOLD
	hi Exception    ctermfg=lightred  ctermbg=black cterm=BOLD
	"---------------------------------------------------"
	hi PreProc   ctermfg=lightmagenta  ctermbg=black cterm=BOLD
	hi Include ctermfg=220 
	hi Define    ctermfg=lightmagenta  ctermbg=black cterm=BOLD
	hi Macro     ctermfg=lightmagenta  ctermbg=black cterm=BOLD
	hi PreCondit ctermfg=lightred      ctermbg=black cterm=BOLD
	"---------------------------------------------------"
	hi Type ctermfg=lightgreen ctermbg=black cterm=BOLD
	hi StorageClass ctermfg=lightmagenta ctermbg=black cterm=BOLD
	hi Structure ctermfg=lightgreen ctermbg=black cterm=BOLD
	hi Typedef ctermfg=lightcyan ctermbg=black cterm=BOLD
	"---------------------------------------------------"
	hi Special     		 ctermfg=brown ctermbg=black cterm=BOLD 
	hi SpecialChar		 ctermfg=brown ctermbg=black cterm=BOLD
	hi Tag 	   		 ctermfg=lightcyan ctermbg=black cterm=BOLD 
	hi Delimiter    ctermfg=lightgreen ctermbg=black cterm=BOLD
	hi SpecialComment ctermfg=lightred ctermbg=black cterm=BOLD
	hi Debug 		 ctermfg=lightcyan ctermbg=black cterm=BOLD
	"---------------------------------------------------"
	hi Underlined ctermfg=lightcyan ctermbg=black cterm=BOLD
	hi Ignore     ctermfg=darkgrey  ctermbg=black cterm=NONE
	hi Error      ctermfg=yellow    ctermbg=lightred cterm=BOLD 
	hi Todo       ctermfg=lightgrey ctermbg=lightblue cterm=BOLD
endif
