#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws

echo "=== NEW SCRIPT STARTED ==="  # これがログに出れば、最新版だとわかります

# 念のため古いビルドを削除（クリーンビルド）
rm -rf build install

# 1. 必ず先に読み込む
source /opt/ros/humble/setup.bash

colcon build

# 2. その後に自分のパッケージを読み込む
source $dir/ros2_ws/install/setup.bash

timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log
cat /tmp/mypkg.log | grep 'Listen: 10' 
