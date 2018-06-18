#!/bin/bash

sh -c "sleep 3"
sudo xfconf-query -c xsettings -p /Net/ThemeName -s "DarK"
sudo xfconf-query -c xsettings -p /Net/IconThemeName -s "DarK"
sudo xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image  -s /usr/share/backgrounds/xfce/highway_by_axiomdesign-d9em9fs.jpg

