#!/usr/bin/expect
for line in `cat ip.txt`
do
    echo `ssh -p 59522 root@$line "ps -ef | grep conf/onclicklog.conf | grep -v grep |awk '{print \\$2}'|xargs -n1 kill -15 "`
    echo `ssh -p 59522 root@$line "ps -ef | grep conf/unionshowlog.conf | grep -v grep |awk '{print \\$2}'|xargs -n1 kill -15 "`
	  #ssh -p59522  root@$line " ps -ef | grep conf/add_bonus.conf | grep -v grep  |awk -F' ' '{print \\$2}'| xargs -n1 kill -15 ">>/dev/null
	  ssh -p59522  root@$line "rm -rf /data/flume/checkpoint/add_bonus" >>/dev/null
	  ssh -p59522  root@$line "rm -rf /data/flume/data/add_bonus" >>/dev/null
	  ssh -p59522  root@$line "rm -rf /opt/elk/flume-1.7.0/conf/onclicklog.conf" >>/dev/null
	  ssh -p59522  root@$line "rm -rf /opt/elk/flume-1.7.0/conf/unionshowlog.conf" >>/dev/null
	  echo $line 
done

