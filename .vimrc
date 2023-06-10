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
map <A> <C> "Alt -> Ctrl"
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" 将左 Alt 键映射为 Control 键
if has('gui_running') || has('macunix')
  " GUI 和 MacVim
  let $MY_XMODMAP = system("xmodmap -pke")
  :silent! execute "set <A-Left>=\e\e[1;5D"
  :silent! execute "set <A-Right>=\e\e[1;5C"
  :silent! execute "set <A-Up>=\e\e[1;5A"
  :silent! execute "set <A-Down>=\e\e[1;5B"
else
  " 终端 Vim
  set ttimeoutlen=50
  let mapleader=","

  function! SetAltAsCtrl()
    let l:alt_keycodes = ['56', '108']
    for l:keycode in l:alt_keycodes
      :silent! execute "!xmodmap -e 'remove mod1 = Alt_L'"
      :silent! execute "!xmodmap -e 'add control = Alt_L'"
      :silent! execute "!xmodmap -e 'keycode " . l:keycode . " = Control_L'"
    endfor
  endfunction

  function! SetCtrlAsCtrl()
    let l:ctrl_keycodes = ['37', '105']
    for l:keycode in l:ctrl_keycodes
      :silent! execute "!xmodmap -e 'remove control = Control_L'"
      :silent! execute "!xmodmap -e 'add control = Control_L'"
      :silent! execute "!xmodmap -e 'keycode " . l:keycode . " = Control_L'"
    endfor
  endfunction

  call SetAltAsCtrl()
  map <silent> <F12> :call SetCtrlAsCtrl()<cr>
endif

"================="
"5. 普通模式下的按键映射
"================="
nnoremap <F3> :set invhlsearch<CR> "切换高亮显示"

"================="
"6. 插入模式下的按键映射
"================="
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i
"inoremap " ""<Esc>i
"inoremap ; <Esc>A;
"inoremap ) <Esc>la
"inoremap ] <Esc>la
"inoremap } <Esc>la
