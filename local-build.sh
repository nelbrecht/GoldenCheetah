#!/bin/bash

make clean &&
  time qmake -recursive &&
  time make -j 4 >~/make-`git describe --tags`.out 2>&1 &&
  cp src/GoldenCheetah ~/GoldenCheetah-`git describe --tags`

export u=${HOME}
sudo setcap 'cap_net_raw,cap_net_admin+eip' ${u}/GoldenCheetah-`git describe --tags`
sudo getcap  ${u}/GoldenCheetah*
