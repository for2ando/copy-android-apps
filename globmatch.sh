globmatch() {
  case "$1" in
  $2) true;;
  *) false;;
  esac
}
