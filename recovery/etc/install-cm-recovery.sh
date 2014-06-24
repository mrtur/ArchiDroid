#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9017344 5aa1cc61ac43bad780bfe2c1139cd904e44d9415 6684672 36178c27b8bca6f001e0b2efbf49d8ae1f9140e2
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9017344:5aa1cc61ac43bad780bfe2c1139cd904e44d9415; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6684672:36178c27b8bca6f001e0b2efbf49d8ae1f9140e2 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 5aa1cc61ac43bad780bfe2c1139cd904e44d9415 9017344 36178c27b8bca6f001e0b2efbf49d8ae1f9140e2:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
