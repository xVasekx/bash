#!/bin/bash

flock -w 0 ./script.lock ./apache_logs.sh > otchet.txt

if [ $? -eq 0 ]
then
	echo "Файл не заблокирован"
	cat otchet.txt | mail "user1@test.com,user2@example.com"
#	rm otchet.txt
#	rm script.lock
#	rm time
else
	echo "Файл заблокирован"
fi
