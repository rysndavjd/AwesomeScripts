# A script for setting up external displays in Awesome for laptops.

## Install
To install just place the script in convenient place where Awesome can run it.
Example I placed it in.

```bash
/home/rysndavjd/.config/awesome/func/startExtDisplay.sh
```

Then you add a way of running the script in rc.lua for Awesome.
Example I used modkey + F7 to spawn the script and used kitty for my terminal.

```lua
awful.key({ modkey, }, "F7", function () awful.util.spawn("kitty --detach /home/rysndavjd/.config/awesome/func/startExtDisplay.sh") end), 
```

## Setup

After installing the script edit it and change the "secondaryDisplay" and "mainDisplay"
variables to your chosen displays. (To check the displays use xrandr)
Example my secondary display is HDMI-1 and my main display is eDP-1.

```bash
secondaryDisplay="HDMI-1"
mainDisplay="eDP-1"
```



