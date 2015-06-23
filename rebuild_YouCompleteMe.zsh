#/bin/zsh
cd ~/.vim/bundle/YouCompleteMe
time ./install.sh --clang-completer --system-libclang
cd ~

echo "Rebuild YouCompleteMe Done!\n"
