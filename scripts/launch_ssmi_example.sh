#!/bin/bash

SESSION_NAME="ssmi-ex"

# Check if the session already exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Session $SESSION_NAME already exists. Attaching to it."
    tmux attach-session -t $SESSION_NAME
else
    # Create a new session and name it
    tmux new-session -d -s $SESSION_NAME
    tmux split-window -v 
    tmux split-window -v
    tmux split-window -v
    tmux split-window -fh
    #0 is top left, 3 is bottom left
    #4 is right half
    
    # Send a command to the first pane
    #tmux send-keys -t 0 'echo "Hello from pane 1"' C-m
    
    tmux send-keys -t 0 'roslaunch semantic_segmentation_husky seg_husky.launch' C-m
    
    
    # Send a command to the second pane
    #tmux send-keys -t 1 'echo "Hello from pane 2"' C-m
    
    tmux send-keys -t 1 'sleep 5 ; roslaunch semantic_octomap semantic_octomap.launch' C-m

    tmux send-keys -t 2 'sleep 8 ; roslaunch semantic_info_gathering run_semantic_exploration.launch' C-m
    
    tmux send-keys -t 3 'sleep 10 ; roslaunch semantic_segmentation_husky jackal_pd.launch' C-m
    tmux -t $SESSION_NAME select-window -t 4
    
    #start on the left terminal so the robot can be controlled
    #see what session this puts us on
    
    # Attach to the created session
    tmux attach-session -t $SESSION_NAME 
    
fi
