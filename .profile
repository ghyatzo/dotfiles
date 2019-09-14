#
# ~/.profile
#
# Runs on login in.

# Export Vars

# ---- SYSTEM ----

export PATH="$PATH:$HOME/.local/bin"
export VISUAL="vim"
export EDITOR="$VISUAL"
export TERMINAL="kitty"
export LANG="it_IT.UTF-8"
export CONFIGDIR="$HOME/.config"
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# ---- ZSH ----
export ZSH="$HOME/.config/oh-my-zsh"
export ZDOTDIR="$HOME/.config/oh-my-zsh"

# ---- LESS ----
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'

# ---- CUSTOM LOCATIONS ----
export BOOKS=$HOME/Google\ Drive/Utrecht\ Master/Books
export ATOM_HOME="$CONFIGDIR/atom"
