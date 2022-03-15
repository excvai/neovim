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

-- Restore previous cursor position
vim.cmd [[
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
]]

-- Disable some vim features on large files
vim.cmd [[
augroup LargeFile
        let g:large_file = 512000 " 500kb

        " Set options:
        "   eventignore+=FileType (no syntax highlighting etc
        "   assumes FileType always on)
        "   noswapfile (save copy of file)
        "   bufhidden=unload (save memory when other file is viewed)
        "   buftype=nowritefile (is read-only)
        "   undolevels=-1 (no undo possible)
        au BufReadPre *
                \ let f=expand("<afile>") |
                \ if getfsize(f) > g:large_file |
                        \ set eventignore+=FileType |
                        \ setlocal noswapfile bufhidden=unload |
                \ else |
                        \ set eventignore-=FileType |
                \ endif
augroup END
]]
