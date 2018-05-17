#!/usr/bin/bash
#log_name1

for log_name in `cat log_name.txt`
do
for line in `cat ip.txt`
do
  ssh -p59522 $line "mkdir -p /data/flume/"
  ssh -p59522 $line 'chown -R hadoop:hadoop /data/flume'
  sed -i "26c a1.sinks.k1.hdfs.fileSuffix = .log.$line" ${log_name}.conf
  scp -P59522  ${log_name}.conf  $line:/opt/elk/flume-1.7.0/conf/
  ssh -p59522 $line 'chown -R hadoop:hadoop /opt/elk/'
  ssh -p59522 $line "su - hadoop -c 'mkdir -p /data/flume/checkpoint/${log_name}'"
  ssh -p59522 $line "su - hadoop -c 'mkdir -p /data/flume/data/${log_name}'"
  ssh -p59522 $line 'chown -R hadoop:hadoop /data/flume/checkpoint/'
  ssh -p59522 $line 'chown -R hadoop:hadoop /data/flume/data/'
  
  #log_name3
  sed -i "26c a1.sinks.k1.hdfs.fileSuffix = .log.$line" ${log_name}3.conf
  scp -P59522  ${log_name}3.conf  $line:/opt/elk/flume-1.7.0-ecgdbr/conf/
  ssh -p59522 $line 'chown -R hadoop:hadoop /opt/elk/'
  ssh -p59522 $line "su - hadoop -c 'mkdir -p /data/flume/checkpoint/${log_name}3'"
  ssh -p59522 $line "su - hadoop -c 'mkdir -p /data/flume/data/${log_name}3'"
  ssh -p59522 $line 'chown -R hadoop:hadoop /data/flume/checkpoint/'
  ssh -p59522 $line 'chown -R hadoop:hadoop /data/flume/data/'
 
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
