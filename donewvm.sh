#!/bin/sh

TMPFILE=$(mktemp)

if [ ! -f ~/logs/hosts_new.ini ]; then
	echo No New hosts
	echo `date +%Y%m%d%H%M%S` No new hosts >> ~/logs/loop.log
	exit
fi

mv ~/logs/hosts_new.ini $TMPFILE
echo New hosts $(cat $TMPFILE | paste -sd,)
echo `date +%Y%m%d%H%M%S` New hosts contestdone $(cat $TMPFILE | paste -sd,) >> ~/logs/loop.log
ansible-playbook -l @$TMPFILE vmsetup/setup.yml --tags contestdone
#ansible-playbook -l @$TMPFILE vmsetup/setup.yml --tags init
#ansible-playbook -l @$TMPFILE statements/dist_statements.yml

echo SKIPPING New host processing

rm $TMPFILE
