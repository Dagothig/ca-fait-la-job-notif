#!/bin/bash

last=$(
  ssh $1 tail -n 20 $2 \
  | grep "<.*>" \
  | tail -n 5 \
  | tac)
ircnotif=$(readlink -f "$0")
dir=$(dirname $ircnotif)
ircanswer="$dir/ircanswer.sh"
title=$(echo "$last" | head -n 1)
content=$(echo "$last" | tail -n 4)

termux-notification \
  -i ircnotif \
  -t "$title" \
  -c "$content" \
  --alert-once \
  --ongoing \
  --button1 Répondre \
  --button1-action "sh $ircanswer $1 \"\$REPLY\" && sh $ircnotif $1 $2" \
  --button2 Rafraîchir \
  --button2-action "sh $ircnotif"
