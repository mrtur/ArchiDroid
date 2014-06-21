#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9017344 9f7df2a33e6a8e9bdcfe12baea0bf3e5390b11b2 6684672 e05cbf9046f85e308dfc3967fa477479cd295e88
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9017344:9f7df2a33e6a8e9bdcfe12baea0bf3e5390b11b2; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6684672:e05cbf9046f85e308dfc3967fa477479cd295e88 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 9f7df2a33e6a8e9bdcfe12baea0bf3e5390b11b2 9017344 e05cbf9046f85e308dfc3967fa477479cd295e88:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
