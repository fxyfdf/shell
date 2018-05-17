
#!/usr/bin/bash
#log_name="videogroup"
for log_name in `cat log_name.txt`
do
for line in `cat ip.txt`
do
  ssh -p59522 -tt root@$line "su - hadoop -c 'cd /opt/elk/flume-1.7.0-ecgdbr && ./start.sh ${log_name}3.conf' " >>/dev/null
  echo $line  
done
done
for log_name in `cat log_name.txt`
do
for line in `cat ip.txt`
do
   ssh -p59522 root@$line "ps -ef |grep flume | grep  ${log_name}3.conf"
   echo $line
done
done
