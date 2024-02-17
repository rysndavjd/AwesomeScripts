# A script for setting volume using pulseaudio/pipewire through pactl.

## Install
To install just place in a convenient place for Awesome 
Example I placed in

```bash
/home/rysndavjd/.config/awesome/func/
```

And add a way of running the script in rc.lua for Awesome.
Example for decAudio modkey + F2 to run, which mutes volume.

```lua
awful.key({ modkey, }, "F1", function () awful.util.spawn("/home/rysndavjd/.config/awesome/func/muteAudio.sh") end), 
```
Example for decAudio modkey + F2 to run, which decreases volume.

```lua
awful.key({ modkey, }, "F2", function () awful.util.spawn("/home/rysndavjd/.config/awesome/func/decAudio.sh") end), 

```
Example for decAudio modkey + F3 to run, which increases volume.

```lua
awful.key({ modkey, }, "F3", function () awful.util.spawn("/home/rysndavjd/.config/awesome/func/incAudio.sh") end), 
```

## Setup
To setup set the default audio output using pactl by running first

```bash
pactl get-default-sink
```

Example output: alsa_output.pci-0000_00_1f.3.analog-stereo

To get available audio outputs then do 

```bash
pactl get-default-sink "available outputs from other command"
```

Or just use a GUI app like pavucontrol to set default output and configuration.



