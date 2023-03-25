#! /bin/bash

if [ "$(id -u)" -ne 0 ]; then
  echo "Please run the script with sudo!" >&2
  exit 1
fi

#Repositorios RPMFusion
RPMFusion() {
  sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
  sudo dnf install -y \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
}
  
#Codecs multimedia
multimedia() {
  sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg ffmpeg-devel
  sudo dnf install -y lame\* --exclude=lame-devel
  sudo dnf group upgrade -y --with-optional Multimedia
}

#Flatpak
flatpak() {
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

SELECTIONS=$(whiptail --title "Post Installs" --checklist "Select packages to be installed:" 20 80 5\
              "1" "RPMFusion              " OFF\
              "2" "Codecs multimedia      " OFF \
              "3" "Flatpak              " OFF 3>&1 1>&2 2>&3)

if [[ $SELECTIONS == *"1"* ]];
then 
  echo "RPMFusion [INSTALLING]"
  RPMFusion
fi

if [[ $SELECTIONS == *"2"* ]];
then 
  echo "Codecs multimedia [INSTALLING]"
  multimedia
fi

if [[ $SELECTIONS == *"3"* ]];
then 
  echo "Flatpak [INSTALLING]"
  flatpak
fi