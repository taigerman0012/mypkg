#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws

# ★目印を追加
echo "=== NEW TEST START ==="

# 1. ROS 2の基本設定（ビルドの前！）
source /opt/ros/humble/setup.bash

colcon build

# 2. 自分のパッケージ設定
source $dir/ros2_ws/install/setup.bash

timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log
cat /tmp/mypkg.log | grep 'Listen: 10' 
