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

echo $ircnotif
echo $ircanswer

termux-notification \
  -i ircnotif \
  -t "$title" \
  -c "$last" \
  --alert-once \
  --ongoing \
  --button1 Répondre \
  --button1-action "sh $ircanswer $1 \$REPLY" \
  --button2 Rafraîchir \
  --button2-action "sh $ircnotif $1 $2"
