function etsi () {
  find ${VIRTUAL_ENV}/lib/*/site-packages -name \*.egg-link -exec head -n1 "{}" \; |\
  while read g
  do git -C "$g" grep -E --untracked -l "${*}" | xargs -I % echo "${g}/%"
  done
}
