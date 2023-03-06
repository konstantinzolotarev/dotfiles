#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Installing all required brew commands
# brew install git wget zsh z fzf ag rg pgcli nvm erlang elixir go@1.17

# vim
[ ! -f ${HOME}/.vimrc ] && ln -s ${BASEDIR}/vimrc ${HOME}/.vimrc

if [ ! -d ${HOME}/.vim ]; then
  mkdir ${HOME}/.vim
  ln -s ${BASEDIR}/UltiSnips ${HOME}/.vim/UltiSnips
fi

# zsh
[ ! -f ${HOME}/.zshrc ] && ln -s ${BASEDIR}/zshrc ${HOME}/.zshrc

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
# Installing zsh-autosuggestions
if [ ! -d ${ZSH_CUSTOM}/plugins/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi
# Theme
[ ! -f ${ZSH_CUSTOM}/themes/gitster.zsh-theme ] &&  ln -s ${BASEDIR}/zsh-themes/gitster.zsh-theme ${ZSH_CUSTOM}/themes/gitster.zsh-theme

# git
[ ! -f ${HOME}/.gitconfig ] &&  ln -s ${BASEDIR}/gitconfig ${HOME}/.gitconfig
[ ! -f ${HOME}/.gitignore_global ] &&  ln -s ${BASEDIR}/gitignore_global ${HOME}/.gitignore_global

# Emacs
[ ! -d ${HOME}/.doom.d ] && ln -s ${BASEDIR}/doom.d ~/.doom.d
