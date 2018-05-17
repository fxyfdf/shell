i=0
for log_name in `cat log_name.txt`
do
for line in `cat ip.txt`
do
   ssh -p59522 root@$line "ps -ef |grep flume | grep  ${log_name}2.conf"
   ssh -p59522 root@$line "ps -ef |grep flume | grep  ${log_name}3.conf"
   echo $line
   i=$((i+1))
   echo "-------------------------$i---------$line-------------------------------"
done
done

