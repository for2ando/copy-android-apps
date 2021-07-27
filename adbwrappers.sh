list_adb_devices() {
  _adb devices | grep -v -e '^List of devices attached$' -e '^$'
}

number_of_adb_devices() {
  list_adb_devices | if [ -n "$serial" ]; then grep "^$serial"; else cat -; fi | wc -l
}

_adb() {
  adb ${serial:+-s $serial} "$@" | sed 's/\r$//'
}

run__adb() {
  run _adb "$@"
}

run_adb() {
  run adb ${serial:+-s $serial} "$@"
}

remote_cmd_not_exist() {
  rc=$(adb_echo_result "$@")
  test "$rc" = "127"
}

remote_adb_is_rooted() {
  globmatch "$(adb_shell id)" 'uid=0\(*'
}

remote_su_not_exist() {
  remote_cmd_not_exist su -c echo
}
