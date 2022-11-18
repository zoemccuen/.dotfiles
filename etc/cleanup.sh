#!/bin/bash

#set up the file locations as variables
VIMRC=~/.vimrc
BASHRC=~/.bashrc
TRASH=~/.TRASH

#Check if there's a .vimrc and delete it if there is
if [[ -f "$VIMRC" ]]; then
  rm -rf ${VIMRC}
fi

#Remove this line from the .bashrc using sed's -i option to update a file
sed -i  's/source \~\/.dotfiles\/etc\/bashrc_custom//g' ${BASHRC}

#Delete the .TRASH directory from our $HOME
if [[ -f "$TRASH" ]]; then
  rm -rf ${TRASH}
fi
