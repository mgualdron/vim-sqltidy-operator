" --------------------------------------------------------------------------
" Plugin Name:  sqltidy-operator
"
" Purpose:      Small example Vim plugin to create a movement operator for 
"               running a SQL tidy program called fsqlf.
"
"               See https://github.com/dnsmkl/fsqlf
"
" Note:         The following <Plug> mappings become available:
"
"               <Plug>(NormalSqlTidyLine)
"               <plug>(NormalSqlTidy)
"               
"               These can be mapped as follows:
"
"               nmap <leader>ql <Plug>(NormalSqlTidyLine)
"               nmap <leader>qt <Plug>(NormalSqlTidy)
"               vmap <leader>qt <Plug>(VisualSqlTidy)
"
" --------------------------------------------------------------------------
"
" --------------------------------------------------------------------------
" The <Plug> mapping definitions:
" --------------------------------------------------------------------------
nnoremap <script> <Plug>(NormalSqlTidyLine) :call <SID>SqlTidyLine()<cr>
nnoremap <script> <Plug>(NormalSqlTidy) :set operatorfunc=<SID>SqlTidyOperator<cr>g@
vnoremap <script> <Plug>(VisualSqlTidy) :<c-u>call <SID>SqlTidyOperator(visualmode(),1)<cr>
" --------------------------------------------------------------------------
"
" --------------------------------------------------------------------------
" The SqlTidyOperator function applies SqlTidy to many text entities:
" --------------------------------------------------------------------------
function! s:SqlTidyOperator(type, ...)
    let [sel, rv, rt] = [&selection, @@, getregtype('"')]
    let &selection = "inclusive"

    if a:0 
      silent execute "normal! `<" . a:type . "`>d"
    elseif a:type ==# 'line'
      silent execute "normal! '[V']d"
    elseif a:type ==# 'block'
      silent execute "normal! `[\<C-V>`]d"
    else
      silent execute "normal! `[v`]d"
    endif

    call s:SqlTidy(@@)

    let &selection = sel
    call setreg('"', rv, rt)
endfunction
" --------------------------------------------------------------------------
"
" --------------------------------------------------------------------------
" Apply the SQLTidy function to a single line of text:
" --------------------------------------------------------------------------
function! s:SqlTidyLine()
    let [sel, rv, rt] = [&selection, @@, getregtype('"')]
    let &selection = "inclusive"

    silent execute "normal! dd"
    call s:SqlTidy(@@)

    let &selection = sel
    call setreg('"', rv, rt)
endfunction
" --------------------------------------------------------------------------
"
" --------------------------------------------------------------------------
" This function calls the external fsqlf command:
" --------------------------------------------------------------------------
function! s:SqlTidy(sqlcode)
    " Call external command fsqlf using the contents of a:sqlcode ,
    " storing the reults in the exp register, then paste.
    silent execute "normal! \"=system('fsqlf --config-file ~/.fsqlf', a:sqlcode)\<cr>P"
endfunction
" --------------------------------------------------------------------------
