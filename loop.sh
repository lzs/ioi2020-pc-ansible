#!/bin/sh

while true; do
	echo `date +%Y%m%d%H%M%S` $$ Start New VM >> ~/logs/loop.log
 	./donewvm.sh
	sleep 10
	echo `date +%Y%m%d%H%M%S` $$ New host keys >> ~/logs/loop.log
	ansible-playbook -l @hosts_online.ini vmsetup/checkkey.yml
	echo `date +%Y%m%d%H%M%S` $$ Done New VM >> ~/logs/loop.log
	sleep 10
done
