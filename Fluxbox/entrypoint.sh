#!/bin/bash
set -e
trap ctrl_c INT
function ctrl_c() {
  exit 0
}
rm /tmp/.X1-lock 2> /dev/null &
/opt/noVNC/utils/launch.sh --vnc localhost:$VNC_PORT --listen $NO_VNC_PORT &
/usr/bin/Xvfb $DISPLAY -screen 0 ${VNC_RESOLUTION}x${VNC_COL_DEPTH} &
vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION -SecurityTypes None -localhost no --I-KNOW-THIS-IS-INSECURE &
Fluxbox -display $DISPLAY &
wait
