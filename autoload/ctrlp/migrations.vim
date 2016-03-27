if exists('g:loaded_ctrlp_migrations') && g:loaded_ctrlp_migrations
  finish
endif
let g:loaded_ctrlp_migrations = 1

let s:migrations_var = {
\  'init':   'ctrlp#migrations#init()',
\  'accept': 'ctrlp#migrations#accept',
\  'lname':  'migrations',
\  'sname':  'migrations',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:migrations_var)
else
  let g:ctrlp_ext_vars = [s:migrations_var]
endif

function! ctrlp#migrations#init()
  return map(globpath('db/migrate/**', '*.rb', 0, 1), 'fnamemodify(v:val, ":s?db/migrate/??:s?.rb??")')
endfunc

function! ctrlp#migrations#accept(mode, str)
  call ctrlp#acceptfile(a:mode, 'db/migrate/' . a:str . '.rb')
endfunc

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#migrations#id()
  return s:id
endfunction
