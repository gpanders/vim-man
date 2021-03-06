" man filetype plugin
" Modified By: Greg Anders <greg@gpanders.com>
" Original Author: SungHyun Nam <goweol@gmail.com>
" Last Change: 2019-03-06
" License: Same as vim (see :h license)

" Neovim has its own :Man implementation, so don't load ours
if has('nvim')
  finish
endif

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

" allow dot and dash in manual page name.
setlocal iskeyword+=\.,-
let b:undo_ftplugin = 'setlocal iskeyword<'

" Add mappings, unless the user didn't want this.
if !exists('no_plugin_maps') && !exists('no_man_maps')
  nnoremap <buffer> <silent> <Plug>(ManBS) :setl ma<Bar>%s/.\b//ge<Bar>setl noma nomod<CR>''
  nnoremap <buffer> <silent> <C-]> :<C-U>call man#pre_get_page(v:count)<CR>
  nnoremap <buffer> <silent> <C-T> :<C-U>call man#pop_page(v:count)<CR>
  nnoremap <buffer> <silent> q :q<CR>

  " Add undo commands for the maps
  let b:undo_ftplugin = b:undo_ftplugin
	\ . '|sil! nun <buffer> <Plug>ManBS'
	\ . '|sil! nun <buffer> <C-]>'
	\ . '|sil! nun <buffer> <C-T>'
	\ . '|sil! nun <buffer> q'
endif

if get(g:, 'ft_man_folding_enable', 0)
  setlocal foldmethod=indent foldnestmax=1 foldenable
  let b:undo_ftplugin .= '|sil! setl fdm< fdn< fen<'
endif

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: set sw=2 ts=8 noet:
