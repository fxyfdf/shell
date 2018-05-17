#flume_dir="flume-1.7.0"
#flume_dir="flume-1.7.0"
#flume_dir="flume-1.7.0-ecgdbr"
flume_dir="flume-1.7.0-5nxpdx"
i=0
for line in `cat ip.txt`
do
i=$((i+1))
echo "----------$i------$line-------------" >> flume-start-all-5nxpdx.log
ssh -p52222 -tt   root@$line  >>flume-start-all-5nxpdx.log << EOF
    for log_name in \`cd /opt/elk/${flume_dir}/conf;ls *.conf |grep -v default\`
    do
        log_name=\${log_name}
        echo \$log_name
        flume_log_pid=\`ps -ef |grep flume| grep conf/\${log_name} | grep -v grep  |awk -F' ' '{print \\\$2}'\`
        if [ -z "\${flume_log_pid}" ];then
            su - hadoop -c " cd /opt/elk/${flume_dir} && ./start.sh \${log_name}" >/dev/null 2>&1
        fi
        echo \$flume_log_pid
    done
    exit
EOF

done
sed -i '/root\|fi\|flume\|name\|done\|exit\|logout\|Last\|echo\|do/d' flume-start-all-5nxpdx.log
dos2unix flume-start-all-5nxpdx.log
exit
