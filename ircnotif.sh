ircnotif=$(readlink -f "$0")
dir=$(dirname $ircnotif)
ircanswer="$dir/ircanswer.sh"

source $dir/.env

new=$(
  ssh $CONNECTION tail -n 10 $LOG \
  | grep "<.*>" \
  | tail -n 5 \
  | tac)
title=$(echo "$new" | head -n 1)

termux-notification \
  -i ircnotif \
  -t "$title" \
  -c "$new" \
  --alert-once \
  --ongoing \
  --button1 Répondre \
  --button1-action "sh '$ircanswer' '$ircnotif' '$CONNECTION' '$CHANN' \$REPLY" \
  --button2 Rafraîchir \
  --button2-action "sh $ircnotif"

if [ -n "$TAGS" ]; then
  echo "$new" > $dir/new.txt

  onlynew=$(
    git diff --no-index $dir/last.txt $dir/new.txt |
    grep "^+..:..")

  if [ -n "$onlynew" ]; then
    echo "$TAGS" | sed "s/,/\n/g" | while read tag; do
      if [ "$tag" == "nick" ]; then
        match=$(echo "$onlynew" | grep "^+..:.. <.*> $NICK:")
      else
        match=$(echo "$onlynew" | grep "$tag")
      fi
      if [ -n "$match" ]; then
        nohup play "$dir/$tag.mp3" &
        break 2
      fi
    done
  fi

  mv -f $dir/new.txt $dir/last.txt
fi
