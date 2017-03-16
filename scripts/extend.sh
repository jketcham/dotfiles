#!/bin/sh
# extend non-HiDPI external display on DP* above HiDPI internal display eDP*
# see also https://wiki.archlinux.org/index.php/HiDPI
# you may run into https://bugs.freedesktop.org/show_bug.cgi?id=39949
#                  https://bugs.launchpad.net/ubuntu/+source/xorg-server/+bug/883319

SCALE=1.75
EXT=`xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep -v ^eDP | head -n 1`
INT=`xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep -v ^DP | head -n 1`

ext_w=`xrandr | sed 's/^'"${EXT}"' [^0-9]* \([0-9]\+\)x.*$/\1/p;d'`
ext_h=`xrandr | sed 's/^'"${EXT}"' [^0-9]* [0-9]\+x\([0-9]\+\).*$/\1/p;d'`
int_w=`xrandr | sed 's/^'"${INT}"' [^0-9]* \([0-9]\+\)x.*$/\1/p;d'`
int_h=`xrandr | sed 's/^'"${INT}"' [^0-9]* [0-9]\+x\([0-9]\+\).*$/\1/p;d'`
# off_h=`echo $(( ($ext_h)/2 )) | sed 's/^-//'`

pan1=`echo $ext_w*$SCALE | bc`
pan2=`echo $ext_h*$SCALE | bc` #$((ext_h*SCALE))

echo ${ext_w}
echo ${ext_h}
echo ${int_w}
echo ${int_h}
echo ${pan1}
echo ${pan2}

xrandr --output "${INT}" --auto --output "${EXT}" --auto --panning ${pan1%.*}x${pan2%.*}+${ext_w}+0 --scale ${SCALE}x${SCALE} --right-of "${INT}" --primary
# xrandr --output "${INT}" --auto --pos ${ext_w}x${off_h} --scale 1x1 --output "${EXT}" --auto --scale 1.7x1.7 --pos 0x0 --primary --right-of "${INT}"
