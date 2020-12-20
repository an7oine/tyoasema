function html_aihiot () {
  diff -u <(
    find . -name \*.html \
    | sed -n 's#.*/templates/##p' \
    | sort -u
  ) <(
    grep -REIho '(['"'"'"])[a-z][^'"'"'"]*\.html\1' --exclude \*@neomake\* --exclude ./.tags . \
    | tr -d '"'"'" \
    | sort -u
  )
}
