last=$(ssh dagothig@165.227.34.49 \
  tail -n 5 irclogs/liberachat/#diroum.log)
title=$(echo "$last" | tail -n 1)
termux-notification \
  -i ircnotif \
  -t "$title" \
  -c "$last" \
  --alert-once \
  --ongoing \
  --button1 Répondre \
  --button1-action "ssh dagothig@165.227.34.49 tmux send-keys -l '\$REPLY' && ssh dagothig@165.227.34.49 tmux send-keys Enter && sh /data/data/com.termux/files/home/ircnotif.sh || termux-toast Feck"
