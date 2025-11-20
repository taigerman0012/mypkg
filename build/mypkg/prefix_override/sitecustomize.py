import sys
if sys.prefix == '/usr':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/home/abcd0315/ros2_ws/src/mypkg/install/mypkg'
