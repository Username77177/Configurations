./build_install.sh
ln -sfr 40-libinput.conf.mouseconfig /usr/share/X11/xorg.conf.d/40-libibput.conf
ln -s /usr/share/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf
cd ~/Configurations
./install_programms_ubuntu.sh
