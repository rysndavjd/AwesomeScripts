# A very basic script to run slock to lock the screen

## Install
First install the package slock then install the script in convenient place where Awesome can run it.
Example I placed it in.

```bash
/home/rysndavjd/.config/awesome/func/lock.sh
```

Then you add a way of running the script in rc.lua for Awesome.
Example I used modkey + F10 to run the script.

```lua
awful.key({ modkey, }, "F10", function () awful.util.spawn("/home/rysndavjd/.config/awesome/func/lock.sh") end), 
```

If you want your display to autolock install the package xautolock then add

```bash
xautolock -time "NumberOfMinutes" -locker slock
```

To run at start up you can use .xinit or a script that awesome runs at launch.
To change how long untill it will autolock just change the NumberOfMinutes to how long you want.