# vim-sqltidy-operator

`sqltidy-operator.vim` creates an operator function so that `fsqlf` can be run with
an argument defined as a movement or visual selection.

[fsqlf](https://github.com/dnsmkl/fsqlf) is a great program that is useful 
for beautifying SQL code.

# Installation

You can install `sqltidy-operator.vim` in the usual way, by copying the contents of the
`plugin`, and `doc` directories into the equivalent directories
inside `.vim`.

Alternatively, if you manage your plugins using [pathogen.vim][1], you can
simply clone into the `bundle` directory:

    cd ~/.vim/bundle
    git clone git://github.com/mgualdron/vim-sqltidy-operator

# Usage

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
