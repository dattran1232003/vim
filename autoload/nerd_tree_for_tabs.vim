" automatic NERDTree mirroring on tab switching
" when having just one window in the tab
function MirrorNerdTreeIfOneWindow()
  if winnr("$") < 2
    NERDTreeMirror

    " hack to move the focus from the NERDTree to the main window
    wincmd p
    wincmd l
  endif
endfunction

autocmd GuiEnter * silent NERDTree
autocmd VimEnter * silent NERDTree
autocmd TabEnter * silent exe MirrorNerdTreeIfOneWindow()
