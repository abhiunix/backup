# backup everything using your telegram bot.


A script to create a backup of the files in current directory and sending it to your telegram bot.

## Installation:
```
./installer.sh
```
Provide your telegram_apikey and telegram_chat_id.
 
 ![](https://raw.githubusercontent.com/abhiunix/images/main/1.png)


# To get your own telegram_apikey & telegram_chat_id:

## Get your telegram_apikey:

Open Telegram and search for @BotFather, send him a “/start” message or click on "https://t.me/BotFather".
> ![](https://raw.githubusercontent.com/abhiunix/notify/master/Supporting_Material/step1.png)


Now Send another message “/newbot” then follow the instructions to setup a name and a username.
> ![](https://raw.githubusercontent.com/abhiunix/notify/master/Supporting_Material/step2.png)



You will get your token to access the HTTP API, this HTTP API token is your bot_token.
> ![](https://raw.githubusercontent.com/abhiunix/notify/master/Supporting_Material/step3.png)

### Get your telegram_chat_id:

Now Open Telegram and search for @chat_id_echo_bot, send him a “/start” message or click on "[https://t.me/chat_id_echo_bot](https://t.me/get_my_telegram_chat_id_bot)" to get your telegram_chat_id .
> ![](https://raw.githubusercontent.com/abhiunix/images/main/2.png)


# Usage:
```
Usage of backup
Basic: Go to any desired directory and enter `backup`. You will get backup of your current directory on your telegram bot.
  
  $ backup

  $ crtsh -d abhiunix.in | tee abhiunix.subdmains.txt ; backup

  $ sqlmap -u http://testphp.vulnweb.com/artists.php?artist=2 --dbs --banner --batch | tee output.txt ; backup
```

### Demo:


> ![](https://raw.githubusercontent.com/abhiunix/images/master/usage.gif)


