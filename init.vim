call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree' " 文件管理
"Plug 'zxqfl/tabnine-vim' " 代码提示
Plug 'vim-airline/vim-airline' " 状态栏增强
Plug 'vim-airline/vim-airline-themes'
Plug '/usr/local/opt/fzf' "fzf依赖
Plug 'junegunn/fzf.vim' "搜索打开,文件搜索
Plug 'easymotion/vim-easymotion' "光标快速移动
Plug 'Yggdroot/LeaderF' "文件查找
Plug 'Chiel92/vim-autoformat' "自动格式化代码
Plug 'ctrlpvim/ctrlp.vim' "ctrlp
" 代码提示
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Markdown预览
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" 运行命令，类似:!<cmd>, 但是会将命令和结果放到一个窗口
" :T <CMD>
Plug 'kassio/neoterm'
"gruvbox
Plug 'morhetz/gruvbox'
"tagbar
Plug 'majutsushi/tagbar'
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --js-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp'], 'do': function('BuildYCM') }
Plug 'marijnh/tern_for_vim'
Plug 'scrooloose/nerdcommenter'
call plug#end()

"设置<leader>
let mapleader=","

"nerdtree配置========================
"设置 F2 为NERDTree的快捷键
map <leader>nt :NERDTreeToggle<CR>
"修改文件树的展示图标
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"
"设置文件树的展示位置
let g:NERDTreeWinPro="right"
"设置文件树的窗口尺寸
let g:NERDTreeSize=30
"是否显示行号
let g:NERDTreeShowLineNumbers=1
"是否展示隐藏文件
let g:NERDTreeHidden=0
"刷新文件目录
noremap <leader>nr :NERDTreeRefreshRoot<CR>
"end nerdtree配置========================


"tabnine 配置==========================
"let g:airline_theme="solarized"
"let g:airline_solarized_bg='dark'
let g:airline_theme="molokai"
"end tabnine 配置==========================


"fzf配置===================================
"map <slient> <leader>zf :Files<CR>
"map <slient> <leader>zb :Buffers<CR>
noremap <leader>zf :Files<CR>
noremap <leader>zb :Buffers<CR>
"文本搜索,需要the_silver_searcher支持
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <Leader>A :Ag<CR>
"end fzf配置===================================

"autoformat配置=====================
noremap fmt :Autoformat<CR>
"end autoformat配置=====================

"MarkdownPreview 配置==========================
noremap <leader>mp :MarkdownPreview<CR>
noremap <leader>ms :MarkdownPreviewStop<CR>
"end MarkdownPreview 配置==========================

"deoplete
"use deoplete
let g:deoplete#enable_at_startup = 1
"end deoplete

"tagbar
nmap <leader>tb :Tagbar<CR>
"end tagbar

"ycm
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'
let g:ycm_min_num_of_chars_for_completion = 3 
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" 比较喜欢用tab来选择补全...
function! MyTabFunction ()
    let line = getline('.')
    let substr = strpart(line, -1, col('.')+1)
    let substr = matchstr(substr, "[^ \t]*$")
    if strlen(substr) == 0
        return "\<tab>"
    endif
    return pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>"
endfunction
inoremap <tab> <c-r>=MyTabFunction()<cr>
"end ycm
"必要的配置
set tabstop=4
set shiftwidth=4
set ts=4
set expandtab
set smarttab
set autoindent
set cursorline
set number
set mousehide
scriptencoding utf-8
"set fdm=marker
filetype plugin on
set ignorecase " 搜索忽略大小写
let g:python3_host_prog='/usr/local/bin/python3'
"往系统剪切版里拷贝，从系统剪切版里粘贴
noremap <leader>y "+y
noremap <leader>p "+p
set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽

"使用gruvbox主题
colorscheme gruvbox
set background=dark

" 格式化json
noremap <leader>js <ESC>:%!python3 -m json.tool<CR>

" 注释
autocmd BufNewFile *.c,*.cpp,*.sh,*.py,*.java,*.js exec ":call SetTitle()"                                                                                       
"定义函数SetTitle，自动插入文件头
func SetTitle()
        "如果文件类型为.c或者.cpp文件
        if (&filetype == 'c' || &filetype == 'cpp' || &filetype == 'js')
                call setline(1, "/*************************************************************************")  
                call setline(2, "\ @Author: luning")  
                call setline(3, "\ @Created Time : ".strftime("%c"))  
                call setline(4, "\ @File Name: ".expand("%"))  
                call setline(5, "\ @Description:")  
                call setline(6, " ************************************************************************/")  
                call setline(7,"")  
        endif
        "如果文件类型为.sh文件
        if &filetype == 'shell'  
                call setline(1, "\#!/bin/sh")
                call setline(2, "\# Author: luning")
                call setline(3, "\# Created Time : ".strftime("%c"))
                call setline(4, "\# File Name: ".expand("%"))
                call setline(5, "\# Description:")
                call setline(6,"")
        endif
        "如果文件类型为.py文件
        if &filetype == 'python'
                call setline(1, "\#!/usr/bin/env python")
                call setline(2, "\# -*- coding=utf8 -*-")
                call setline(3, "\"\"\"")
                call setline(4, "\# Author: luning")
                call setline(5, "\# Created Time : ".strftime("%c"))
                call setline(6, "\# File Name: ".expand("%"))
                call setline(7, "\# Description:")
                call setline(8, "\"\"\"")
                call setline(9,"")
        endif
        "如果文件类型为.java文件
        if &filetype == 'java'  
                call setline(1, "//coding=utf8")  
                call setline(2, "/**")  
                call setline(3, "\ *\ @Author: luning")  
                call setline(4, "\ *\ @Created Time : ".strftime("%c"))  
                call setline(5, "\ *\ @File Name: ".expand("%"))  
                call setline(6, "\ *\ @Description:")  
                call setline(7, "\ */")  
                call setline(8,"")  
        endif
endfunc
" 自动将光标移动到文件末尾
autocmd BufNewfile * normal G
