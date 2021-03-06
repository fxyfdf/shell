
#!/usr/bin/bash
#log_name="videogroup"
for log_name in `cat log_name.txt`
do
for line in `cat ip.txt`
do
  ssh -p59522 -tt root@$line "su - hadoop -c 'cd /opt/elk/flume-1.7.0 && ./start.sh ${log_name}.conf' " >>/dev/null
  sleep 1
  ssh -p59522 -tt root@$line "su - hadoop -c 'cd /opt/elk/flume-1.7.0-dftthadoop2 && ./start.sh ${log_name}2.conf' " >>/dev/null
  sleep 1
  ssh -p59522 -tt root@$line "su - hadoop -c 'cd /opt/elk/flume-1.7.0-ecgdbr && ./start.sh ${log_name}3.conf' " >>/dev/null
  sleep 1
  ssh -p59522 -tt root@$line "su - hadoop -c 'cd /opt/elk/flume-1.7.0-tefam0 && ./start.sh ${log_name}4.conf' " >>/dev/null
  echo $line  
  sleep 1
done
done
for log_name in `cat log_name.txt`
do
for line in `cat ip.txt`
do
   ssh -p59522 root@$line "ps -ef |grep flume | grep  ${log_name}.conf"
   echo $line
done
done
