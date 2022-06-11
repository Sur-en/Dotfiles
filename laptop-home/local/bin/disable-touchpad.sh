if [ $(ls /dev/input | grep mouse | wc -l) -gt 1 ]; then
  synclient TouchpadOff=1
fi
