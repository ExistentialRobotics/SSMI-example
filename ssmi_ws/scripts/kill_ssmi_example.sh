#!/bin/bash

SESSION_NAME="ssmi-ex"

# Check if the session already exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Session $SESSION_NAME exists. Killing it."
    tmux kill-session -t $SESSION_NAME
else
    echo "Session $SESSION_NAME does not exist. Nothing to kill."
fi
