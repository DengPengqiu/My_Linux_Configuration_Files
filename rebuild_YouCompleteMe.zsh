#!/bin/zsh
cd ~/.vim/bundle/YouCompleteMe
time ./install.py --clang-completer --system-libclang
cd ~

echo "Rebuild YouCompleteMe Done!\n"
