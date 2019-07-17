#!/bin/sh
Xvfb :0 -screen 0 800x600x24 &
x11vnc -display WAIT:0 -shared -forever -passwd 1234 -q &
DISPLAY=:0.0 wine64 notepad