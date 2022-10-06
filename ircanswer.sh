keys=$(echo "$4" | sed 's:":\\":g')
ssh $2 tmux send-keys -l "\"/msg $3 $keys\"" &&
    ssh $2 tmux send-keys Enter ||
    termux-toast "AAAAAAAAAAAAA"
bash $1
