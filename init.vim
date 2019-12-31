call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree' " 文件管理
"Plug 'zxqfl/tabnine-vim' " OpenAI代码提示
Plug 'vim-airline/vim-airline' " 状态栏增强
Plug 'vim-airline/vim-airline-themes'
Plug '/usr/local/opt/fzf' "fzf依赖
Plug 'junegunn/fzf.vim' "搜索打开,文件搜索
Plug 'easymotion/vim-easymotion' "光标快速移动
Plug 'Yggdroot/LeaderF' "文件查找
Plug 'Chiel92/vim-autoformat' "自动格式化代码
"Plug 'ctrlpvim/ctrlp.vim' "ctrlp
" 代码提示
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Markdown预览
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" 运行命令，类似:!<cmd>, 但是会将命令和结果放到一个窗口
" :T <CMD>
Plug 'kassio/neoterm'
"gruvbox
Plug 'morhetz/gruvbox'
"tagbar
Plug 'majutsushi/tagbar'

" function! BuildYCM(info)
"   if a:info.status == 'installed' || a:info.force
"     !./install.py --clang-completer --js-completer
"   endif
" endfunction
" Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp'], 'do': function('BuildYCM') }
Plug 'marijnh/tern_for_vim'
" 注释与反注释插件
Plug 'scrooloose/nerdcommenter'
" 生成代码截图插件,很漂亮
"Plug 'kristijanhusak/vim-carbon-now-sh'
" 生成代码图片
"noremap <leader>cn :CarbonNowSh<CR>
" 代码片段
"Plug 'SirVer/ultisnips'
Plug 'roxma/vim-tmux-clipboard'
" start语言提示插件
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-jp/vim-cpp'
Plug 'pboettch/vim-cmake-syntax'
Plug 'tikhomirov/vim-glsl'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
"Plug 'plasticboy/vim-markdown'
Plug 'vim-python/python-syntax'
" end
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'vim-scripts/LargeFile'
Plug 'yianwillis/vimcdoc'
" Plug 'neoclide/coc.vim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 括号优化
Plug 'luochen1990/rainbow'
" 快捷键提示
"Plug 'liuchengxu/vim-which-key', {'on':['WhichKey','WhichKey!']}
call plug#end()

"设置<leader>
let mapleader=","

" coc.nvim
set updatetime=300
augroup coc_config
  au!
  "au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  "au CursorHold * sil call CocActionAsync('highlight')
  "au CursorHoldI * sil call CocActionAsync('showSignatureHelp')
augroup END
nmap <silent> <M-j> <Plug>(coc-definition)
nmap <silent> <C-,> <Plug>(coc-references)
nn <silent> K :call <SID>show_documentation()<cr>
nn <silent> <leader>si :<C-u>CocList outline<cr>
nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)
nn <silent> ga :<C-u>CocList -I symbols<cr>
nn <leader>l= :call CocAction('format')<cr>
nmap <leader>la <Plug>(coc-codeaction)
nn <silent> <leader>lc :call CocAction('codeLens')<cr>
nn <leader>le :<C-u>CocList diagnostics<cr>
nmap <leader>lf <Plug>(coc-fix-current)
nmap <leader>lr <Plug>(coc-rename)
ino <expr><tab> pumvisible() ? "\<C-y>" : "\<tab>"
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'
let g:coc_start_at_startup = 0
au VimEnter * if getcwd() !~ 'Dev\|llvm\|projects' | let g:coc_start_at_startup=1 | endif
"let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" one-level base
" bases
nn <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nn <silent> xb :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived of up to 3 levels
nn <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
" callee
nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

" $ccls/member
" member variables / variables in a namespace
nn <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nn <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nn <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

nmap <silent> xt <Plug>(coc-type-definition)<cr>
nn <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
nn <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>
" end coc.nvim

" vim-which-key
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" set timeoutlen=500
" end vim-whice-key

" rainbow
let g:rainbow_active = 1
" end rainbow

"nerdtree配置========================
"设置 F2 为NERDTree的快捷键
map <leader>nt :NERDTreeToggle<CR>
"修改文件树的展示图标
let g:NERDTreeDirArrowExpandable="►"
let g:NERDTreeDirArrowCollapsible="▽"
"设置文件树的展示位置
let g:NERDTreeWinPro="right"
"设置文件树的窗口尺寸
let g:NERDTreeSize=31
"是否显示行号
let g:NERDTreeShowLineNumbers=1
"是否展示隐藏文件
let g:NERDTreeShowHidden=1
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
"let g:deoplete#enable_at_startup = 1
"end deoplete

"tagbar
nmap <leader>tb :Tagbar<CR>
"end tagbar

"ycm
" let g:airline#extensions#ycm#enabled = 1
" let g:airline#extensions#ycm#error_symbol = 'E:'
" let g:airline#extensions#ycm#warning_symbol = 'W:'
" let g:ycm_min_num_of_chars_for_completion = 3 
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_complete_in_comments = 1
" let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" 比较喜欢用tab来选择补全..., 其他的也支持，不是专门为ycm写的
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

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
" end pangloss/vim-javascript

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
set guioptions=
set guifont=Monaco:h17

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
nnoremap <space> viw
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lev
"打开vim配置文件，并分屏编辑
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"保存vim配置文件
nnoremap <leader>sv :source $MYVIMRC<cr>
"切换窗口
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
"注释一行
"Plug 'scrooloose/nerdcommenter' 这个插件已经有这个功能了<leader>cc
"autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
"autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
"autocmd FileType cpp nnoremap <buffer> <localleader>c I#<esc>
"快速复制光标所在的单词
nnoremap <leader>qy viw"+y
set cc=80
