keys=$(echo "$3" | sed 's:":\\":g')
ssh $1 tmux send-keys -l "\"/msg $2 $keys\"" &&
    ssh $1 tmux send-keys Enter ||
    termux-toast "AAAAAAAAAAAAA"
