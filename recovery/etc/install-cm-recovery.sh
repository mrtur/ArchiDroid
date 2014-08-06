#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9025536 de929225e2782cf5c3da3debf1b74015da645287 6686720 6dd2340274a8e88d72e63bc64e917c8873cbd565
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9025536:de929225e2782cf5c3da3debf1b74015da645287; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6686720:6dd2340274a8e88d72e63bc64e917c8873cbd565 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery de929225e2782cf5c3da3debf1b74015da645287 9025536 6dd2340274a8e88d72e63bc64e917c8873cbd565:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
