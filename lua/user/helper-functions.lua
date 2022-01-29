-- Check diff current buffer with saved buffer
vim.cmd [[
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
]]

vim.cmd [[
function! s:DeleteAllBuffers()
  exe "bufdo :Bdelete"
endfunction
com! Ba call s:DeleteAllBuffers()
]]
