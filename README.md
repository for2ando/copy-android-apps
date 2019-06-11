copy-android-apps
=======================

## Overview
Copy from and install to Android apps and data with remote Android device and PC via adb

## Description
### get-android-apps
- You can list Android apps on a remote Android device.
- You can copy argument-designated Android apps (.apk) and/or data (adb backup) from a remote Android device to your PC.
This shell script uses the adb command.

### put-android-apps
- You can install Android apps (.apk) and/or restore data (adb backup) from your PC to a remote Android device.
You can designate .apk and/or .ab files to install and/or restore.
This shell script uses the adb command.



## Demo
    $ adb devices -l
    List of devices attached
    XXXXXXXXXX             device product:shamu model:Nexus_6 device:shamu
    
    $ get-android-apps list -3 | tee appslist
    (now working)
    $ get-android-apps apk `cat appslist`
    (now working)
    $ ls
    (now working)
    $ get-android-apps ab `cat appslist`
    (now working)
    $ ls
    (now working)


## Requirement
* one of following environments on your PC: Unix, or Cygwin, msys2, ubuntu on Windows (some are not tested.)
* bash command line shell on your PC
* adb command on your PC
* adb debug switch is ON on your Android device.
* read permissions for partitions-device-file's directory (/dev/block/**/by-name by default) on your Android device
* white permissions for working directory (/data/local/tmp by default) on your Android device

Some of above usually require ROOT permissions.

## Usage
    dump-android-partitions [-lvnt] [-p GLOB] [-s SERIAL] [-x EXCLUDE] [-w WORKDIR] {-a|PARTITION ...}
    dump-android-partitions -l {-a|PARTITION ...}
    dump-android-partitions -h
      -a
        dump all partitions except those designated with -x option
      -l
        list partition names on a device and exit
      -p GLOB
        A shell glob pattern to search directories that includes partition names as file(node) names
        example: dump-android-partitions -p /dev/block/platform/*/msm_sdcc.1/by-name
        To use multiple globs, you can repeat -p options.
        default: /dev/block/*/*/by-name /dev/block/*/*/*/by-name /dev/block/*/*/by-num /dev/block/*/*/*/by-num
      -s SERIAL
        use device with given serial number (overrides $ANDROID_SERIAL), same as adb command
      -t
        TEST mode.
        Get dumped images by both a traditional dd method and a cat method (dump-android-partitions is normailly used this),
        and compare both images by cmp command. If two images differ, perhaps the cat method is buggy.
      -w WORKDIR
        a working directory path on a remote adb device, used only on TEST mode.
        default: /data/local/tmp
      -x EXCLUDE
        A file includes partition names to be excluded from dumping
        default: dump.exclude
      -h
        print this message and exit
      -v
        verbosely echoing information messages
      -n
        dry-run
      PARTITION
        a partition name to be dumped. shell globbing available


## Example


## Install
    sudo mkdir -p /usr/local/bin
    sudo cp dump-android-partitions /usr/local/bin

## Contribution
(now working)


## Licence
[GPL v3](https://www.gnu.org/licenses/lgpl.txt)


## Author
[for2ando/forzando](https://github.com/for2ando)


