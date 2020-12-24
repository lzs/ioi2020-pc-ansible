#!/bin/sh

HOST=$1
TMPFILE=$(mktemp)
nmap --min-rtt-timeout 2 --max-rtt-timeout 5 -sn -PS22 -iL $HOST|awk '/scan report/ { print $5 }'|sort > $TMPFILE
comm -13 $TMPFILE $HOST
rm $TMPFILE
