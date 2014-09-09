#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9017344 e56a03ba720838cf28d34f2ef9d4a77e927f3aa9 6686720 e53e372df94003b23274bedfa56bde31ebde22cd
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9017344:e56a03ba720838cf28d34f2ef9d4a77e927f3aa9; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6686720:e53e372df94003b23274bedfa56bde31ebde22cd EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery e56a03ba720838cf28d34f2ef9d4a77e927f3aa9 9017344 e53e372df94003b23274bedfa56bde31ebde22cd:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
