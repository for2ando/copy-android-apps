run() {
  ${verbosep:-false} && echo "$@">&2
  ${dryrunp:-false} || "$@"
}
