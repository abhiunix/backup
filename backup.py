#!/usr/bin/env python3
# Author: Abhijeet Singh (@abhiunix)
# Date: 23 Jan 2022
# Twitter: https://twitter.com/abhiunix

import requests
import os
from datetime import date
import time
import subprocess 


#Please put your telegram_apikey & telegram_chat_id in uniqXkeys.conf file. Location $HOME/.config/uniqXkeys/uniqXkeys.conf


home =  subprocess.Popen("echo $HOME", shell=True, stdout=subprocess.PIPE).stdout
enc_home =  home.read()
str1=enc_home.decode().strip()
conf='/.config/uniqXkeys/uniqXkeys.conf'

fileName = str1+conf
fileObj = open(fileName)

params={}

for line in fileObj:
	line = line.strip()
	key_value=line.split("=")
	if len(key_value) == 2:
		params[key_value[0]] = key_value[1]

telegram_apikey = params['telegram_apikey']
telegram_chat_id = params['telegram_chat_id']


currentdate = date.today()
t = time.localtime()
currentTime = time.strftime("%H-%M-%S", t)

currentDir=str(os.getcwd())

os.system("zip -r {}-{}.backup.zip .".format(currentdate, currentTime))
files={'document':open('{}-{}.backup.zip'.format(currentdate, currentTime),'rb')}
resp= requests.post('https://api.telegram.org/bot{}/sendDocument?chat_id={}&caption=backup of {} {}-{}.backup.zip'.format(telegram_apikey,telegram_chat_id,currentDir, currentdate, currentTime), files=files)

os.system("rm -r *.zip")

print("{}-{}-backup.zip sent to telegram.".format(currentdate, currentTime))

print("If you are not getting the file on your telegram, please make sure you have installed the script correctly. Run $bash installer.sh")