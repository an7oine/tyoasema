# Mikäli Zsh käynnistettiin suoraan pääteistuntoon:
# - yhdistä ensimmäiseen irralliseen Tmux-istuntoon, jos sellainen on,
# - muuten avaa uusi Tmux-istunto;
# - poistu Tmux-yhteyden katkettua.
# Muussa tapauksessa toimitaan toisen komentotulkin sisällä; normaali ajo.
if which -s tmux &>/dev/null && [ "$SHLVL" -le 1 ]; then
  { tmux ls | grep -vq attached && tmux attach } || tmux new
  exit
fi
