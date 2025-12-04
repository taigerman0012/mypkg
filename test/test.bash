#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws

# 1. ビルドする前に、ROS 2の基本環境を読み込む（ここに移動！）
source /opt/ros/humble/setup.bash

colcon build

# 2. ビルドが終わったら、自分のパッケージの設定を読み込む
source $dir/ros2_ws/install/setup.bash

timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log
grep 'Listen: 10' /tmp/mypkg.log
