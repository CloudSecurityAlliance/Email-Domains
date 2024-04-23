#!/bin/bash

wget https://raw.githubusercontent.com/disposable-email-domains/disposable-email-domains/master/disposable_email_blocklist.conf
wget https://raw.githubusercontent.com/disposable/disposable-email-domains/master/domains.txt
wget https://raw.githubusercontent.com/disposable/static-disposable-lists/master/generator-email-hosts.txt
wget https://raw.githubusercontent.com/stopforumspam/disposable_email_domains/master/blacklist.txt

grep -hv "#" blacklist.txt disposable_email_blocklist.conf domains.txt generator-email-hosts.txt | grep -v "*" | sort | uniq > consolidated-disposable.txt
