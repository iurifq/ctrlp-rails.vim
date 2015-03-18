if exists('g:loaded_ctrlp_specs') && g:loaded_ctrlp_specs
  finish
endif
let g:loaded_ctrlp_specs = 1

let s:specs_var = {
\  'init':   'ctrlp#specs#init()',
\  'accept': 'ctrlp#specs#accept',
\  'lname':  'specs',
\  'sname':  'contro',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:specs_var)
else
  let g:ctrlp_ext_vars = [s:specs_var]
endif

function! ctrlp#specs#init()
  return map(globpath('spec/**', '*.rb', 0, 1), 'fnamemodify(v:val, ":s?lib/??")')
endfunc

function! ctrlp#specs#accept(mode, str)
  call ctrlp#acceptfile(a:mode,  a:str)
endfunc

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#specs#id()
  return s:id
endfunction
