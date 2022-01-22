#!/usr/bin/env bash
# Author: Abhijeet Singh (@abhiunix)
# Date: 23 Jan 2022
# Twitter: https://twitter.com/abhiunix

echo "Installing and setting up the backup script."
echo ""

if [ -x "$(which zip)" ] ; then
  echo ""
else
    echo "Could not find zip command, please install." >&2
    echo "Most linux OS uses this command to install zip. $apt install zip. If you are on macOS then run this command: $brew install zip"
    exit
fi

if [ -e $HOME/.config/uniqXkeys/uniqXkeys.conf ]; then 
echo "uniqXkeys.conf File exists."
echo ""
echo "Below are the contents of $HOME/.config/uniqXkeys/uniqXkeys.conf "
echo ""
cat $HOME/.config/uniqXkeys/uniqXkeys.conf
echo ""
echo ""
read -p "Do you want to update it?[yes/no] " in3
echo ""

    if [[ $in3 = "yes" ]]; then
      read -p "Please enter your new telegram_apikey: " in1
      read -p "Please update your new telegram_chat_id: " in2
      echo ""
      echo "" > $HOME/.config/uniqXkeys/uniqXkeys.conf
      echo "telegram_apikey=$in1" >> $HOME/.config/uniqXkeys/uniqXkeys.conf
      echo "telegram_chat_id=$in2" >> $HOME/.config/uniqXkeys/uniqXkeys.conf
      echo ""
      echo "telegram_apikey and telegram_chat_id has been updated successfully"
      

    elif [[ $in3 = "no" ]]; then
      echo ""
      echo "Thankyou!"
      echo ""
      sleep 1
    fi


else 
echo "uniqXkeys.conf file doesn't exists" 
echo ""
echo "Set-up the telegram_apikey and telegram_chat_id "
echo ""
mkdir -p $HOME/.config/uniqXkeys/
touch $HOME/.config/uniqXkeys/uniqXkeys.conf
echo ""
read -p "Please enter your telegram_apikey: " in1
read -p "Please enter your telegram_chat_id: " in2
echo ""
echo "telegram_apikey=$in1" >> $HOME/.config/uniqXkeys/uniqXkeys.conf
echo "telegram_chat_id=$in2" >> $HOME/.config/uniqXkeys/uniqXkeys.conf
echo ""
echo "telegram_apikey and telegram_chat_id has been set."
fi 

chmod 777 *
echo "Setting up backup.py in /usr/local/bin/ as 'backup'."
cp backup.py backup
sudo cp backup /usr/local/bin/
echo "Giving executable permission for /usr/local/bin/backup"
sudo chmod 777 /usr/local/bin/backup
rm -r backup
echo "Great!! Now you can use 'backup' from anywhere. Just type 'backup'."
