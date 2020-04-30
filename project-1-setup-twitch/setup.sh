#!/usr/bin/env bash

# Stritc mode
set -euo pipefail

# VARS
# Tried with version 25-> fail because of old cmake
OBS_BRANCH="24.0.0"

# Basic req

sudo yum install -y \
     make gcc gcc-c++ gcc-objc cmake \
     git libX11-devel mesa-libGL-devel \
     libv4l-devel pulseaudio-libs-devel \
     libspeexdsp-devel x264-devel \
     freetype-devel fontconfig-devel \
     libXcomposite-devel libXinerama-devel \
     qt5-qtbase-devel qt5-qtx11extras-devel \
     qt5-qtsvg-devel libcurl-devel \
     systemd-devel ffmpeg ffmpeg-devel \
     luajit-devel python3-devel mbedtls \
     mbedtls-devel swig

# Check if libspeexdsp-devel is installed

rpm -q libspeexdsp-devel || {
    rm -rf speexdsp
    git clone https://git.xiph.org/speexdsp.git
    pushd speexdsp
    ./autogen.sh
    ./configure
    make 
    sudo make install
    popd
}

# Check for nvidia
{ lspci | grep -i nvidia && \
  [ "$(lsmod | grep -c nvidia )" -lt 1 ] && \
  sudo yum install -y xorg-x11-drv-nvidia-cuda
} || {
  echo "-> info: NVIDIA card not found"
}


wget --continue https://cdn-fastly.obsproject.com/downloads/cef_binary_3770_linux64.tar.bz2
tar -xjf ./cef_binary_3770_linux64.tar.bz2
rm -rf obs-studio
git clone --branch $OBS_BRANCH --recursive https://github.com/obsproject/obs-studio.git
cd obs-studio
mkdir build && cd build
cmake -DUNIX_STRUCTURE=1 -DBUILD_BROWSER=ON -DCEF_ROOT_DIR="../../cef_binary_3770_linux64" ..
make -j4
sudo make install

