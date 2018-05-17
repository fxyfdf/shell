flume_dir="flume-1.7.0"
#flume_dir="flume-1.7.0-ecgdbr"
for line in `cat ip.txt`
do
ssh -p52222 -tt   root@$line  >flume-start-all.log << EOF
	for log_name in \`cd /opt/elk/${flume_dir}/conf;ls *.conf |grep -v default\`
	do 
		log_name1=\${log_name}
		echo \$log_name1
		flume_log_pid=\`ps -ef |grep flume| grep conf/\${log_name} | grep -v grep  |awk -F' ' '{print \\\$2}'\`
		if [ -n "\${flume_log_pid}" ];then
			 kill -15 \${flume_log_pid}
		fi
		echo \$flume_log_pid
		echo $line
	done
	echo 11
	exit
EOF
exit
done
exit


