function luo_ctags() {
  ctags -R --fields=+l --languages=python --python-kinds=-iv \
  --exclude='*.py@neomake_[0-9_]*.py' \
  --exclude='*/.eggs/*.py' \
  --exclude='*/.tox/*.py' \
  --exclude='*/tuotanto/*.py' \
  -f $VIMTAGS \
  $(
    {
      python -c "print(' '.join(map(str, filter(__import__('os').path.isdir, __import__('sys').path))))"
      find "$( python -c 'print(__import__("sysconfig").get_paths()["purelib"])' )" -name \*.egg-link -exec head -n1 '{}' \;
      find "$( python -c 'print(__import__("sysconfig").get_paths()["purelib"])' )" -name direct_url.json -exec jq -r .url '{}' \; | sed 's_^file://__'
    } | sort -u
  )
}
