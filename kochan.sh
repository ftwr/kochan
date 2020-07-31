#!/bin/bash
#Script(test) anti-kochan made by @mihas
#
#
#      ,-.                          ,---,
#  ,--/ /|                        ,--.' |
#,--. :/ |     ,---.              |  |  :                         ,---,
#:  : ' /     '   ,'\             :  :  :                     ,-+-. /  |
#|  '  /     /   /   |    ,---.   :  |  |,--.    ,--.--.     ,--.'|'   |
#'  |  :    .   ; ,. :   /     \  |  :  '   |   /       \   |   |  ,"' |
#|  |   \   '   | |: :  /    / '  |  |   /' :  .--.  .-. |  |   | /  | |
#'  : |. \  '   | .; : .    ' /   '  :  | | |   \__\/: . .  |   | |  | |
#|  | ' \ \ |   :    | '   ; :__  |  |  ' | :   ," .--.; |  |   | |  |/
#'  : |--'   \   \  /  '   | '.'| |  :  :_:,'  /  /  ,.  |  |   | |--'
#;  |,'       `----'   |   :    : |  | ,'     ;  :   .'   \ |   |/
#'--'                   \   \  /  `--''       |  ,     .-./ '---'
#                        `----'                `--`---'
############################################################
lastlog=`ls -t /var/log/nginx.log*  | grep -v gz | head -n1`

cat $lastlog | awk {'print $3'}|sort|uniq >> /tmp/reestr.txt

reestr=( $(cat "/tmp/reestr.txt") )

i=0

for i in "${reestr[@]}"

do

grep $i $lastlog | awk '{sum+=$10} END {printf "%.0f\n", sum}' >> /tmp/in.txt

done

paste /tmp/in.txt /tmp/reestr.txt >> /tmp/result.txt

#############################################################
rst=/tmp/result.txt

file1=/tmp/in.txt

file2=/tmp/reestr.txt

rm -rf $file1 $file2

echo "Script done - now checking $rst" 
cat $rst
