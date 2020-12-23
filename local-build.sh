#!/bin/bash

make clean &&
  time qmake -recursive &&
  time make -j 4 >~/make-`git describe --tags`.out 2>&1 &&
  cp src/GoldenCheetah ~/GoldenCheetah-`git describe --tags`

sudo setcap 'cap_net_raw,cap_net_admin+eip' ~ne/GoldenCheetah-`git describe --tags`
sudo getcap  /home/ne/GoldenCheetah*
