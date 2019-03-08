# vim-man

Read man pages in vim.

## Motiviation
This is a modification of the man ftplugin that is included in Vim, written by
SungHyun Nam. That ftplugin supplied a `:Man` command that allowed you to find
and read man pages in vim, but it was not loaded until you first visited a man
page or you ran `runtime ftplugin/man.vim`. In addition, the plugin did not use
autoloads at all, so you paid the full price of defining these functions even if
you never used the `:Man` command in your vim session.

I simply took SungHyun's file and split it up into three parts: a plugin that
provides the `:Man` command, an autoload file that will only be executed when
you actually use `:Man`, and the ftplugin file to configure vim for reading man
pages.

## Credit

SungHyun Nam did the bulk of the work in creating and writing the man ftplugin
and the `:Man` command.
