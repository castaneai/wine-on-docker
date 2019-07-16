#!/bin/sh
Xvfb :0 -screen 0 640x394x24 -listen tcp -ac &
x11vnc -display :0 -shared -forever -passwd 1234 -q &
sleep 0.5

DISPLAY=:0.0 wine notepad
