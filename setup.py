from setuptools import find_packages, setup
import os
from glob import glob

package_name = 'mypkg'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        # 1. パッケージの登録（これが重要！ここがないと ros2 pkg list に出ません）
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        # 2. package.xml のインストール
        ('share/' + package_name, ['package.xml']),
        # 3. Launchファイルのインストール
        (os.path.join('share', package_name, 'launch'), glob('launch/*.launch.py')),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='abcd0315',
    maintainer_email='s24C1087re@s.chibakoudai.jp',
    description='ロボットシステム学',
    license='BSD-3-Clause',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'talker = mypkg.talker:main',
            'listener = mypkg.listener:main',
        ],
    },
)
