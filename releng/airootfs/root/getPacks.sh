#!/bin/bash
mkdir temp/
cd temp/
wget https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar -xpzf package-query.tar.gz
tar -xpzf yaourt.tar.gz
cd package-query
makepkg -s
sudo pacman -U package-query*.tar.xz
cd ../yaourt
makepkg -s
sudo pacman -U yaourt*.tar.xz

echo "The Yaourt setup is complete, beginning AUR and machine specific software installation";

while :
do
 		echo "Please enter in your graphics card manufacturer: 1 - Nvidia, 2 - AMD, 3 - Intel";
        read gpu
        if [ "$gpu" == '1' ]
        then
				sudo pacman -S xf86-video-nouveau
                break
        fi
        if [ "$gpu" == '2' ]
        then
				sudo pacman -S xf86-video-ati
                break
        fi
        if [ "$gpu" == '3' ]
        then
				sudo pacman -S xf86-video-intel
                break
        fi
		echo "The number you inputted is not in a valid range, please try again";
done
echo "Seaching for the Compton package, please hit the number that corresponds to the package listed with name 'Compton'"
yaourt compton
cd ../../
rm -rf temp/
echo "Core drivers and AUR packages have been installed, run startx to launch the graphical environment"
