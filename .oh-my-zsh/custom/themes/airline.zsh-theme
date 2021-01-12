# -*- mode: sh; -*-

PROMPT='%F{250}%n@%m%f %F{85}%1~%f %# '
RPROMPT='%F{85}[%*]%f'

# Näytä vi-tilaa vastaava kursorin väri.
function zle-keymap-select zle-line-init {
  # Xterm-väri 85: #5fffaf
  if [ $KEYMAP = vicmd ]; then
    echo -ne "\033]12;#5fffaf\007"
  else
    echo -ne "\033]12;#ffffff\007"
  fi

  zle reset-prompt
  zle -R
}

# Palauta normaalitilan kursori, kun rivi on lähetetty.
function zle-line-finish {
  echo -ne "\033]12;#5fffaf\007"
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
