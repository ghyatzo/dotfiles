#
# ~/.profile
#
# Runs on login in.

# Export Vars

# ---- SYSTEM ----

export PATH="$HOME/.local/bin/:$PATH"
export VISUAL="nvim"
export EDITOR="$VISUAL"
export TERMINAL="kitty"
export LANG="it_IT.UTF-8"
export CONFIGDIR="$HOME/.config"
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"
export XDG_CONFIG_HOME="$CONFIGDIR"

# ---- JULIA ----
export JULIA_NUM_THREADS=4

# ---- ZSH ----
export ZSH="$CONFIGDIR/oh-my-zsh"
export ZDOTDIR="$ZSH"

# ---- CUPS ----
export CUPS_CACHEDIR="$HOME/.cache/cups"

# ---- PYTHON/PYENV ----

export PYENV_ROOT="$HOME/.local/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# ---- IPYTHON ---
export IPYTHONDIR="$CONFIGDIR/ipython"

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
export BOOKS=$HOME/Google\ Drive/Master/Books
export COURSES=$HOME/Current-Courses
export SCRIPTS=$HOME/.local/bin/
export DRIVE=$HOME/Google\ Drive/
#export ATOM_HOME="$CONFIGDIR/atom"



