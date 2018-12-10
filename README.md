# vim-sqltidy-operator

`sqltidy-operator.vim` creates an operator function so that an external SQL 
tidy program can be run on a section of SQL code defined as a movement or 
visual selection.

I recommend [fsqlf](https://github.com/dnsmkl/fsqlf), but you can use any 
other program for beautifying SQL as long as it can take `STDIN`, and print to 
`STDOUT`.

# Installation

You can install `sqltidy-operator.vim` in the usual way, by copying the contents of the
`plugin`, and `doc` directories into the equivalent directories
inside `.vim`.

Alternatively, if you manage your plugins using [pathogen.vim][1], you can
simply clone into the `bundle` directory:

    cd ~/.vim/bundle
    git clone git://github.com/mgualdron/vim-sqltidy-operator

# Usage

You will need to have an external SQL tidy program installed on your system 
to use this module.  I use `fsqlf` as mentioned above.  You will need to put 
the command itself along with any additional options you wish to use every 
time you call it, into a variable called `g:vim_sqltidy_app`:

    let g:vim_sqltidy_app = 'fsqlf --config-file ~/.fsqlf'
    
Note that the program does not have to do SQL cleanup.  You can safely 
do any other kind of processing or beautifying.  The output will replace the 
input in the file being edited.

The module exposes the following `<Plug>` mappings:

    <Plug>(NormalSqlTidyLine)
    <plug>(NormalSqlTidy)
    <plug>(VisualSqlTidy)

These can be mapped to whatever keyboard shortcuts you wish.  This is only a 
suggestion:

    nmap <leader>ql <Plug>(NormalSqlTidyLine)
    nmap <leader>qt <Plug>(NormalSqlTidy)
    vmap <leader>qt <Plug>(VisualSqlTidy)

Once these mappings are part of your `~/.vimrc`, you can tidy up SQL from a 
single line, a block of text, or a visual selection:

    <leader>ql
    
    or
    
    <leader>qt{motion}
    
    or
    
    {visual selection}<leader>qt

For full documentation, install the plugin and run `:help vim-sqltidy-operator` from within
Vim.

[1]: https://github.com/tpope/vim-pathogen
