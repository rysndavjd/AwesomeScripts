#!/bin/bash

# $1 = resolution $2 = framerate $3 = add addition arguments to xrandr
setRes () {
    xrandr --output HDMI-1 --off
    xrandr --output HDMI-1 --mode $1 --pos 0x0 --rotate normal --rate $2 $3
}

xrandr --listmonitors --verbose | grep -q 'HDMI-1 disconnected'
if [ $? == 1 ]
then
    echo "HDMI-1 is connected"
else
    clear
    echo "HDMI-1 is disconnected"
    sleep 1
    exit
fi

PS3="Enter your choice: "
options=("Mirror Display" "Use as second display" "Reset HDMI-1" "Cancel")
select opt in "${options[@]}"
do
    case $opt in
        "Mirror Display")
            clear
            xrandr
            PS3="Enter your choice: "
            options=("1920x1080x60" "custom" "cancel")
            select opt in "${options[@]}"
            do
                case $opt in
                    "1920x1080x60")
                        setRes "1920x1080" "60"
                        echo 'awesome.restart()' | awesome-client
                        exit
                        ;;
                    "custom")
                        echo -n "Enter custom resolution: " 
                        read res
                        echo -n "Enter custom framerate: " 
                        read fps
                        setRes $res $fps
                        echo 'awesome.restart()' | awesome-client
                        exit
                        ;;
                    "cancel")
                        exit
                        ;;
                    *) echo "invalid option $REPLY";;
                esac
            done
            break
            ;;
        "Use as second display")
            clear
            xrandr
            PS3="Enter your choice: "
            options=("1920x1080x60" "custom" "cancel")
            select opt in "${options[@]}"
            do
                case $opt in
                    "1920x1080x60")
                        setRes "1920x1080" "60" '--left-of eDP-1'
                        echo 'awesome.restart()' | awesome-client
                        exit
                        ;;
                    "custom")
                        echo -n "Enter custom resolution: " 
                        read res
                        echo -n "Enter custom framerate: " 
                        read fps
                        setRes $res $fps '--left-of eDP-1'
                        echo 'awesome.restart()' | awesome-client
                        exit
                        ;;
                    "cancel")
                        exit
                        ;;
                    *) echo "invalid option $REPLY";;
                esac
            done
            break
            ;;
        "Reset HDMI-1")
            xrandr --output HDMI-1 --off
            echo 'awesome.restart()' | awesome-client
            exit
            ;;
        "Cancel")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
