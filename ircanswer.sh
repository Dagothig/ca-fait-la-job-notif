#!/bin/bash

termux-toast $1 "$2"
#ssh $1 tmux send-keys -l "$2" && ssh $1 tmux send-keys Enter
