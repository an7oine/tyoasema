function koodi() {
  {
    # Vanhat .egg-link -tyyppiset asennukset.
    find "$( python -c 'print(__import__("sysconfig").get_paths()["purelib"])' )" \
      -name \*.egg-link -exec head -n1 '{}' \;

    # PEP 660 -yhteensopivat asennukset.
    find "$( python -c 'print(__import__("sysconfig").get_paths()["purelib"])' )" \
      -name direct_url.json -exec jq -r .url '{}' \; | sed 's_^file://__'

  } | while read paketti; do
    find -L "${paketti}" \
    -not -path \*.eggs/\* \
    -not -path \*.tox/\* \
    -not -name \*neomake\* \
    "(" -name \*.py -or -name \*.html -or -name \*.js -or -name \*.css -or -name pyproject.toml ")" \
    "${@}"
  done
}
