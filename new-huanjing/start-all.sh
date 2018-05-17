#!/usr/bin/expect
log_name=`cat log_name.txt`

for log_name in ${log_name}
do
   for line in `cat ip.txt`
   do
     ssh -p52222 -tt root@$line "su - hadoop -c 'cd /opt/elk/flume-1.7.0 && ./start.sh ${log_name}.conf' " >>/dev/null
     echo $line 
   done
done

