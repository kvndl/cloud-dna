#!/bin/bash

# Linode StackScript - Rocky 8
# Created by: Noah Schepers

# Refs - Don't mind the raw-ness, Linode SS are limited to a singular file
OMZ_INSTALL="https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

ZSHRC="$(cat << EOF
GPG_TTY=$(tty)

ZSH_THEME="ys"

DISABLE_UPDATE_PROMPT="true"

plugins=(git)

export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

export LANG=en_US.UTF-8

export GPG_TTY

source $ZSH/oh-my-zsh.sh

alias c='clear'
alias ..='cd ..'
alias ...='cd ../../'
EOF
)"

echo $ZSHRC

F2B_CONF_DIR="/etc/fail2ban"

F2B_CONF=$(cat << EOF
[INCLUDES]

before = paths-fedora.conf

[DEFAULT]

# Number of seconds that a host is banned.
bantime  = 1d

# If generated "maxretry" during the last "findtime" seconds.
findtime  = 10m

# Number of failures before a host get banned.
maxretry = 5

# Number of matches stored in ticket (resolvable via tag <matches> in actions).
maxmatches = %(maxretry)s

backend = auto

usedns = warn

logencoding = auto

# Jail?
enabled = true

# Mode of the filter.
mode = normal

# Filter to use by the jail.
filter = %(__name__)s[mode=%(mode)s]

# Default protocol
protocol = tcp

# Specify chain where jumps would need to be added in ban-actions expecting parameter chain
chain = <known/chain>

# Ports to be banned
port = 0:65535

# Format of user-agent https://tools.ietf.org/html/rfc7231#section-5.5.3
fail2ban_agent = Fail2Ban/%(fail2ban_version)s

banaction = iptables-multiport
banaction_allports = iptables-allports

# The simplest action to take: ban only
action_ = %(banaction)s[port="%(port)s", protocol="%(protocol)s", chain="%(chain)s"]

action = %(action_)s

[sshd]

enabled = true
port    = 88
logpath = %(sshd_log)s
backend = %(sshd_backend)s
EOF
)

echo $F2B_CONF

# System - Update
dnf update -y
dnf upgrade -y

# System - Install
dnf install epel-release -y
dnf install git zsh neofetch fail2ban -y
sh -c "$(curl -fsSL "$OMZ_INSTALL")"

# ZSH - Configure
: > "$HOME/.zshrc"
echo "$ZSHRC" >> "$HOME/.zshrc"

# F2B - Configure
echo "$F2B_CONF" >> "$F2B_CONF_DIR"


# F2B - Startup
systemctl enable --now fail2ban
systemctl restart fail2ban


# System - Reboot
usermod --shell /usr/bin/zsh root
shutdown -r now
