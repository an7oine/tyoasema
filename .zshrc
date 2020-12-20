# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Samastetaan - ja _ komentojen täydennyksen yhteydessä.
HYPHEN_INSENSITIVE="true"

# Älä tulkitse versionhallinnan ulkopuolisia tiedostoja muutoksina.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Liitännäiset.
plugins=(git vi-mode extract colored-man-pages)
plugins+=(etsi html_aihiot koodi luo_ctags rmpyc smtpd status)

source $ZSH/oh-my-zsh.sh


#
# Ks. https://scriptingosx.com/2019/06/moving-to-zsh/
#

# Lisää aikaleima komentohistoriaan.
setopt EXTENDED_HISTORY

# Käytä jaettua, reaaliaikaista historiatiedostoa.
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# Poista/ohita tyhjät rivit / kaksoiskappaleet historiatiedoista.
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# Kirjainkoosta riippumaton tiedostonimien täydennys.
# Älä valitse ensimmäistä täydennystä automaattisesti.
setopt NO_CASE_GLOB
setopt GLOB_COMPLETE


#
# Ks. Mikrobitti 9/2020
#

ZSH_THEME="dracula"
# Värillinen komentokehote -> hidas.
#ZSH_THEME="agnoster"
#DEFAULT_USER="${USERNAME}"

export TERM=xterm-256color
export LANG=fi_FI.UTF-8

bindkey -v
export KEYTIMEOUT=1

# Historian pituus.
SAVEHIST=5000
HISTSIZE=2000
HISTFILE=~/.zsh_history


#
# Ks. https://gtbensmagazine.com/2019/05/07/the-right-and-wrong-way-to-set-python-3-as-default-on-macos/
#

# Alusta `pyenv` kirjautumisen yhteydessä.
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Näennäisympäristöt.
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/git
eval "$(pyenv virtualenv-init -)"
pyenv virtualenvwrapper
