
# Polku, pääte ja kieli.
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH
export TERM=xterm-256color
export LANG=fi_FI.UTF-8

# Oh-My-Zsh-asennuspolku ja tyylimäärittely.
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="airline"

# Samastetaan - ja _ komentojen täydennyksen yhteydessä.
HYPHEN_INSENSITIVE="true"

# Älä tulkitse versionhallinnan ulkopuolisia tiedostoja muutoksina.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Älä tarkista täydennystiedostojen omistajuuksia ja oikeuksia.
ZSH_DISABLE_COMPFIX=true

# Historian pituus.
SAVEHIST=5000
HISTSIZE=2000
HISTFILE=~/.zsh_history

alias vi=/usr/local/bin/vim

# Käytetään Vi-tilaa komentorivillä.
bindkey -v
export KEYTIMEOUT=1

# Liitännäiset.
plugins=(git brew vi-mode extract colored-man-pages)
plugins+=(zsh-autosuggestions zsh-syntax-highlighting)
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
# Ks. https://gtbensmagazine.com/2019/05/07/the-right-and-wrong-way-to-set-python-3-as-default-on-macos/
#

# Alusta `pyenv` kirjautumisen yhteydessä.
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Näennäisympäristöt.
export VIRTUALENVWRAPPER_PYTHON=$HOME/.pyenv/shims/python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/git
eval "$(pyenv virtualenv-init -)"
pyenv virtualenvwrapper_lazy
