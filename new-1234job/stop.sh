#!/usr/bin/expect
log_name=testtttt
for line in `cat ip.txt`
do
    echo `ssh -p 59522 root@$line "ps -ef | grep conf/${log_name}3conf | grep -v grep |awk '{print \\$2}'|xargs -n1 kill -15 "`
    echo `ssh -p 59522 root@$line "ps -ef | grep conf/${log_name}.conf | grep -v grep |awk '{print \\$2}'|xargs -n1 kill -15 "`
	  #ssh -p59522  root@$line " ps -ef | grep conf/add_bonus.conf | grep -v grep  |awk -F' ' '{print \\$2}'| xargs -n1 kill -15 ">>/dev/null
	  #ssh -p59522  root@$line "rm -rf /data/flume/checkpoint/add_bonus" >>/dev/null
	  #ssh -p59522  root@$line "rm -rf /data/flume/data/add_bonus" >>/dev/null
	  #ssh -p59522  root@$line "rm -rf /opt/elk/flume-1.7.0-ecgdbr/conf/add_bonus.conf" >>/dev/null
	  echo $line 
done

