for log_name in `cat log_name.txt`
do
for line in `cat ip.txt`
do
   ssh -p59522 root@$line "ps -ef |grep flume | grep  ${log_name}"
   echo $line
   echo "###################adfa#####adfa########sfs##################"
done
done



