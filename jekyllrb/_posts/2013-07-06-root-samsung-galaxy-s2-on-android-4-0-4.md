---

layout: post

title:       "Root Samsung Galaxy S2 on Android 4.0.4"
description: "The instructions in this guide are for rooting the Samsung Galaxy S2 GT-I9100 on Android 4.0.4 build XXLQ5."

categories: [android]
tags:       [samsung, galaxy, s2]

resources:
  - "[XDA Developers Android and Mobile Development Forum](http://forum.xda-developers.com/showthread.php?t=1103399)"
  - "[Android Authority](http://www.androidauthority.com/galaxy-s2-gt-i9100-root-android-4-0-4-ics-xxlq5-102577/)"

---


The instructions in this guide are for rooting the **Samsung Galaxy S2 GT-I9100** on **Android 4.0.4** build **XXLQ5**.


## Requirements

- Handset USB drivers ( you may install the drivers by installing <a href="http://www.samsung.com/us/kies/">Samsung Kies</a> ).
- USB Debugging must be enabled.
- Samsung Kies and other software that accesses your phone must be disabled (such software can interfere with the procedure; use Windows Task Manager to be sure nothing is running in the background).
- CF-Root Kernel ( <a href="http://download.chainfire.eu/202/CF-Root/SGS2/CF-Root-SGS2_XX_OXA_LQ5-v5.6-CWM5.zip">CF-Root-SGS2_XX_OXA_LQ5-v5.6-CWM5.zip</a>, 6.5 MB ).
- Odin3 1.85 ( <a href="http://www.mediafire.com/?ie9p39s13neawxe">Odin 1.85.zip</a>, 199 kB ).
- Battery is charged up to 75% or more (to avoid interruptions during the process).


## Instructions

1. Extract the contents of the `CF-Root-SGS2_XX_OXA_LQ5-v5.6-CWM5.zip` file to get the file:
	- `CF-Root-SGS2_XX_OXA_LQ5-v5.5-CWM5.tar`
2. Unplug the phone from the computer if it is connected.
3. Turn off the your phone.
4. Put the phone into Download Mode (hold the Volume Down, Home and Power buttons together until the screen turns on).
5. Start Odin.
6. Connect the phone to the PC using the USB cable (in Odin, a message saying "Added!!" will appear on the bottom left of the window).
7. Click on the PDA button and select the file:
	- `CF-Root-SGS2_XX_OXA_LQ5-v5.5-CWM5.tar`
8. Click on the Start button in Odin to start flashing the firmware to your phone.
9. After the flashing completes, your phone will automatically reboot. You should be able to get a "PASS" message on the top left part of Odin (if you get a FAIL message or Odin gets stuck, disconnect your phone from the PC and close Odin, remove the battery from your phone, re-insert it, and do the procedure again).
10. Once you see the Samsung logo on your phone's screen, you can safely disconnect your phone from the PC.
