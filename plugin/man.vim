" Define Man command if it doesn't already exist
" Author: Greg Anders
" License: Same as vim (see :h license)

if exists(":Man") == 2
  finish
endif

command -nargs=+ -complete=shellcmd Man call man#get_page(<q-mods>, <f-args>)
nnoremap <silent> <Plug>(ManPreGetPage) :call man#pre_get_page(0)<CR>
