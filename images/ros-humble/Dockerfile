FROM osrf/ros:humble-simulation-jammy

# make new user that can use sudo without password
RUN useradd -ms /bin/bash sapience -G sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER sapience

WORKDIR /home/sapience/ros-ws

# use bash as interpreter so source works
SHELL ["/bin/bash", "-c"]

# copy entrypoint
COPY entrypoint.sh /

# install venv and pipx (latter for uv)
RUN sudo apt-get update && \
    sudo apt-get install python3.10-venv pipx -y && \
    # install px4_msgs
    source /opt/ros/humble/local_setup.bash && \
    mkdir src && \
    git clone --depth 1 -b release/1.14 https://github.com/PX4/px4_msgs src/px4_msgs && \
    colcon build --packages-select px4_msgs && \
    # install uv
    pipx install uv && \
    # make entrypoint executable
    sudo chmod +x /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]