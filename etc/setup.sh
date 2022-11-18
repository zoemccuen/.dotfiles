#!/bin/bash

#Use the backticks to put the output of uname into variable OSTYPE
OSTYPE="`uname`"
VIMRC=~/.vimrc
BASHRC=~/.bashrc

#If the OS is not Linux then throw an error and quit
if [ "$OSTYPE"  != "Linux" ]; then
  echo "ERROR - This script requires Linux to run." >> ./linuxsetup.log
  exit
else
# It's linux, so we can continue

#Make the .TRASH directory in our $HOME
mkdir -p ~/.TRASH

#Check if there's a .vimrc already and rename if if it exists
if [[ -f "$VIMRC" ]]; then
  mv ${VIMRC} ~/.bup_vimrc
  #log the change!
  echo "INFO - Current .vimrc was renamed to .bup_vimrc" >> ./linuxsetup.log
fi
#create a copy of our etc/vimrc by overwriting any .vimrc
cat ~/.dotfiles/etc/vimrc  > ${VIMRC}

#append this line to the .bashrc
echo "source ~/.dotfiles/etc/bashrc_custom" >> ${BASHRC}

fi
