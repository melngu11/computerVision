#!/bin/bash

# Change to the directory where you want to run the command
cd /home/intern/PX4-Autopilot

# Start a new Tmux session named "my_session"
tmux new-session -d -s my_session

# Split the Tmux window horizontally
tmux split-window -h -t my_session

# Split the first pane vertically
tmux split-window -v -t my_session:0.0

# Send the first command to the first pane
tmux send-keys -t my_session:0.0 'make px4_sitl gz_x500_depth' C-m

# Send the second command to the second pane
tmux send-keys -t my_session:0.1 'MicroXRCEAgent udp4 -p 8888' C-m

# Split the second pane horizontally
tmux split-window -h -t my_session:0.1

# Send the third command to the third pane
tmux send-keys -t my_session:0.2 'ros2 run ros_gz_bridge parameter_bridge camera@sensor_msgs/msg/Image@gz.msgs.Image' C-m

# Send the fourth command to the fourth pane
tmux send-keys -t my_session:0.3 'ros2 run rqt_image_view rqt_image_view' C-m

# Attach to the Tmux session (you can detach with Ctrl-b, d)
tmux attach -t my_session
