if exists('g:loaded_ctrlp_libs') && g:loaded_ctrlp_libs
  finish
endif
let g:loaded_ctrlp_libs = 1

let s:libs_var = {
\  'init':   'ctrlp#libs#init()',
\  'accept': 'ctrlp#libs#accept',
\  'lname':  'libs',
\  'sname':  'contro',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:libs_var)
else
  let g:ctrlp_ext_vars = [s:libs_var]
endif

function! ctrlp#libs#init()
  return map(globpath('lib/**', '*.*', 0, 1), 'fnamemodify(v:val, ":s?lib/??")')
endfunc

function! ctrlp#libs#accept(mode, str)
  call ctrlp#acceptfile(a:mode, 'lib/' . a:str)
endfunc

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#libs#id()
  return s:id
endfunction

