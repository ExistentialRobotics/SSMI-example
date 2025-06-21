FROM osrf/ros:humble-desktop-full-jammy

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
ENV IGNITION_VERSION=fortress

# Install system and ROS 2 dependencies
RUN apt-get update && apt-get install -y \
    libpcl-dev \
    ros-humble-octomap \
    ros-humble-octomap-msgs \
    ros-humble-octomap-rviz-plugins \
    python3-pip \
    git \
    vim \
    tmux \
    lsb-release \
    gnupg \
    python-is-python3 
#  && rm -rf /var/lib/apt/lists/*

# Install Gazebo Fortress
RUN curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] \
    http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null

RUN apt update && \
    apt install -y ignition-fortress

RUN echo "source ~/colcon_ws/install/setup.bash" >> /root/.bashrc

# Install Python dependencies
RUN pip3 install scikit-image && \
    pip3 install "numpy<2.0" 