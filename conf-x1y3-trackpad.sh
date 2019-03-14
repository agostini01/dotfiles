#!/bin/bash

# This script properly sets trackpad, trackpoint and nav buttons for X1Y3

xinput --set-prop "Synaptics TM3293-011" "libinput Natural Scrolling Enabled" 1
xinput --set-prop "Synaptics TM3293-011" "libinput Tapping Enabled" 1
xinput --set-prop "Synaptics TM3293-011" "libinput Tapping Drag Enabled" 1
xinput --set-prop "Synaptics TM3293-011" "libinput Tapping Drag Lock Enabled" 0
xinput --set-prop "Synaptics TM3293-011" "libinput Natural Scrolling Enabled" 1
xinput --set-prop "Synaptics TM3293-011" "libinput Disable While Typing Enabled" 1
xinput --set-prop "Synaptics TM3293-011" "libinput Middle Emulation Enabled" 1
xinput --set-prop "Synaptics TM3293-011" "libinput Accel Speed" 0.31
xinput --set-prop "Synaptics TM3293-011" "libinput Left Handed Enabled" 0
xinput --set-prop "Synaptics TM3293-011" "libinput Horizontal Scroll Enabled" 1

xinput --set-prop "TPPS/2 Elan TrackPoint" "libinput Accel Speed" 0.40
xinput --set-prop "TPPS/2 Elan TrackPoint" "libinput Accel Profile Enabled" 0 1
