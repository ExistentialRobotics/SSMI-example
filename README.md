

## TODO:
Add lower level controler for planning



### Before running
1. use catkin build instead of catkin_make
2. give permission to all python scripts

```
cd ~/catkin_ws 
catkin clean
cd ~/catkin_ws/src/SSMI-example
find . -name "*.py" -exec chmod +x {} \;
catkin build
```


### Run the rosnodes
1. Terminal 1: build and launch the simulation node
```
cd ~/catkin_ws
source ./devel/setup.bash
roslaunch semantic_segmentation_husky seg_husky.launch
```

2. Terminal 2: launch the semantic octomap node
```
roslaunch semantic_octomap semantic_octomap.launch
```

3. Terminal 3: launch planner
```
roslaunch semantic_info_gathering run_semantic_exploration.launch
```

### TF
1. World frame: /world
2. Robot body frame: /semantic_segmentation_world
3. Camera Optical frame: /camera_optic



 <div style="display: flex; justify-content: center;">
  <img src="gifs/sim1.gif" width="400" alt="Tracking 1" style="margin-right: 20px;">
  <img src="gifs/sim2.gif" width="400" alt="Tracking 2">
</div>




