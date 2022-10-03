ircnotif=$(readlink -f "$0")
dir=$(dirname $ircnotif)
ircanswer="$dir/ircanswer.sh"

env=$(cat $dir/.env)
connection=$(echo "$env" | grep CONNECTION= | cut -d '=' -f2)
log=$(echo "$env" | grep LOG= | cut -d '=' -f2)
chann=$(echo "$env" | grep CHANN= | cut -d '=' -f2)

last=$(
  ssh $connection tail -n 10 $log \
  | grep "<.*>" \
  | tail -n 5 \
  | tac)
title=$(echo "$last" | head -n 1)

termux-notification \
  -i ircnotif \
  -t "$title" \
  -c "$last" \
  --alert-once \
  --ongoing \
  --button1 Répondre \
  --button1-action "sh $ircanswer $connection $log \$REPLY && sh $ircnotif" \
  --button2 Rafraîchir \
  --button2-action "sh $ircnotif"
