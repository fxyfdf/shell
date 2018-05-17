flume_dir="flume-1.7.0-s5qy3"
i=0
for line in `cat ip.txt`
do
i=$((i+1))
echo "----------$i------$line-------------" >> flume-stop-1.7.0-conf.log
for conf_name in `cat conf_name.txt`
do
ssh -p59522 -tt   root@$line  >>flume-stop-1.7.0-conf.log << EOF
        log_name=${conf_name}.conf
        echo \$log_name
        flume_log_pid=\`ps -ef |grep flume| grep conf/\${log_name} | grep -v grep  |awk -F' ' '{print \\\$2}'\`
        if [ -n "\${flume_log_pid}" ];then
		kill -15 \${flume_log_pid}
        fi
        flume_log_pid=\`ps -ef |grep flume| grep conf/\${log_name} | grep -v grep  |awk -F' ' '{print \\\$2}'\`
        echo \$flume_log_pid
    done
    exit
EOF
done
done
sed -i '/root\|fi\|flume\|name\|done\|exit\|logout\|Last\|echo\|do/d' flume-stop-1.7.0-conf.log
dos2unix flume-stop-1.7.0-conf.log
exit
