# vim-man

Read man pages in vim.

## Motivation
This is a modification of the man ftplugin that is included in Vim, written by
SungHyun Nam. That ftplugin supplied a `:Man` command that allowed you to find
and read man pages in vim, but it was not loaded until you first visited a man
page or you ran `runtime ftplugin/man.vim`. In addition, the plugin did not use
autoloads so you paid the full price of defining these functions even if
you never used the `:Man` command in your vim session.

I simply took SungHyun's file and split it up into three parts: a plugin file
that provides the `:Man` command, an autoload file that will only be executed
when you actually use `:Man`, and the ftplugin file to configure vim for reading
man pages.

## Customization

This plugin provides two mappings: `<Plug>(ManPreGetPage)` and `<Plug>(ManBS)`.
The first allows you to call `:Man` on the word under your cursor. This is
equivalent to settings `keywordprg=:Man` and using `K`, but allows you to keep
`keywordprg` to a different value. The second deletes all backspace characters
in the page.

You can use these mappings as follows (these are just suggested keys, you can of
course use any mapping you like):

`~/.vimrc`:
```vim
nmap <Leader>K <Plug>(ManPreGetPage)
```

`~/.vim/after/ftplugin/man.vim`:
```vim
nmap <buffer> <LocalLeader>h <Plug>(ManBS)
```

## Credit

SungHyun Nam did the bulk of the work in creating and writing the man ftplugin
and the `:Man` command.
