# First Time Install (Already Installed)

Follow tutorial to install ROS2 PX4 

Install the gazebo ros2 sensor bridge this allows a bridge connection for the gazebo sensors to send messages to the ros2 ecosystem
``` 
sudo apt install ros-humble-ros-gzgarden
```



# Running Simulation

Run px4 sitl, this loads up the depth camera with the quadcopter
```
make px4_sitl gz_x500_depth
```
Run the agent client
```
MicroXRCEAgent udp4 -p 8888
```

Bridge the camera gazebo to the ros2 gazebo topic, refer to the documentation here for how it works https://github.com/gazebosim/ros_gz/blob/ros2/ros_gz_bridge/README.md
```
ros2 run ros_gz_bridge parameter_bridge camera@sensor_msgs/msg/Image@gz.msgs.Image
```

View the camera, click on the down arrow on the GUI and select "camera", you should be able to see it
```
ros2 run rqt_image_view rqt_image_view
```

# I'm lazy
go in this directory and do the following
```
./run_sim.sh
```
It'll run all those commmands above

