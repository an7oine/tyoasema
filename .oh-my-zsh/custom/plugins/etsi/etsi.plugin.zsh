function etsi () {
  vi "+/\v${*}" $(
    (
      find "$( python -c 'print(__import__("sysconfig").get_paths()["purelib"])' )" \
        -name \*.egg-link -exec head -n1 "{}" \;
    ) | while read paketti; do
      git -C "$paketti" grep -E --untracked -l "${*}" | xargs -I % echo "${paketti}/%"
    done | paste -s -
  )
}
