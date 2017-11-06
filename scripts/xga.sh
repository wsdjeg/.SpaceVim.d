#!/bin/bash  
function show_vga()  
{  
    xrandr --output LVDS --mode 1280x800 --output VGA --mode 1024x768  
    echo "vga" > /dev/shm/xscreen-mode  
}  

function show_novga()  
{  
    xrandr --output LVDS --mode 1280x800 --output VGA --off  
    echo "novga" > /dev/shm/xscreen-mode  
}  

function show_ext()  
{  
    xrandr --output LVDS --mode 1024x768 --output VGA --right-of LVDS --mode 1024x768  
    echo "ext" > /dev/shm/xscreen-mode  
}  
case $1 in  
    vga)  
        show_vga  
        ;;  
    novga)  
        show_novga  
        ;;  
    ext)  
        show_ext  
        ;;  
    *)  
        touch /dev/shm/xscreen-mode  
        if [ "`cat /dev/shm/xscreen-mode`" = "vga" ]; then  
            show_ext  
        elif [ "`cat /dev/shm/xscreen-mode`" = "ext" ]; then  
            show_novga  
        else  
            show_vga  
        fi  
        ;;  
esac  
