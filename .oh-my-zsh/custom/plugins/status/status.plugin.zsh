function status() {
  (
    find "$( python -c 'print(__import__("sysconfig").get_paths()["purelib"])' )" \
      -name \*.egg-link -exec head -n1 "{}" \;
  ) | sort | while read g
  do echo -n "`basename $g` : "
    git -C "$g" status "-${@:-bs}"
  done
}
