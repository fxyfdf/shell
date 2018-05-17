#flume_dir="flume-1.7.0"
#flume_dir="flume-1.7.0"
flume_dir="flume-1.7.0-ecgdbr"
i=0
for line in `cat ip.txt`
do
i=i+1
echo "----------$i------$line-------------" >> flume-start-all.log
ssh -p52222 -tt   root@$line  >>flume-start-all.log << EOF
    echo "----------$i------$line-------------"
    for log_name in \`cd /opt/elk/${flume_dir}/conf;ls *.conf |grep -v default\`
    do
        log_name=\${log_name}
        echo \$log_name
        flume_log_pid=\`ps -ef |grep flume| grep conf/\${log_name} | grep -v grep  |awk -F' ' '{print \\\$2}'\`
	
        if [ -n "\${flume_log_pid}" ];then
		kill -15 flume_log_pid
        fi
        echo \$flume_log_pid
    done
    exit
EOF

done
exit
