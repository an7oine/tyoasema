function status() {
  (
    # Vanhat .egg-link -tyyppiset asennukset.
    find "$( python -c 'print(__import__("sysconfig").get_paths()["purelib"])' )" \
      -name \*.egg-link -exec head -n1 '{}' \;
    # PEP 660 -yhteensopivat asennukset.
    find "$( python -c 'print(__import__("sysconfig").get_paths()["purelib"])' )" \
      -name direct_url.json -exec jq -r .url '{}' \; | sed 's_^file://__'
  ) | sort | while read g
  do echo -n "`basename $g` : "
    git -C "$g" status "-${@:-bs}"
  done
}
