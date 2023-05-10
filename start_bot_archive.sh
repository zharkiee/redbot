#!/bin/ash
scriptstart=1
while [ $scriptstart -gt 0 ]; do
echo "Checking for '~/redenv'..."
sleep 2
if [ ! -d ~/redenv ]; then
echo "Missing '~/redenv'"
sleep 1
echo "Installing 'redenv' and 'Red-DiscordBot'..."
sleep 2
python -m venv ~/redenv
source ~/redenv/bin/activate
python -m pip install -U pip psutil setuptools wheel
python -m pip install -U Red-DiscordBot
clear
echo "'Red-DsicordBot' installed. Starting instance..."
sleep 2
redbot-setup --no-prompt --instance-name $BN --data-path /app/$BN &&redbot $BN --token $TOKEN --prefix $PF
else
clear
echo "'~/redenv' exists."
sleep 1
echo "Checking if '/app/$BN' exists..."
sleep 1
if [ ! -d /app/$BN ]; then
echo "Missing '/app/$BN'!"
echo "Creating discord bot with supplied settings..."
sleep 2
source ~/redenv/bin/activate
redbot-setup --no-prompt --instance-name $BN --data-path /app/$BN &&redbot $BN --token $TOKEN --prefix $PF
else
clear
echo "Necessary dirs and files exists."
echo "Starting discord bot..."
sleep 1
source ~/redenv/bin/activate
redbot $BN --token $TOKEN --prefix $PF
fi
fi
done