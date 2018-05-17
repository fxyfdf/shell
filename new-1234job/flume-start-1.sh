#!/usr/bin/bash
#log_name="videogroup"

i=0
for line in `cat ip.txt`
do
for log_name in `cat log_name.txt`
do
i=$((i+1))
echo "----------$i------$line-------------" >> flume-start-1.log

ssh -p59522 -tt root@$line >>flume-start-1.log << EOF
#1flume-1.7.0
log_name1="${log_name}.conf"
echo \$log_name1
flume_log_pid1=\`ps -ef |grep flume| grep conf/\${log_name1} | grep -v grep  |awk -F' ' '{print \\\$2}'\`
if [ -z "\${flume_log_pid1}" ];then
    su - hadoop -c " cd /opt/elk/flume-1.7.0 && ./start.sh \${log_name1}" >/dev/null 2>&1
fi
echo \$flume_log_pid1
exit
EOF

done
done
sed -i '/root\|fi\|flume\|name\|done\|exit\|logout\|Last\|echo\|do/d' flume-start-1.log
dos2unix flume-start-1.log
exit 

