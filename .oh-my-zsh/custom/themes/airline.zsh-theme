# -*- mode: sh; -*-

PROMPT='%F{250}%n@%m%f %F{85}%1~%f %# '
RPROMPT='%F{85}[%*]%f'

# Näytä vi-tilaa vastaava kursorin väri.
function zle-keymap-select zle-line-init {
  if [ $KEYMAP = vicmd ]; then
    # Normaalitila: Xterm-väri 85 = #5fffaf.
    echo -ne "\033]12;#5fffaf\007"
  else
    # Lisäystila: valkoinen.
    echo -ne "\033]12;#ffffff\007"
  fi

  zle reset-prompt
  zle -R
}

# Palauta lisäystilan kursori, kun rivi on lähetetty.
function zle-line-finish {
  echo -ne "\033]12;#ffffff\007"
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
