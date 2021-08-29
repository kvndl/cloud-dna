#!/bin/bash

# Linode StackScript - Rocky 8
# Created by: Noah Schepers

# Refs
OMZ_INSTALL="https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

# System - Update
dnf update -y
dnf upgrade -y

# System - Install
dnf install epel-release -y
dnf install git zsh neofetch -y
sh -c "$(curl -fsSL "$OMZ_INSTALL")"

# ZSH - Configure
rm $HOME/.zshrc
cat << EOF > $HOME/.zshrc
GPG_TTY=$(tty)

ZSH_THEME="ys"

DISABLE_UPDATE_PROMPT="true"

plugins=(git)

export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.local/bin:$PATH

export ZSH="/$USER/.oh-my-zsh"

export LANG=en_US.UTF-8

export GPG_TTY

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='subl'
fi

alias c='clear'
alias ..='cd ..'
alias ...='cd ../../'
EOF

# System - Reboot
usermod --shell /usr/bin/zsh root
shutdown -r now
