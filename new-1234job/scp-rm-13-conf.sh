#!/usr/bin/bash
#log_name1

for log_name in `cat log_name.txt`
do
for line in `cat ip.txt`
do
  ssh -p59522 $line "rm -f /opt/elk/flume-1.7.0/conf/${log_name}.conf"
  ssh -p59522 $line "rm -rf /data/flume/checkpoint/${log_name}"
  ssh -p59522 $line "rm -rf /data/flume/data/${log_name}"
  
  #log_name3
  ssh -p59522 $line 'rm -f /opt/elk/flume-1.7.0-ecgdbr/conf/${log_name}3.conf'
  ssh -p59522 $line "rm -rf /data/flume/checkpoint/${log_name}3"
  ssh -p59522 $line "rm -rf /data/flume/data/${log_name}3"
 
 echo $line
done
done
#验证是否复制并创建成功

for line in `cat ip.txt`
do
  ssh -p59522 $line "ls /opt/elk/flume-1.7.0/conf/${log_name}.conf"
  ssh -p59522 $line "ls /opt/elk/flume-1.7.0-ecgdbr/conf/${log_name}3.conf"
  ssh -p59522 $line "ls /data/flume/checkpoint/${log_name}*"
  ssh -p59522 $line "ls /data/flume/data/${log_name}*"
done 
