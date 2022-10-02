#!/bin/bash

ssh $1 tmux send-keys -l "$2"
#&&
#ssh dagothig@165.227.34.49 tmux send-keys Enter
