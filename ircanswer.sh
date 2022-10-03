#!/bin/bash

keys=$(echo "$2" | sed "s:':\"'\":g")
echo "$keys"
ssh $1 tmux send-keys -l \'"$keys"\'
# && ssh $1 tmux send-keys Enter
