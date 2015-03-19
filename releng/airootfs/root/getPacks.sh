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

while :; do
 	echo "Please select a graphic card driver to install for X: 1 - Nvidia (nouveau), 2 - AMD (radeon), 3 - Intel";
 	echo "4 - VMware virtual VGA, 5 - Generic framebuffer driver, 6 - Generic VESA driver (for anything else)"
 	echo "If you have an unlisted card, choose 6. You may install drivers for other devices later."
        
        read gpu
        case $gpu in
		"1")	sudo pacman -S xf86-video-nouveau
			break
			;;
		"2")	sudo pacman -S xf86-video-ati
			break
			;;
		"3")	sudo pacman -S xf86-video-intel
			break
			;;
		"4")	sudo pacman -S xf86-video-vmware
			break
			;;
		"5")	sudo pacman -S xf86-video-fbdev
			break
			;;
		"6")	sudo pacman -S xf86-video-vesa
			break
			;;
		*)	echo "The number you inputted is not in the valid range, please try again"
			;;
	esac
done
echo "Seaching for the Compton package, please hit the number that corresponds to the package listed with name 'Compton'"
yaourt compton
cd ../../
rm -rf temp/
echo "Core drivers and AUR packages have been installed, run startx to launch the graphical environment"
