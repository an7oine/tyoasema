function etsi () {
  vi "+/\v${*}" $(
    {
      # Vanhat .egg-link -tyyppiset asennukset.
      find "$( python -c 'print(__import__("sysconfig").get_paths()["purelib"])' )" \
        -name \*.egg-link -exec head -n1 '{}' \;

      # PEP 660 -yhteensopivat asennukset.
      find "$( python -c 'print(__import__("sysconfig").get_paths()["purelib"])' )" \
        -name direct_url.json -exec jq -r .url '{}' \; | sed 's_^file://__'

    } | while read paketti; do
      git -C "$paketti" grep -E --untracked -l -- "${*}" | xargs -I % echo "${paketti}/%"
    done #| paste -s -
  )
}
