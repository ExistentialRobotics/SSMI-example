

## TODO:
1. Set stactic transformation in launch file.
2. Add SSMI-Planning
3. Use submodules instead of hard copies







### Run the rosnodes
1. Terminal 1: build and launch the simulation node
```
cd ~/catkin_ws
catkin build
source ./devel/setup.bash
roslaunch semantic_segmentation_husky seg_husky.launch
```

2. Terminal 2: launch the semantic octomap node
```
roslaunch semantic_octomap semantic_octomap.launch
```

 <div style="display: flex; justify-content: center;">
  <img src="gifs/sim1.gif" width="400" alt="Tracking 1" style="margin-right: 20px;">
  <img src="gifs/sim2.gif" width="400" alt="Tracking 2">
</div>




