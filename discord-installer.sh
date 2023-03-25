#! /bin/bash

if [ "$(id -u)" -ne 0 ]; then
        echo "Please run the script with sudo!" >&2
        exit 1
fi

wget "https://discordapp.com/api/download/canary?platform=linux&format=tar.gz" -O discord_latest.tar.gz
tar -xvzf discord_latest.tar.gz -C /opt
ln -sf /opt/Discord/Discord /usr/bin/Discord
rm discord_latest.tar.gz
