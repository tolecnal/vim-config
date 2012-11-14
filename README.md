# Vim Awesome Configuration

## Requirements
* Vim (of course)
* Python support

## Installation
It's as simple as that:

```bash
git clone https://github.com/ivyl/vim-config.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

##Plugins
* [commentary](https://github.com/tpope/vim-commentary)
* [ctrlp](https://github.com/kien/ctrlp.vim)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [gundo](https://github.com/sjl/gundo.vim)
* [hexhighlight](http://www.vim.org/scripts/script.php?script_id=2937)
* [markdown](https://github.com/tpope/vim-markdown)
* [markmultiple](https://github.com/adinapoli/vim-markmultiple)
* [matchit](http://www.vim.org/scripts/script.php?script_id=39)
* [pathogen](https://github.com/tpope/vim-pathogen)
* [repeat](https://github.com/tpope/vim-repeat)
* [scala](https://github.com/derekwyatt/vim-scala)
* [snipmate](https://github.com/garbas/vim-snipmate)
* [surround](https://github.com/tpope/vim-surround)
* [tabular](https://github.com/godlygeek/tabular)
* [unimpaired](https://github.com/tpope/vim-unimpaired)
* [textobj-indent](https://github.com/kana/vim-textobj-indent)
* [ruby](https://github.com/vim-ruby/vim-ruby)
* [coffee](https://github.com/kchmck/vim-coffee-script)
* [bundler](https://github.com/tpope/vim-bundler)
* [vroom](https://github.com/skalnik/vim-vroom)


##Theme
[xoria256](http://www.vim.org/scripts/script.php?script_id=2140)

## Bindings
* \l - toggle show invisibles
* \h - toggle highligh search matches
* \g - gundo toggle
* \cc - togle color column at textwidth+1
* \cd - :lcd %:h
* \s - togle spell checking
* \v - edit your vimrc in new tab, config is reloaded on save
* \p - toggle paste mode
* \n - toggle between normal/relative line numbering
* ctrl + hjkl - move in insert mode
* <C-n> - start mark multiple (marks occurences which you can then edit at
  one)
* <C-m> - from visual, clean after mark multiple
* <C-k> - move your code one line up
* <C-j> - move your code one line down
* <C-p> - file search/open (ctrlp plugin)
* \r - run current/last test file
* \R - run nearest/last neaerest test
* <nr>zy - save view number <nr>, think of this as fold yank
* <nr>zp - load view number <nr>, think of this as fold paste
* :Sw - does sudo write of edited file (:w !sudo tee % > /dev/null)
* :&& - && expands to current file's path in ex mode

## Motions
* ai, ii - indented block

## Features
* [pathogen](https://github.com/tpope/vim-pathogen) enabled
* lot of useful sets (wildmenu, encoding, nocompatible, tabs, wraps, etc.)
* editing gziped files
* minimalized GUI
* nice invisibles

## Thanks
Drew for his [Vimcasts](http://vimcasts.org/)
Derek Wyatt for his [posts on Vim](http://www.derekwyatt.org/vim/)
