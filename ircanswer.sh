#!/bin/bash

keys=${2//[\']/\"\'\"}
termux-toast "$keys"
ssh $1 tmux send-keys -l \'"$keys"\'
# && ssh $1 tmux send-keys Enter
