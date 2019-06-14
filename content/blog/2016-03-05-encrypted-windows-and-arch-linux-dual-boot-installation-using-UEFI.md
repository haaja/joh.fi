---
layout: post
title:  "Encrypted Windows and Arch Linux dual-boot installation using UEFI"
author: Janne Haapsaari
date:   2016-03-05 13:30:00
categories:
  - windows
  - linux
  - encryption
  - uefi
  - dual-boot
cover:  "/assets/header_image.jpg"
---

I will start this with a note that this is not a tutorial type of post. It's just
to remind myself how I did this myself. I'm way too lazy to keep updating tutorials
and therefore it's easier to just post some rough guidelines instead of step by
step instructions.

For some time now I've been running a pretty nice dual boot setup with my trusty
old Lenovo X220. I have a 512GB Samsung 840 Pro SSD divided between a [Windows 10](https://www.microsoft.com/en-us/windows)
and [Arch Linux](https://www.archlinux.org/) installations. Both operating systems share the same EFI partition.
This is especially nice as now I have a bit more faith with Windows updates not
screwing up my linux installation. With the fact that the computer is a laptop
comes a requirement that both installations are encrypted. Luckily both
operating systems support full disk encryption and are relatively easy to set up.

Setting up the dual-boot environment is fairly straightforward. First of all I
disabled the secure boot from BIOS/UEFI setup. This is mainly because Arch linux
requires additional steps for using Secure boot and last time I heard it's
somewhat finicky in dual-boot environment.

Second step is to install Windows 10 as usual but leave plenty of free disk
space for the Arch linux installation. In my case I gave Windows about 150GB of
disk space and left rest of it for Arch linux. This is mainly because I spend
most of my time in Arch. After installation disable Fast Start-Up as per
instructed [here](http://www.eightforums.com/tutorials/6320-fast-startup-turn-off-windows-8-a.html).

Now it's time to install Arch linux. Follow the [installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
with the exception of using [LVM over LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
and installing [GRUB in EFI mode](https://wiki.archlinux.org/index.php/GRUB#Installation_2).
I chose to share the EFI-partition created by Windows installation between the
two operating systems. The mount point for shared EFI-partition is /boot/efi.

After Arch linux installation reboot the machine and try booting into both
operating systems. GRUB bootloader should show up an allow you to choose between
Windows and Arch linux. The windows installation is still not encrypted and the
next step is to fix that.

Although my laptop does have a TPM 1.2 I have not been able to use that in a
dual-boot environment. If I only have Windows installed then it's working just
fine. I've tried to find an explanation for that but so far I've not succeeded.
As a workaround I disabled the TPM from BIOS/UEFI setup. I know this is less
than optimal but it's the only way I've managed to get my Windows installation
encrypted. Do choose a really good and long passphrase!

Windows does not allow BitLocker to encrypt using passphrase by default. One has
to change registry to allow BitLocker to do that. Here are steps to do that:

1. Press Windows key and type gpedit.msc. Right click the application and choose Run as Administrator.
2. On the left-hand panel navigate to the Computer Configuration -> Administrative Templates -> Windows Components -> BitLocker Drive Encryption -> Operating System Drives
3. Double click the setting named "Require additional authentication at startup".
4. Check the Enabled radio box and Allow BitLocker without a compatible TPM (requires a password or a startup key on a USB flash drive) checkbox.
5. Click Apply and OK.

Now all that is required is to setup the BitLocker encryption for your installation
drive.

1. Press Windows key and type "This PC"
2. Right click Local Disk (C:) (or whatever that happens to be in your installation).
3. Choose Turn on BitLocker
4. Choose the unlock method. I chose to enter password but USB drive is better if you don't mind using USB drive every time you boot to Windows.
5. Save the recovery key to somewhere safe.
6. Use the new encryption algorithm if possible.
7. Encrypt the used space or whole drive. The latter is safer but requires more time.

And we are done. Reboot the machine and boot into Windows to begin the
encryption process. After the encryption has finished you should have a nice
setup in which both installations are encrypted.
