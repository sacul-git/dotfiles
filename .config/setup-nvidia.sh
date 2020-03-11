#!/bin/sh
#/usr/bin/setup-nvidia.sh

if system76-power graphics | grep -q 'nvidia'; then
  xrandr --setprovideroutputsource modesetting NVIDIA-0
  xrandr --auto
  xrandr --dpi 96
fi
