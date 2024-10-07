FROM osrf/ros:noetic-desktop-full

ENV IGNITION_VERSION=fortress

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    git \
    vim \
    lsb-release \
    python3-catkin-tools \
    python3-pip \
    curl \
    python-is-python3 \
    mesa-utils \
    libpcl-dev \
    liboctomap-dev \
    ros-noetic-octomap \
    ros-noetic-octomap-msgs \
    ros-noetic-octomap-rviz-plugins \
    ros-noetic-pcl-ros \
    tmux \
    ros-noetic-teleop-twist-keyboard \
    python3-tk

RUN curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] \
    http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" \
    > /etc/apt/sources.list.d/gazebo-stable.list

RUN apt-get update && \
    apt-get install -y ignition-fortress


RUN rosdep init || true && \
    rosdep update

COPY ssmi_ws/ /root/ssmi_ws
RUN cd /root/ssmi_ws/src/ros_gz/ && \
    rosdep install -r --from-paths . -i -y --rosdistro noetic

RUN pip3 install scikit-image

RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc && \
    /bin/bash -c "source /opt/ros/noetic/setup.bash && \
    cd /root/ssmi_ws && \
    catkin build || true && \
    source devel/setup.bash && \
    catkin build && \ 
    source devel/setup.bash"

RUN echo "source /root/ssmi_ws/devel/setup.bash" >> /root/.bashrc

ENV QT_X11_NO_MITSHM=1

CMD ["/bin/bash"]

