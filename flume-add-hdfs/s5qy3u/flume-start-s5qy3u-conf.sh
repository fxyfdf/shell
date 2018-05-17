flume_dir="flume-1.7.0-s5qy3u"
i=0
for line in `cat ip.txt`
do
i=$((i+1))
echo "----------$i------$line-------------" >> flume-start-s5qy3u-conf.log
for conf_name in `cat conf_name.txt`
do
ssh -p59522 -tt   root@$line  >>flume-start-s5qy3u-conf.log << EOF
        log_name="${conf_name}6.conf"
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
done
sed -i '/root\|fi\|flume\|name\|done\|exit\|logout\|Last\|echo\|do/d' flume-start-s5qy3u-conf.log
dos2unix flume-start-s5qy3u-conf.log
exit

