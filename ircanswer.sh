#!/bin/bash

echo "$2"
keys=${2//[\']/"\"\'\""}
echo "$keys"
#ssh $1 tmux send-keys -l \'"$keys"\'
# && ssh $1 tmux send-keys Enter
