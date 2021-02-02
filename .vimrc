"--------------------------------------------------------------------
"
"
" 下面是自己自己使用的一些配置
" 有自己定义的一些映射键盘
" 然后还加载了vim自带的一个defaults.vim脚本
"
"
"--------------------------------------------------------------------
"
"add the vim default configure which from vim manual
"please check $VIMRUNTIME and check the location of the defaults.vim
source $VIMRUNTIME/defaults.vim

"定义<Leader>键，以及cscope指定绝对路径
set csre
let mapleader=","

"print Date: from vim manual
"Fri Jun 15 12:54:34 CEST 2001
map <F2> GoDate:<Esc>:read !date<CR>

"add()or{} with a word, cursor locate first char
noremap \p i(<Esc>ea)<Esc>
noremap \c i{<Esc>ea}<Esc>

"show line num
set nu

"各种括号的自动补全
"inoremap { <Esc>o{<CR>}<Esc>O 这个有问题，会缩进5格 
inoremap { {<CR>}<ESC>O
inoremap " ""<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i


"缩进和<Tab>键的方案
"使用tabstop, shiftwidth等于4的方案
"这种方案必须配置expandtab为开，然后配合">>", "<<", "<C-d>"(插入模式下)
"这些缩进排版键，弥补<Tab>扩展成空格的困扰
"具体请查看自己关于缩进和<Tab>键的笔记
set tabstop=4
set autoindent
set shiftwidth=4 "一个缩进代表了多少空格
"set smartindent "这个还想是自动调整<Tab>的长度来适应缩进
set expandtab


"插入模式下直接调到结尾编辑
inoremap <C-j> <Esc>A
"插入模式下跳一个字符然后编辑
inoremap <C-k> <Esc>la

"复制操作
vnoremap <C-c> "*y
"粘贴操作
noremap <C-v> "*p
inoremap <C-v> <Esc>"*p


"--------------------------------------------------------------------
"
"
" the bundle(一种vim插件管理器的初始化配置)
"
"
"--------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ronakg/quickr-cscope.vim'
Plugin 'ferrine/md-img-paste.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular' "必要插件，安装在vim-markdown前面
Plugin 'plasticboy/vim-markdown'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"--------------------------------------------------
"
"插件md-img-paste.vim的基本配置
"
"--------------------------------------------------
autocmd FileType markdown nmap <buffer><silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'pic'
let g:mdip_imgname = 'image'


"--------------------------------------------------
"
"vim-airline + Tagbar的配置
"
"--------------------------------------------------
"不显示文档总字数
let g:airline#extensions#wordcount#enabled = 0
"不显示文件编码（Windows系统）
let g:airline#parts#ffenc#skip_expected_string='utf-8[dos]'
"设置tagber对于markdown的支持
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Chapter',
        \ 'i:Section',
        \ 'k:Paragraph',
        \ 'j:Subparagraph'
    \ ]
\ }
"取消显示warning部分
let g:airline_section_warning = ''
"取消显示section_b
let g:airline_section_b = ''
"section_c显示为tagbar检索出来的标题
let g:airline_section_c = airline#section#create(['tagbar'])
"section_x显示文件名
let g:airline_section_x = '%{expand("%")}'
"section_y显示时间
let g:airline_section_y = airline#section#create(['%{strftime("%D")}'])
"section_z显示日期
let g:airline_section_z = airline#section#create(['%{strftime("%H:%M")}'])
"激活tagbar扩展
let g:airline#extensions#tagbar#enabled = 1


"--------------------------------------------------
"
"插件Vim-markdown的配置
"
"--------------------------------------------------
let g:vim_markdown_math = 1 "支持数学公式
set nofoldenable
let g:vim_markdown_no_extensions_in_markdown = 1

"--------------------------------------------------
"
"插件Vim-markdown-toc的配置
"
"--------------------------------------------------
let g:vmt_auto_update_on_save = 0

"插件Markdown-preview.nvim的配置
" 指定浏览器路径
let g:mkdp_path_to_chrome = "firefox"
" 指定预览主题，默认Github
let g:mkdp_markdown_css=''

"ultisnippet配置
"设置tab键为触发键
let g:UltiSnipsExpandTrigger = '<tab>'
"设置向后跳转键
let g:UltiSnipsJumpForwardTrigger = '<tab>' 
"设置向前跳转键
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>' 
"设置文件目录
let g:UltiSnipsSnippetDirectories=["~/.vim/bundle/ultisnips"]
"设置打开配置文件时为垂直打开
let g:UltiSnipsEditSplit="vertical"


"--------------------------------------------------------------------
"
"
" 介绍一些基础的配置cscope快捷键的知识。
" 这个配置我是不用的，因为我已经装了另外一个叫做quickr-cscope
" 的一个插件，仍然保留这些
" 配置(只是注释，并不将他们从~/.vimrc中删除)，只是为了让我能够复习vim脚本
" 快捷键的一些基本写法而已
"
"
" 下面的配置实现了F5 查找C符号、F6查找字符串；F7查找调用本函数的函数
"
"
"
"--------------------------------------------------------------------

"if has("cscope")
"    set csprg=/usr/bin/cscope
"    set csto=0
"    set cst
"    set nocsverb
"    "add any database in current directory
"    if filereadable("cscope.out")
"        cs add cscope.out
"    endif
"    set csverb
"endif
"
"nmap <silent> <F5> :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <silent> <F6> :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <silent> <F7> :cs find c <C-R>=expand("<cword>")<CR><CR>
