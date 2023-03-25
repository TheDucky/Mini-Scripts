#! /bin/bash

NC='\033[0m'
R='\033[31m'
P='\033[35m'

host=$(hostname)
user=$(whoami)
ip=$(curl --silent ifconfig.me)
kernal=$(uname -r)

date=$(date "+%A %d %B %Y, %T")
disk=$(df -T -h | awk '$NF=="/"{printf "%d/%dGB (%s)\n", $3,$2,$5}')
memory=$(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')

getUPTIME=$(uptime -p)
uptime=${getUPTIME:3:-1}

getOS=$(sed -n 5p /etc/os-release)
os=${getOS:13:-1}

echo -e "${R}    _.-\"\"\"\"-._${NC}      \e[4m\e[1m$user@$host\e[0m\e[0m\t"
echo -e "${R}  .'          \`. ${NC}   ${P}=====================${NC}"
echo -e "${R} /      ${P}__      ${R}\ ${NC}  ${P}\e[1mos:\e[0m${NC} $os"
echo -e "${R}|     ${P}/@${R}@@${NC}${P}@\     ${R}|${NC}  ${P}\e[1mkernal:\e[0m${NC} $kernal"
echo -e "${R}|     ${P}@${R}@@@@${NC}${P}@     ${R}|${NC}  ${P}\e[1mdate:\e[0m${NC} $date"
echo -e "${R}|     ${P}\@${R}@@${NC}${P}@/     ${R}|${NC}  ${P}\e[1muptime:\e[0m${NC} $uptime"
echo -e "${R} \      ${P}‾‾      ${R}/ ${NC}  ${P}\e[1mdisk:\e[0m${NC} $disk"
echo -e "${R}  \`._        _.'${NC}    ${P}\e[1mmemory:\e[0m${NC} $memory"
echo -e "${R}     \`-....-'   ${NC}    ${P}\e[1mip:\e[0m${NC} $ip"
