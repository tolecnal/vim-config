# Vim awesome configuration

## Requirements
* Vim (of course)
* Python support
* PyGtk

##Instalation
```bash
git clone https://github.com/ivyl/vim-config.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

##Plugins
* [fugitive](https://github.com/tpope/vim-fugitive)
* [xmledit](https://github.com/sukima/xmledit/)
* [colorpicker](https://github.com/vim-scripts/VIM-Color-Picker)
* [gundo](https://github.com/sjl/gundo.vim)
* [tabular](https://github.com/godlygeek/tabular)
* [unimpaired](https://github.com/tpope/vim-unimpaired)
* [hexhighlight](http://www.vim.org/scripts/script.php?script_id=2937)

##Theme
[railscasts](http://railscasts.com/about) with transparent background

##Bindings
\l - toggle show invisibles
\h - toggle highligh search matches
\g - gundo toggle
\. \, \[ \] - resize splits
\s - togle spell checking
\v - edit your vimrc in new tab, config is reloaded on save
<C-Up> - move your code one line up
<C-Down> - move your code one line down

##Features
* editing gziped files
* minimalized GUI
* nice invisibles


##Thanks
Drew for his [vimcasts](http://vimcasts.org/)
