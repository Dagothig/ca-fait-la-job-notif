#!/bin/bash

termux-toast "$@"
ssh $1 tmux send-keys -l '$2
# && ssh $1 tmux send-keys Enter
