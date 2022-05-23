-- TODO: rewrite into lua style
vim.cmd [[
function! s:DeleteAllBuffers()
  exe "bufdo :Bdelete"
endfunction
com! Ba call s:DeleteAllBuffers()

" Check diff current buffer with saved buffer
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Automatically close the tab/vim when nvim-tree is the last window in the tab
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]

-- Create packer snapshot with current date before sync
function PackerSyncWithSnapshot()
  local date = os.date("%m-%d-%Y-%X")
  local snapshotName = "auto-" .. date
  vim.cmd("PackerSnapshot " .. snapshotName)
  vim.cmd("PackerSync")
end
