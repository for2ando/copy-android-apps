in_args() {
  searched="$1"
  shift
  for arg; do
    test "$arg" = "$searched" && { return 0;}
  done
  return 1;
}
