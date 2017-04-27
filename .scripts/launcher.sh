#!/bin/bash

# this was shamelessly stolen from SO

launcher=$(gsettings get \
         org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ \
         launcher-hide-mode)

if [ $launcher -eq 1 ]; then
    gsettings set \
    org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ \
    launcher-hide-mode 0
else
    gsettings set \
    org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ \
    launcher-hide-mode 1
fi
