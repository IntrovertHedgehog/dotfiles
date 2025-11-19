#!/bin/sh

BLANK='#00000000'
HIGHLIGHT='#e5c07bff'
TEXT='#eeeeeeff'
TEXT2='#e5c07bff'
BACKGROUND='#282c34bb'
DEFAULT='#56b6c2bb'
WRONG='#e06c75bb'
VERIFYING='#98c379cc'

i3lock \
--tiling \
--radius=110 \
--ignore-empty-password \
--insidever-color=$BACKGROUND \
--ringver-color=$VERIFYING \
\
--insidewrong-color=$BACKGROUND \
--ringwrong-color=$WRONG \
\
--inside-color=$BACKGROUND \
--ring-color=$DEFAULT \
--line-color=$BLANK \
--separator-color=$DEFAULT \
\
--verif-color=$TEXT \
--wrong-color=$TEXT \
--time-color=$TEXT \
--date-color=$HIGHLIGHT \
--layout-color=$TEXT \
--keyhl-color=$HIGHLIGHT \
--bshl-color=$HIGHLIGHT \
--modif-color=$HIGHLIGHT \
\
--screen 1 \
--blur 5 \
--clock \
--indicator \
--time-str="%H:%M:%S" \
--date-str="%A, %Y-%m-%d" \
--verif-text="..." \
--wrong-text="!" \
--noinput-text="??" \
--lock-text="" \
--time-font="Terminess Nerd Font" \
--date-font="Terminess Nerd Font" \
--verif-font="Terminess Nerd Font" \
--wrong-font="Terminess Nerd Font" \
--layout-font="Terminess Nerd Font" \
--greeter-font="Terminess Nerd Font" \
--keylayout 1 \
