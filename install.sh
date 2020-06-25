#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
[ ! -f ${HOME}/.vimrc ] && ln -s ${BASEDIR}/vimrc ${HOME}/.vimrc

if [ ! -d ${HOME}/.vim ]; then
  mkdir ${HOME}/.vim
  ln -s ${BASEDIR}/UltiSnips ${HOME}/.vim/UltiSnips
fi

# zsh
[ ! -f ${HOME}/.zshrc ] && ln -s ${BASEDIR}/zshrc ${HOME}/.zshrc

# git
[ ! -f ${HOME}/.gitconfig ] &&  ln -s ${BASEDIR}/gitconfig ${HOME}/.gitconfig
[ ! -f ${HOME}/.gitignore_global ] &&  ln -s ${BASEDIR}/gitignore_global ${HOME}/.gitignore_global

# Emacs
[ ! -d ${HOME}/.doom.d ] && ln -s ${BASEDIR}/doom.d ~/.doom.d
