function status() {
  (
    find ${VIRTUAL_ENV}/lib/*/site-packages -name \*.egg-link -exec head -n1 "{}" \;
  ) | sort | while read g
  do echo -n "`basename $g` : "
    git -C "$g" status "-${@:-bs}"
  done
}
