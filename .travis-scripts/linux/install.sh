#!/bin/bash
#
# Copyright (C) 2013-2018 Draios Inc dba Sysdig.
#
# This file is part of sysdig .
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
sudo apt-get --force-yes install g++-4.8
# For Bionic which fails due to error 
# "g++-4.8: error: unrecognized command line option ‘-flifetime-dse=1’" 
# added for gcc v>=6(gcc 7 picked up from base image).
mkdir travis_bin
ln -s $(which gcc-4.8) travis_bin/gcc
ln -s $(which g++-4.8) travis_bin/g++
export PATH="${PWD}/travis_bin:${PATH}"
sudo apt-get install rpm linux-headers-$(uname -r) libelf-dev
sudo apt-get purge cmake
