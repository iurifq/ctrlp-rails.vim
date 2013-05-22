if exists('g:loaded_ctrlp_views') && g:loaded_ctrlp_views
  finish
endif
let g:loaded_ctrlp_views = 1

let s:views_var = {
\  'init':   'ctrlp#views#init()',
\  'accept': 'ctrlp#views#accept',
\  'lname':  'views',
\  'sname':  'views',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:views_var)
else
  let g:ctrlp_ext_vars = [s:views_var]
endif

function! ctrlp#views#init()
  return split(system("find app/views/ -type f | sed 's_app/views/__'"), "\n")
endfunc

function! ctrlp#views#accept(mode, str)
  call ctrlp#acceptfile(a:mode, 'app/views/' . a:str)
endfunc

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#views#id()
  return s:id
endfunction
