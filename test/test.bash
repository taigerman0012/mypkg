#!/bin/bash
dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws

# ▼▼▼ 追加する行 ▼▼▼
# 以前のビルド情報や、rsyncでコピーされた不要なファイルを削除します
rm -rf build install log
# ▲▲▲ 追加する行 ▲▲▲

# ROS 2の基本設定
source /opt/ros/humble/setup.bash

# ビルド実行
colcon build

# 自身のパッケージ設定読み込み
source install/setup.bash

# launch実行
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log 
