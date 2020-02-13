#!/usr/bin/env bash

icon="$HOME/Pictures/Backgrounds/RickAndMorty.png"
tmpbg='/tmp/screen.png'

revert() {
  rm "$tmpbg"
  xset dpms 0 0 0
}
trap revert HUP INT TERM

xset +dpms dpms 0 0 5

scrot "$tmpbg"
convert -blur 0x8 "$tmpbg" "$tmpbg"
convert -composite "$tmpbg" "$icon" -gravity South -geometry -20x1200 "$tmpbg"
i3lock -u -i "$tmpbg"
