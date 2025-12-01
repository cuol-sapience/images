#!/bin/bash
set -e

source /opt/ros/humble/local_setup.bash
source /home/sapience/ros-ws/install/local_setup.bash

# add pipx installed packages (eg uv) to path
export PATH=$PATH:/home/sapience/.local/bin/

exec "$@"
