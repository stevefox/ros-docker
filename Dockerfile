FROM ubuntu:16.04

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN apt-get update && apt-get install -y ros-kinetic-desktop-full  ros-kinetic-desktop && apt-get clean
RUN rosdep init
RUN rossdep update
RUN mkdir -p /usr/local/ros-config
RUN echo "source /opt/ros/kinetic/setup.bash" >> /usr/local/ros-config/.rosrc

