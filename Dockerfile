FROM osrf/ros:kinetic-desktop-full

RUN apt update && \
    apt upgrade -y

RUN apt install -y \
    nano git sudo tmux \
    x11-apps mesa-utils \
    iputils-ping net-tools \
    python-catkin-tools

RUN useradd -u 1000 -m -U -G sudo -s /bin/bash docker && \
    echo "docker:docker" | chpasswd
USER docker
WORKDIR /home/docker

RUN touch ~/.sudo_as_admin_successful && \
    sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc && \
    echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc
