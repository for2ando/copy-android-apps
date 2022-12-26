get-glitch-type() {
  devname="$1"
  devlist="$2"
  glitchtype=$(awk '
    /^[ \t]*#/ { next }
    $2 == "'"$devname"'" { print $1 }
  ' "$devlist")
  test -z "$glitchtype" && glitchtype=0
  echo $glitchtype
}
