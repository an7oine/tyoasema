function koodi() {
  (
    find "$( python -c 'print(__import__("sysconfig").get_paths()["purelib"])' )" \
      -name \*.egg-link -exec head -n1 "{}" \;
  ) | while read paketti; do
    find "${paketti}" \
    -not -path \*.eggs/\* \
    -not -name \*neomake\* \
    "(" -name \*.py -or -name \*.html -or -name \*.js -or -name \*.css ")" \
    "${@}"
  done
}
