#!/bin/sh

echo $(cat /opt/ioi/misc/VERSION) $( (cat /etc/sudoers /etc/sudoers.d/* /opt/ioi/misc/VERSION; \
        iptables -L -n; \
        grep -v ioi /etc/passwd; \
        grep -v ioi /etc/shadow ) \
        | sha256sum | cut -d\  -f1)