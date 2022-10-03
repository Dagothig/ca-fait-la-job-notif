#!/bin/bash

termux-toast "$@"
ssh $1 tmux send-keys -l WAAAA
# && ssh $1 tmux send-keys Enter
