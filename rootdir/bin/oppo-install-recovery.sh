#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:134217728:5ef8c72082c68d30bb7761986386e10a8af43d36; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:33554432:a08b0883186738527cd1fd56e58ad78b59cd3844 \
          --target EMMC:/dev/block/by-name/recovery:134217728:5ef8c72082c68d30bb7761986386e10a8af43d36 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
