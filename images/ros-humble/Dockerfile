FROM osrf/ros:humble-simulation-jammy

WORKDIR /sapience/ros-ws

# use bash as interpreter so source works
SHELL ["/bin/bash", "-c"]

# install venv
RUN sudo apt-get update && \
    sudo apt-get install python3.10-venv -y && \
    # install px4_msgs
    source /opt/ros/humble/local_setup.bash && \
    mkdir src && \
    git clone --depth 1 -b release/1.14 https://github.com/PX4/px4_msgs src/px4_msgs && \
    colcon build --packages-select px4_msgs && \
    # source installed
    source /sapience/ros-ws/install/local_setup.bash
