# Vim awesome configuration

## Requirements
* Vim (of course)
* Python support
* PyGtk

##Installation
It's as simple ass that:

```bash
git clone https://github.com/ivyl/vim-config.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

##Plugins
* [colorpicker](https://github.com/vim-scripts/VIM-Color-Picker)
* [commentary](https://github.com/tpope/vim-commentary)
* [ctrlp](https://github.com/kien/ctrlp.vim)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [gundo](https://github.com/sjl/gundo.vim)
* [hexhighlight](http://www.vim.org/scripts/script.php?script_id=2937)
* [markdown](https://github.com/tpope/vim-markdown)
* [matchit](http://www.vim.org/scripts/script.php?script_id=39)
* [pathogen](https://github.com/tpope/vim-pathogen)
* [repeat](https://github.com/tpope/vim-repeat)
* [scala](https://github.com/derekwyatt/vim-scala)
* [snipmate](https://github.com/garbas/vim-snipmate)
* [surround](https://github.com/tpope/vim-surround)
* [tabular](https://github.com/godlygeek/tabular)
* [unimpaired](https://github.com/tpope/vim-unimpaired)
* [xmledit](https://github.com/sukima/xmledit/)

##Theme
[railscasts](http://railscasts.com/about) with transparent background
[aldmeris](http://www.vim.org/scripts/script.php?script_id=3673)
[xoria256](http://www.vim.org/scripts/script.php?script_id=2140)

##Bindings
* \l - toggle show invisibles
* \h - toggle highligh search matches
* \g - gundo toggle
* \. \, \[ \] - resize splits
* \s - togle spell checking
* \v - edit your vimrc in new tab, config is reloaded on save
* :Sw - does sudo write of edited file (:w !sudo tee % > /dev/null)
* <C-k> - move your code one line up
* <C-j> - move your code one line down
* <C-p> - file search/open (ctrlp plugin)

##Features
* editing gziped files
* minimalized GUI
* nice invisibles


##Thanks
Drew for his [vimcasts](http://vimcasts.org/)
