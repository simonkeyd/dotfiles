#!/bin/bash
song=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/artist/,+2{1,+1d;p};/title/{n;p}' | cut -d '"' -f2 | sed 'N;s/\n/ - /')
echo -e '\uf90c ' $song
