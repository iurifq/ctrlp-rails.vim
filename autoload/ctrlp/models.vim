if exists('g:loaded_ctrlp_models') && g:loaded_ctrlp_models
  finish
endif
let g:loaded_ctrlp_models = 1

let s:models_var = {
\  'init':   'ctrlp#models#init()',
\  'accept': 'ctrlp#models#accept',
\  'lname':  'models',
\  'sname':  'models',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:models_var)
else
  let g:ctrlp_ext_vars = [s:models_var]
endif

function! ctrlp#models#init()
  return map(globpath('app/models/**', '*.rb', 0, 1), 'fnamemodify(v:val, ":s?app/models/??:s?.rb??")')
endfunc

function! ctrlp#models#accept(mode, str)
  call ctrlp#acceptfile(a:mode, 'app/models/' . a:str . '.rb')
endfunc

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#models#id()
  return s:id
endfunction
