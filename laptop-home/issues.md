# GPU

## Resources

* [Xorg cannot find amdgpu devices](https://bbs.archlinux.org/viewtopic.php?id=267360)

## How to?

* Xorg logs located at `/var/log/Xorg.0.log`
* For show GPU status type `xrandr --listproviders`

## Packages

* pacman -R xf86-video-ati xf86-video-amdgpu

# Dual Boot

## Resources

* [Dual boot with Windows Arch Wiki](https://wiki.archlinux.org/title/Dual_boot_with_Windows#Fast_Startup_and_hibernation)
* [Windows changes boot order](https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface#Windows_changes_boot_orderDual%20boot%20with%20Windows)
