#!/bin/bash

last=$(
  ssh dagothig@165.227.34.49 tail -n 10 "irclogs/liberachat/#diroum.log" \
  | grep -o "<.*>" \
  | tac)
ircnotif=$(readlink -f "$0")
dir=$(dirname $ircnotif)
ircanswer="$dir/ircanswer.sh"

termux-notification \
  -i ircnotif \
  -t "head -n 1 $last" \
  -c "tail -n 4 $last" \
  --alert-once \
  --ongoing \
  --button1 Répondre \
  --button1-action "sh $ircanswer \"\$REPLY\" && sh $ircnotif"
  --button2 Rafraîchir
  --button2-action "sh $ircnotif"
