#!/usr/bin/env bash

info "Creating symlinks..."

# Symlink dotfiles to our home.
ln -sf "$HOME/code/dotfiles" "$DOTFILES_DIR"

ln -sf "$SOLARIZED_DIR/dircolors-solarized/dircolors.ansi-dark" "$HOME/.dircolors"

# zsh
ln -sf "$DOTFILES_DIR/zsh/zlogin" "$HOME/.zlogin"
ln -sf "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/zsh/zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES_DIR/zsh/zprofile" "$HOME/.zprofile"

# vim
ln -sf "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES_DIR/vim/gvimrc" "$HOME/.gvimrc"
mkdir "$HOME/.vim/autoload"
ln -sf "$DOTFILES/vim/autoload/*" "$HOME/.vim/autoload/"
mkdir "$HOME/.vim/after"
ln -sf "$DOTFILES_DIR/vim/ftplugin" "$HOME/.vim/after/ftplugin"
mkdir "$HOME/.vim/UltiSnips"
ln -sf "$DOTFILES_DIR/vim/UltiSnips" "$HOME/.vim/UltiSnips"

# atom
declare -a ATOM_FILES=(
  "config.cson"
  "init.coffee"
  "keymap.cson"
  "snippets.cson"
  "styles.less"
)
for file in "${ATOM_FILES[@]}"; do
  ln -sf "$DOTFILES/atom/$file" "$HOME/.atom/$file"
done
unset file

# tmux
ln -sf "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"

# git
ln -sf "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/git/gitignore_global" "$HOME/.gitignore_global"

# TheSilverSearcher ignore list
ln -sf "$DOTFILES_DIR/ag/ignore" "$HOME/.ignore"

# ctags
ln -sf "$DOTFILES_DIR/ctags/ctags" "$HOME/.ctags"

# curl
ln -sf "$DOTFILES/curl/curlrc" "$HOME/.curlrc"

# pdns
ln -sf "$DOTFILES/pdns/pdns.conf" /usr/local/etc/

info "Done."
