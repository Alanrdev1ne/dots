export QT_QPA_PLATFORMTHEME="qt5ct"
export VISUAL=/usr/bin/nvim
export EDITOR=$VISUAL
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

sh $HOME/.scripts/kb.sh
