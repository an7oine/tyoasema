function luo_ctags() {
  ctags -R --fields=+l --languages=python --python-kinds=-iv \
  --exclude='*.py@neomake_[0-9_]*.py' \
  --exclude='*/.eggs/*.py' \
  --exclude='*/.tox/*.py' \
  -f $VIMTAGS \
  $(
    python -c "print(' '.join(map(str, filter(__import__('os').path.isdir, __import__('sys').path))))"
  )
}
