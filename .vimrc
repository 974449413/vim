"$HOME/.vimrc"

"======================"
"1.设置文件编码，解决中文乱码问题"
"======================"
if has("multi_byte")
   set fileencodings=utf-8,ucs-bom,cp936,cp1250,big5,euc-jp,euc-kr,latin1
else
   echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif

"============="
"2. 设置缩进"
"============="
set autoindent"参考上一行的缩进方式进行自动缩进"
filetype indent on "根据文件类型进行缩进"
set softtabstop=4 "制表符转换为4个空格"
set shiftwidth=4 "自动缩进时插入的空格"

"================="
"3. 文件内搜索选项"
"================="
set hlsearch "开启搜索结果的高亮显示"
set incsearch "边输入边搜索(实时搜索)"

"================="
"4. 全模式下的按键映射
"================="

"================="
"5. 普通模式下的按键映射
"================="
nnoremap <F3> :set invhlsearch<CR> "切换高亮显示"

"================="
"6. 插入模式下的按键映射
"================="

"================="
"7. 开启文件的语法高亮
"================="
syntax on
autocmd BufRead,BufNewFile *.c set syntax=c
autocmd BufRead,BufNewFile *.h set syntax=c
autocmd BufRead,BufNewFile *.cpp set syntax=cpp
autocmd BufRead,BufNewFile *.hpp set syntax=cpp
autocmd BufRead,BufNewFile *.lua set syntax=lua
