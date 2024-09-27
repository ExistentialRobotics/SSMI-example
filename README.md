### Introduction
This is the demo repository of [SSMI](https://github.com/ExistentialRobotics/SSMI.git)
### Requirements
1. Ubuntu 20.04 and ROS Noetic
2. Gazebo Fortress [Gazebo Fortress installation](https://gazebosim.org/docs/fortress/install_ubuntu)
3. Othrer dependencies in submodules


### Ros node:
Please source the workspace before running the nodes
1. Terminal 1: launch the simulation node
```
roslaunch semantic_segmentation_husky seg_husky.launch
```

2. Terminal 2: launch mapping node
```
roslaunch semantic_octomap semantic_octomap.launch
```

3. Terminal 3: launch planning node
```
roslaunch semantic_info_gathering run_semantic_exploration.launch
```

4. Terminal 4: launch controller
```
roslaunch semantic_segmentation_husky jackal_pd.launch
```

5. Launch all nodes at once with scripts
```
./ssmi_ws/scripts/launch_ssmi_example.sh
./ssmi_ws/scripts/kill_ssmi_example.sh
```
### TF
1. World frame: /world
2. Robot body frame: /base_link
3. Camera Optical frame: /camera_optic

### Docker 
We also provide docker image for demo, it has been tested on Ubuntu 22.04 with Nvidia GPU. You need Nvidia driver to display the simulation. Other graphics card may work but not guaranteed.

In dockerfile we install package python-is-python3, which is not suggested to install on your host machine. 
1. Build the docker image
```
docker compose build
```
2. Start container and run the demo
```
docker compose up
```
3. Open container with bash
```
docker compose run ssmi_demo bash
```
### Desired result
If everything is set up correctly, you shold see robot exploring around like this:
![demo](demo.gif)
