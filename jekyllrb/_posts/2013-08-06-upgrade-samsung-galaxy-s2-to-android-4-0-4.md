---

layout: post

title:       "Upgrade Samsung Galaxy S2 to Android 4.0.4"
description: "The instructions in this guide are for upgrading the Samsung Galaxy S2 GT-I9100 to Android 4.0.4 build XXLQ5."

categories: [android]
tags:       [samsung, galaxy, s2]

resources:
  - "[SamMobile Firmware Page](http://www.sammobile.com/firmware/?page=8&amp;view=5235)"
  - "[Android Authority](http://www.androidauthority.com/galaxy-s2-gt-i9100-android-4-0-4-ics-xxlq5-update-102125/)"

---


The instructions in this guide are for upgrading the **Samsung Galaxy S2 GT-I9100** to **Android 4.0.4** build **XXLQ5**.


## Requirements

- Handset USB drivers (you may install the drivers by installing <a href="http://www.samsung.com/us/kies/">Samsung Kies</a>)
- USB Debugging must be enabled
- Samsung Kies and other software that accesses your phone must be disabled (such software can interfere with the procedure; use Windows Task Manager to be sure nothing is running in the background)
- Android 4.0.4 ICS firmware build XXLQ5 (<a href="http://hotfile.com/dl/162208594/226b6f0/I9100XXLQ5_I9100OXALQ5_OXA.zip.html">I9100XXLQ5_I9100OXALQ5_OXA.zip</a>, 387.1 MB)
- Odin3 1.85 (<a href="http://www.mediafire.com/?ie9p39s13neawxe">Odin 1.85.zip</a>, 199 kB)
- Battery is charged up to 75% or more (to avoid interruptions during the process)


## Instructions

1. Extract the contents of the `I9100XXLQ5_I9100OXALQ5_OXA.zip` file to get these files:
	- `I9100_CODE_I9100XXLQ5_CL753921_REV02_user_low_ship.tar.md5`
	- `GT-I9100-MULTI-CSC-OXALQ5.tar.md5`
	- `MODEM_I9100XXLQ5_REV_02_CL1165929.tar.md5`
	- `u1_02_20120326_emmc_EXT4_8GB.pit`
2. Unplug the phone from the computer if it is connected
3. Turn off the your phone
4. Put the phone into Download Mode (hold the Volume Down, Home and Power buttons together until the screen turns on)
5. Start Odin
6. Connect the phone to the PC using the USB cable (in Odin, a message saying "Added!!" will appear on the bottom left of the window)
7. Click on the PDA button and select the file:
	- `I9100_CODE_I9100XXLQ5_CL753921_REV02_user_low_ship.tar.md5`
8. Click on the PHONE button and select the file:
	- `MODEM_I9100XXLQ5_REV_02_CL1165929.tar.md5`
9. Click on the CSC button and select the file:
	- `GT-I9100-MULTI-CSC-OXALQ5.tar.md5`
10. Click on the Start button in Odin to start flashing the firmware to your phone
11. After the flashing completes, your phone will automatically reboot. You should be able to get a "PASS" message on the top left part of Odin (if you get a FAIL message or Odin gets stuck, disconnect your phone from the PC and close Odin, remove the battery from your phone, re-insert it, and do the procedure again)
12. Once you see the Samsung logo on your phone's screen, you can safely disconnect your phone from the PC


{% include resources.html %}

