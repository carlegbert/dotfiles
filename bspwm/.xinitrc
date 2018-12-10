#! /bin/sh


[ -f ~/.Xdefaults ] && xrdb -merge ~/.Xdefaults

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && source "$f"
  done
  unset f
fi

if [ "$(command -v bspwm)" > /dev/null 2>&1 ]; then
  sxhkd & exec bspwm
fi
