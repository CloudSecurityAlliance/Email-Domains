#!/bin/bash

rm email2sms.csv
rm email2sms.csv.stripped
rm sms_mms_gateways.txt
rm sms_mms_gateways.txt.stripped


wget https://raw.githubusercontent.com/mfitzp/List_of_SMS_gateways/master/email2sms.csv
sed 's/,/\n/g' email2sms.csv  | grep @ | cut -d"@" -f2 | cut -d" " -f1 | sort | uniq > email2sms.csv.stripped

wget https://raw.githubusercontent.com/cubiclesoft/email_sms_mms_gateways/master/sms_mms_gateways.txt
sed 's/"/\n/g' sms_mms_gateways.txt  | grep @ | cut -d"@" -f2 | cut -d" " -f1 | sort | uniq > sms_mms_gateways.txt.stripped

cat email2sms.csv.stripped sms_mms_gateways.txt.stripped | sort | uniq > consolidated-sms-mms.txt

